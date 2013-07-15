From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jul 2013 09:52:01 +0200
Subject: [Buildroot] [PATCHv2 12/25] arch: introduce BR2_GCC_TARGET_{FPU,
	FLOAT}
In-Reply-To: <8761wcc20o.fsf@dell.be.48ers.dk>
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373754468-7527-13-git-send-email-thomas.petazzoni@free-electrons.com>
 <8761wcc20o.fsf@dell.be.48ers.dk>
Message-ID: <20130715095201.613a8994@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 14 Jul 2013 22:36:23 +0200, Peter Korsgaard wrote:

> And pass it as -mfloat-abi here (except you used the wrong variable, so
> it's never passed).
> 
> What was the idea here?

To select the floating point strategy, you can either pass:

 * --with-float=<foo> at configure time of gcc, in which case it
   applies to the default build of all binaries built by this gcc.

 * -mfloat-abi=<foo> at run time of gcc.

For the internal backend, where we build gcc, I use the former, while
for external toolchain, I use the latter. The difference in option name
explains the confusion in the variable name.

I'll respin this patch (and the rest of the patch set) with this fixed.

Thanks for the review (and the commit of all prior patches)!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
