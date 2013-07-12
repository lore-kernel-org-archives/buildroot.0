From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Fri, 12 Jul 2013 08:06:36 +0000
Subject: [Buildroot] [PATCH] package/iozone: Build non-threads version
 if !BR2_PTHREADS_NATIVE
In-Reply-To: <20130712100429.7950ace7@skate>
References: <1373615072-5258-1-git-send-email-mjonker@synopsys.com>
 <20130712100429.7950ace7@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D633A093BA@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> BR2_PTHREADS_NATIVE is a Config.in option that only makes sense in the
> context of the internal toolchain backend. So any usage of it in package/ is
> going to not be suitable for external toolchain usage. So your change, as is,
> would disable thread support in IOZone for any external toolchain.

Should we add a BR2_TOOLCHAIN_HAS_THREADS_NATIVE to toolchain/toolchain-common.in? Or do you have another suggestion?

Mischa
