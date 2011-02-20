From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Feb 2011 08:21:19 +0100
Subject: [Buildroot] Moving from 2.6.36.1 to 2.6.35.11 (or perhaps
	2.6.35.9)
In-Reply-To: <AANLkTikMqQa2b8VALCFzCvhzhLGokgjjeu5jwWgbspv1@mail.gmail.com>
	(Charles Krinke's message of "Sat, 19 Feb 2011 15:21:47 -0800")
References: <AANLkTikMqQa2b8VALCFzCvhzhLGokgjjeu5jwWgbspv1@mail.gmail.com>
Message-ID: <87pqqndvdc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

Hi,

 Charles> My group desires to use the 2.6.35.11 kernel as it is listed
 Charles> as a longterm stable kernel instead of the 2.6.36.1 buildroot
 Charles> currently supports <sigh>.

Ok.

 Charles> In looking at at buildroot, it appears that changine
 Charles> buildroot-2010.11/.config BR2_DEFAULT_KERNEL_HEADERS *and*
 Charles> linux/Config.in (3 places) would do it to change to an
 Charles> arbitrary kernel version.

 Charles> Is this the correct procedure to change these two files? I can
 Charles> make it work with 2.6.35.9, but it seems that
 Charles> kernel.org/pub/linux/kernel/v2.6/ contains up to 2.6.35.9 but
 Charles> not 2.6.35.10 or 2.6.35.11 so 2.6.35.9 works but 2.6.35.11
 Charles> fails.

The problem is that the long term kernels is a concept that didn't exist
back when 2010.11 was released. Since 2011.02-rc1 we now automatically
handle the long term support kernels for 2.6.35 for the kernel headers.

Notice that it isn't strictly required to use the exact same kernel
headers version as the kernel, so you could keep your kernel headers at
2.6.35.9 without any likely issue.

For the kernel you can simply choose 'custom tarball' and provide the
long term URL.

-- 
Bye, Peter Korsgaard
