From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 9 Oct 2015 07:33:01 -0300
Subject: [Buildroot] [PATCH] webkitgtk24: use the correct Config.in
	option for NEON
In-Reply-To: <1444382406-16293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1444382406-16293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <561797DD.3010009@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/10/15 06:20, Thomas Petazzoni wrote:

> In order to enable JIT support on ARM, webkitgtk24 currently looks at
> BR2_ARM_ENABLE_NEON, which is not correct: BR2_ARM_CPU_HAS_NEON should
> be used instead.
>
> The BR2_ARM_ENABLE_NEON is only visible for cores that select
> BR2_ARM_CPU_MAYBE_HAS_NEON, in order to allow to specify if his
> particular SoC has chosen to integrate NEON or not. And if so,
> BR2_ARM_CPU_HAS_NEON gets selected.
>
> BR2_ARM_CPU_HAS_NEON is in fact selected in two different ways:
>
>   - Either directly by the CPU core selection, if NEON is mandatory in
>     this CPU core.
>
>   - Or by BR2_ARM_ENABLE_NEON, for CPU cores where NEON support is
>     optional.
>
> So really, BR2_ARM_CPU_HAS_NEON is what should be used by packages.
>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
