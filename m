From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Jul 2011 22:16:36 +0200
Subject: [Buildroot] BR2_PREFER_STATIC_LIB and external toolchain
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6047C5D@ex-mb1.corp.adtran.com>
 (ANDY KENNEDY's message of "Mon, 25 Jul 2011 20:07:45 +0000")
References: <F9C551623D2CBB4C9488801D14F864C6047C5D@ex-mb1.corp.adtran.com>
Message-ID: <87r55e15gb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:

 ANDY> When I select both PREFER_STATIC and external toolchain, I get .so's 
 ANDY> copied to the RFS from the external toolchain.  Would it cause anyone
 ANDY> any heartburn if I we make the install to target dependant on
 ANDY> PREFER_STATIC?  I'll do up the patches, I just want to know if that
 ANDY> would upset anyone before I send out the patch ;).

Yes, I noticed as well today. Unfortunately it isn't as simple as making
copy_toolchain_lib_root a noop with static linking, as E.G. glibc afaik
still needs libnss*.so* in the target rootfs when static linking is
used.

-- 
Bye, Peter Korsgaard
