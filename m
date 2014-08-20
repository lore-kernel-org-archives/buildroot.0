From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Aug 2014 14:24:17 +0200
Subject: [Buildroot] [PATCHv2] package/gcc: cleanup arch/cpu combinations
In-Reply-To: <1408482998-24200-1-git-send-email-gustavo@zacarias.com.ar>
References: <1408482998-24200-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140820142417.31c93ef2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 19 Aug 2014 18:16:38 -0300, Gustavo Zacarias wrote:
> Cleanup arch/cpu combination limits, we had super-wide depends and it
> doesn't help readability.
> 
> Make the bool/depends/select order the same for all entries.
> 
> Drop redundant limitations, for example sparc* if sparc wasn't
> supported in general.
> 
> Power8 requires at least gcc 4.9.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

What do you think of a solution like:

  [Buildroot] [PATCH] toolchain/gcc: Introduce BR2_ARCH_HAS_GCC_x_y_PLUS

which Mischa Jonker posted a while ago (but didn't push strong enough
to get it merged) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
