From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jul 2013 10:14:23 +0200
Subject: [Buildroot] [PATCH] package/iozone: Build non-threads version
 if !BR2_PTHREADS_NATIVE
In-Reply-To: <E6BF041E97966E4DB955F0DF883AD2D633A093BA@de02wembxa.internal.synopsys.com>
References: <1373615072-5258-1-git-send-email-mjonker@synopsys.com>
 <20130712100429.7950ace7@skate>
 <E6BF041E97966E4DB955F0DF883AD2D633A093BA@de02wembxa.internal.synopsys.com>
Message-ID: <20130712101423.7b281960@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Fri, 12 Jul 2013 08:06:36 +0000, Mischa Jonker wrote:

> > BR2_PTHREADS_NATIVE is a Config.in option that only makes sense in the
> > context of the internal toolchain backend. So any usage of it in package/ is
> > going to not be suitable for external toolchain usage. So your change, as is,
> > would disable thread support in IOZone for any external toolchain.
> 
> Should we add a BR2_TOOLCHAIN_HAS_THREADS_NATIVE to toolchain/toolchain-common.in? Or do you have another suggestion?

Yes, I believe that's the only solution. In fact, it could also be used
instead of the BR2_TOOLCHAIN_LIBC_NEEDS_THREE_STAGE_BUILD that's being
added by my proposed patch "[PATCH] toolchain-internal: skip
gcc-intermediate when possible".

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
