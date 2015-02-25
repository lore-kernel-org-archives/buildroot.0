From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 25 Feb 2015 22:35:44 +0100
Subject: [Buildroot] [PATCH v1] directfb-examples fix bfin compile
Message-ID: <1424900145-26962-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following patch fixes the directfb-examples compile for bfin/static,
at least the linking.

At the install step the next error is:

	$ host/usr/bin/bfin-uclinux-strip target/usr/bin/df_andi
host/usr/bin/bfin-uclinux-strip:target/usr/bin/df_andi: File format not recognized

The toolchain bfin-uclinux-strip command seems not supporting static executables,
only elf32 ones...

Any suggestions how to handle this? Disable strip?

Regards,
Peter

Peter Seiderer (1):
  directfb-examples: explicitly add -lstdc++ for static build

 package/directfb-examples/directfb-examples.mk | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.1.4
