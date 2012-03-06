From: Joshua Jackson <jjackson@vortech.net>
Date: Tue, 6 Mar 2012 11:46:06 -0500
Subject: [Buildroot] missing reference to libm for MicroPerl
Message-ID: <CADxd2g8k8X=xNBWdE=dSbCUnkupecS1LdDZwiVYKiYTry1Uo4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am currently running into an issue with the compilation of MicroPerl
fails with a missing libm reference. I found the following patch that
was date from a couple years ago:

This fixes builds on my system, but I'm not sure what else it might break.

Is there another fix / setting I might be missing to prevent the need
for this patch?

I am using a CentOS 6 x86_64 host and am compiling for a i586 x86_32 target.

Thanks,
Josh

Patch against 2012.2 follows:


diff -uNr a/package/microperl/microperl.mk b/package/microperl/microperl.mk
--- a/package/microperl/microperl.mk    2012-02-29 17:19:47.000000000 -0500
+++ b/package/microperl/microperl.mk    2012-03-01 17:16:01.000000000 -0500
@@ -40,6 +40,7 @@
        $(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/Makefile
        $(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/x2p/Makefile
        $(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/makefile
+       $(SED) 's/^libs =/libs = -lm/g' $(MICROPERL_DIR)/makefile
        $(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/x2p/makefile
        touch $@
