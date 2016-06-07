From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 09:12:33 +0200
Subject: [Buildroot] [PATCHv2 1/2] toolchain: add coldfire support
In-Reply-To: <20160607024408.GI6825@waldemar-brodkorb.de>
References: <20160429175123.GA27368@waldemar-brodkorb.de>
 <20160606231448.3330032b@free-electrons.com>
 <20160607024408.GI6825@waldemar-brodkorb.de>
Message-ID: <20160607091233.5174a96a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Jun 2016 04:44:08 +0200, Waldemar Brodkorb wrote:

> The change was added when we enabled coldfire support.
> Unfortunately at this time, I didn't know the complete mechanism inside
> buildroot. With the blackfin toolchain patches I learned the
> external/internal stuff and how the wrapper is used.

Right, it's the exact same thing :)

> --with-arch for cf/m68k is again a special thing in GCC to decide
> which kind of multilibs for libgcc are build, either the m68k
> variants or the coldfire variants. But the -march options are
> different, so that BR2_GCC_TARGET_ARCH can't be used for the
> wrapper.
> 
> But we have luck here, we can just remove the BR2_GCC_TARGET_ARCH
> entries.

I'm not sure to understand. You're saying above that
--with-arch=m68k/cf is important in order to tell gcc which kind of
multilib for libgcc should be built. And then you say they are not
needed.

Could you clarify?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
