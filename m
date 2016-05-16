From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 May 2016 21:35:44 +0200
Subject: [Buildroot] [PATCH] uboot-tools: bump to version 2016.05
In-Reply-To: <1463426487-18372-1-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Mon, 16 May 2016 16:21:27 -0300")
References: <1463426487-18372-1-git-send-email-festevam@gmail.com>
Message-ID: <871t51g5in.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Signed-off-by: Fabio Estevam <festevam@gmail.com>
 > ---
 >  package/uboot-tools/uboot-tools.hash | 2 +-
 >  package/uboot-tools/uboot-tools.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
 > index 747d133..2076b3b 100644
 > --- a/package/uboot-tools/uboot-tools.hash
 > +++ b/package/uboot-tools/uboot-tools.hash
 > @@ -1,2 +1,2 @@
 >  # Locally computed:
 > -sha256  e49337262ecac44dbdeac140f2c6ebd1eba345e0162b0464172e7f05583ed7bb  u-boot-2016.03.tar.bz2
 > +sha256  87d02275615aaf0cd007b54cbe9fbadceef2bee7c79e6c323ea1ae8956dcb171  u-boot-2016.05.tar.bz2
 > diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
 > index d1ebd6f..987e89b 100644
 > --- a/package/uboot-tools/uboot-tools.mk
 > +++ b/package/uboot-tools/uboot-tools.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -UBOOT_TOOLS_VERSION = 2016.03
 > +UBOOT_TOOLS_VERSION = 2016.05
 >  UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 >  UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 >  UBOOT_TOOLS_LICENSE = GPLv2+

What about the patches?

make uboot-tools-patch
u-boot-2016.05.tar.bz2: OK (sha256: 87d02275615aaf0cd007b54cbe9fbadceef2bee7c79e6c323ea1ae8956dcb171)
>>> uboot-tools 2016.05 Extracting
bzcat /var/lib/downloads/u-boot-2016.05.tar.bz2 | tar --strip-components=1 -C /home/peko/source/buildroot/output/build/uboot-tools-2016.05   -xf -
>>> uboot-tools 2016.05 Patching

Applying 0001-drop-configh-from-tools.patch using patch:
patching file tools/env/fw_env.h
Hunk #1 succeeded at 8 with fuzz 2 (offset 3 lines).

Applying 0002-tools-only-in-no-dot-config-targets.patch using patch:
patching file Makefile
Hunk #1 succeeded at 424 (offset 7 lines).

Applying 0003-tools-env-bug-config-structs-must-be-defined-in-tool.patch using patch:
patching file tools/env/fw_env.c
Reversed (or previously applied) patch detected!  Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file tools/env/fw_env.c.rej
patching file tools/env/fw_env_main.c
Reversed (or previously applied) patch detected!  Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file tools/env/fw_env_main.c.rej
Patch failed!  Please fix 0003-tools-env-bug-config-structs-must-be-defined-in-tool.patch!
package/pkg-generic.mk:159: recipe for target '/home/peko/source/buildroot/output/build/uboot-tools-2016.05/.stamp_patched' failed
make: *** [/home/peko/source/buildroot/output/build/uboot-tools-2016.05/.stamp_patched] Error 1

-- 
Venlig hilsen,
Peter Korsgaard 
