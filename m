From: Michal Sojka <sojka@merica.cz>
Date: Fri, 16 May 2014 17:22:55 +0200
Subject: [Buildroot] [PATCH v2 0/1] Rebuild packages when their external
	config is updated
Message-ID: <1400253776-21759-1-git-send-email-sojka@merica.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

this is a follow up to the previous discussion at
http://lists.busybox.net/pipermail/buildroot/2014-May/095532.html
(Rebuild busybox when an external config is updated).

With this updated patch, I try to address the concerns raised there. The
concerns were:

1) Buildroot doesn't try to be smart to detect what needs to be rebuilt.

   That's true, but buildroot is smart enough to rebuild the package
   after "make $(pkg)-menuconfig". This patch extends the smartness a
   bit by considering not only the -menuconfig invocation but also the
   change of the external config.

2) This must be implemented consistelntly for all packages where the
   user can provide a .config.

   The functionality is now implemented in pkg-generic.mk so it applies
   to all packages.

If people agree with this I'll update the manual as well.

Best regards,
-Michal

Michal Sojka (1):
  Rebuild packages when their external config is updated

 boot/barebox/barebox.mk    |  4 ++--
 linux/linux.mk             | 10 +++++-----
 package/busybox/busybox.mk |  2 +-
 package/pkg-generic.mk     | 17 +++++++++++++++++
 package/uclibc/uclibc.mk   |  2 +-
 5 files changed, 26 insertions(+), 9 deletions(-)

-- 
2.0.0.rc2
