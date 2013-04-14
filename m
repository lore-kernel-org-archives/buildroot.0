From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Apr 2013 19:31:03 +0200
Subject: [Buildroot] Failure at: linux 3.7.8 Installing to target
In-Reply-To: <1365886506.4087.37.camel@station1> (Ormund Williams's message of
 "Sat, 13 Apr 2013 16:55:06 -0400")
References: <1365886506.4087.37.camel@station1>
Message-ID: <87ip3pow88.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ormund" == Ormund Williams <ormundw@panix.com> writes:

 Ormund> I seem to be getting a similar error one that was reported a few months
 Ormund> ago but instead of failing at kernel build time it now fails at the
 Ormund> install stage:

 >>>> linux 3.7.8 Installing to target
 Ormund> # dtbs moved from arch/RCH/boot to arch/RCH/boot/dts since 3.8-rc1
 Ormund> cp  /home/ormund/projects/atlantic/buildroot-2013.02/output/images/
 Ormund> cp: missing destination file operand after `/home/ormund/projects/atlantic/buildroot-2013.02/output/images/'
 Ormund> Try `cp --help' for more information.
 Ormund> make: *** [/home/ormund/projects/atlantic/buildroot-2013.02/output/build/linux-3.7.8/.stamp_target_installed] Error 1

Probably you misspelled the dtb filename. Verify that the name you
selected in BR2_LINUX_KERNEL_INTREE_DTS_NAME exists under arch/<ARCH>/boot/.

-- 
Bye, Peter Korsgaard
