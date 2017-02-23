From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Feb 2017 22:29:19 +0100
Subject: [Buildroot] [PATCH 0/2] package/directfb,sdl: fix static link
Message-ID: <cover.1487885342.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fix (works around) static linking to SDL+DirectFB, by
hacking the corresponding .pc files:

  - include -lstdc++ to DirectFB's Libs.Private
  - include 'directfb' to SDL's Requires


Regards,
Yann E. MORIN.


The following changes since commit c8b2bd81a1a5401c10287f2d5c6c8b4a14994764

  trousers: update ARC comment (2017-02-23 22:08:39 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 3817238a2bff47662b0f46d309fd2d12b31da877

  package/sdl: fix .pc file (2017-02-23 22:21:16 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/directfb: hack .pc file for static link
      package/sdl: fix .pc file

 package/directfb/directfb.mk | 6 ++++++
 package/sdl/sdl.mk           | 5 +++++
 2 files changed, 11 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
