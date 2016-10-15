From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Oct 2016 10:15:51 +0200
Subject: [Buildroot] [PATCH 0/2] core/legal-info: don't generate big file
	with all license texts
Message-ID: <cover.1476519329.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This little series removes the generation of the big file that contains
all license texts.

So far, we expected that all license files were plain text, so we could
concatenate all of them into a big file.

However, not all packages provide plain text license files; some provide
a PDF or an RTF file. Those can not be easily added to that big file.

Furthermore, the license files are already aved individually, in a
per-package directory.

Removing that big file will allow us to list binary files as license
files. A user interesting with still having all licenses in a single
file can still reconstruct it by his own means.


Regards,
Yann E. MORIN.


The following changes since commit 8e1625b8d35623559e7dbffae8982c6e737d5304

  package/x11r7/xlib_libXxf86dga: needs MMU (2016-10-15 00:44:54 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 52e41b4a3aab9e9d50ace8aee2501becc5080bb8

  core/legal-info: don't generate big file with all license texts (2016-10-15 10:00:08 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      core/legal-info: save empty string when no license file
      core/legal-info: don't generate big file with all license texts

 Makefile               |  2 --
 package/pkg-generic.mk |  2 --
 package/pkg-utils.mk   | 12 ------------
 3 files changed, 16 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
