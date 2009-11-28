From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 28 Nov 2009 11:40:35 +0100
Subject: [Buildroot] Build jobbing
In-Reply-To: <200911271616.16112.minimod@morethan.org> (Michael S. Zick's
	message of "Fri\, 27 Nov 2009 16\:16\:13 -0600")
References: <200911271522.58858.minimod@morethan.org>
	<877htb638c.fsf@macbook.be.48ers.dk>
	<200911271610.08010.minimod@morethan.org>
	<200911271616.16112.minimod@morethan.org>
Message-ID: <873a3z53vg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

Hi,

 Michael> nbd-server.c:267: Incompatible implicit declaration of built-in function "index"
 Michael> Disabled, continuing.

It sounds like the patches somehow didn't get applied - What does
output/build/nbd-2.9.11/.applied_patches_list contain?

It should contain:

cat output/build/nbd-2.9.11/.applied_patches_list
nbd-fix-build-with-disable-lfs.patch
nbd-server-fix-read-eagain.patch
nbd-server-susv3-legacy.patch

Can you rm output/build/nbd-2.9.11 and try again, and this time check if
nbd-server-susv3-legacy.patch gets applied?

-- 
Bye, Peter Korsgaard
