From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Nov 2013 18:45:07 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/patchwork
Message-ID: <cover.1384191560.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series ensures that taregt/ and our copy of busybox .config are
writeable.

In case the Buildroot tree is RO (eg. shared via a read-only NFS mount),
target/ would end-up read-only, which is a bit awkward, since we won't be
able to add files in there. Ditto for the busybox' .config file, since we
need to tweak it with sed.

I've had this locally for some time now, grabbed from some patches in
patchwork. A previous submission of this series has been marked as
"Changes Requested", but there's no trace of it in the ML, so I'm just
re-spinning them as-is for further comments.

Regards,
Yann E. MORIN.


The following changes since commit 6d93f061eccad3b81a27e8cf02cb8b29e9dba44e:

  ethtool: bump version to 3.12.1 (2013-11-11 15:06:57 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/patchwork

for you to fetch changes up to 0b4acecdd3e9fb7d9510c206338ebbdfa483ca9e:

  busybox: ensure $(BUSYBOX_BUILD_CONFIG) is writable (2013-11-11 16:23:04 +0100)

----------------------------------------------------------------
Nathan Lynch (2):
      target: ensure target/ dir is writable
      busybox: ensure $(BUSYBOX_BUILD_CONFIG) is writable

 Makefile                   | 4 ++--
 package/busybox/busybox.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
