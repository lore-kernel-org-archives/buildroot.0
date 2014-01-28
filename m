From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Jan 2014 21:11:20 +0100
Subject: [Buildroot] [PATCH 0/5 v3] Ensure files we modify are writable
Message-ID: <cover.1390939719.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series ensures that target/ and our copies of the .config files are
writeable.

In case the Buildroot tree is RO (eg. shared via a read-only NFS mount),
target/ would end-up read-only, which is a bit awkward, since we won't be
able to add files in there. Ditto for the busybox', uClibc's, and Linux'
.config files, since we need to tweak them with sed.

I've had this locally for some time now, grabbed from some patches in
patchwork. A previous submission of this series has been marked as
"Changes Requested", but there's no trace of it in the ML, so I'm just
re-spinning them as-is for further comments.


Changes v2 -> v3:
  - small nit and typoes (Danomi, Thomas)
                                                                                                                                                                                      ?
Changes v1 -> v2:                                                                                                                                                                     ?
  - add three other files to the list  (Danomi)                                                                                                                                       ?


Regards,
Yann E. MORIN.


----------------------------------------------------------------
Nathan Lynch (2):
      target: ensure target/ dir is writable
      busybox: ensure $(BUSYBOX_BUILD_CONFIG) is writable

Yann E. MORIN (3):
      linux: ensure buildroot_defconfig is writable
      package/uClibc: ensure .config is writable
      fs: ensure $(TARGET_DIR_WARNING_FILE) is writable

 Makefile                   | 6 +++---
 fs/common.mk               | 2 +-
 linux/linux.mk             | 2 +-
 package/busybox/busybox.mk | 2 +-
 package/uclibc/uclibc.mk   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
