From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 23:55:49 +0100
Subject: [Buildroot] [PATCH v1] directfb-examples fix bfin compile
In-Reply-To: <1424900145-26962-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Wed, 25 Feb 2015 22:35:44 +0100")
References: <1424900145-26962-1-git-send-email-ps.report@gmx.net>
Message-ID: <87a900470q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The following patch fixes the directfb-examples compile for bfin/static,
 > at least the linking.

 > At the install step the next error is:

 > 	$ host/usr/bin/bfin-uclinux-strip target/usr/bin/df_andi
 > host/usr/bin/bfin-uclinux-strip:target/usr/bin/df_andi: File format not recognized

 > The toolchain bfin-uclinux-strip command seems not supporting static executables,
 > only elf32 ones...

 > Any suggestions how to handle this? Disable strip?

Yes, we do stripping globally in target-finalize if enabled, so the
individual packages shouldn't strip.

-- 
Bye, Peter Korsgaard
