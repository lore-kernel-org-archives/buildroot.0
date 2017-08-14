From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 10:21:33 +0200
Subject: [Buildroot] Ensuring kernel symbols for a module
In-Reply-To: <CA+TH9VmJgw6f0ugPmunZh4c0mjwrTZ5xiLDHNrVt-9vnEsrbJQ@mail.gmail.com>
References: <CA+TH9VmJgw6f0ugPmunZh4c0mjwrTZ5xiLDHNrVt-9vnEsrbJQ@mail.gmail.com>
Message-ID: <20170814102133.69cadf52@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Aug 2017 09:28:36 +0200, Angelo Compagnucci wrote:

> I'm looking for a way to ensure kernel symbols are present for the
> sysdig kernel module (CONFIG_TRACEPOINTS
> CONFIG_HAVE_SYSCALL_TRACEPOINTS). Is there a simple way to express
> such a dependency?

You can add more logic in linux/linux.mk. See:

        $(if $(BR2_PACKAGE_KTAP),
                $(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_ENABLE_DEFAULT_TRACERS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER,$(@D)/.config))

for example.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
