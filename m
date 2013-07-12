From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Fri, 12 Jul 2013 08:27:20 +0000
Subject: [Buildroot] [PATCH] package/iozone: Build non-threads version
 if !BR2_PTHREADS_NATIVE
In-Reply-To: <20130712101423.7b281960@skate>
References: <1373615072-5258-1-git-send-email-mjonker@synopsys.com>
 <20130712100429.7950ace7@skate>
 <E6BF041E97966E4DB955F0DF883AD2D633A093BA@de02wembxa.internal.synopsys.com>
 <20130712101423.7b281960@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D633A093E7@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas wrote:

>> Should we add a BR2_TOOLCHAIN_HAS_THREADS_NATIVE to
>> toolchain/toolchain-
> common.in? Or do you have another suggestion?
> 
> Yes, I believe that's the only solution. In fact, it could also be
> used instead of the BR2_TOOLCHAIN_LIBC_NEEDS_THREE_STAGE_BUILD that's
> being added by my proposed patch "[PATCH] toolchain-internal: skip
> gcc-intermediate when possible".

Do you think that it's a safe assumption that GLIBC toolchains have NPTL? (just like BR2_TOOLCHAIN_HAS_THREADS is selected already if BR2_TOOLCHAIN_USES_GLIBC).

Mischa
