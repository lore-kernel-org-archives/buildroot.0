From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 08:11:54 +0100
Subject: [Buildroot] [PATCH 1/6] toolchain: introduce a toolchain knob
 for NPTL
In-Reply-To: <1392297727-17627-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392297727-17627-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5301B63A.5000304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/14 14:22, Thomas Petazzoni wrote:
> As our architecture support expands to a number of architectures that
> do not implement NPTL threading, and the number of packages that
> depend on NPTL specific features, it has become necessary to be able
> to know whether the toolchain has NPTL support or not.
> 
> This commit adds a new BR2_TOOLCHAIN_HAS_THREADS_NPTL hidden Config.in
> option that allows packages to know whether NPTL is available or not.
> 
> This hidden option is:
> 
>  * Automatically enabled when glibc/eglibc or musl toolchains are
>    used, either internal or external.
> 
>  * Automatically enabled when an internal uClibc toolchain with NPTL
>    support is configured. It is left disabled otherwise for internal
>    uClibc toolchains.
> 
>  * Configured according to a visible Config.in option for custom
>    external uClibc toolchains.

 I think there is very little reason left to use NPTL on archs that
support it, isn't there? So I would first remove the option completely
for these architectures. That would also make adding a comment
unnecessary (since it becomes an architecture feature rather than a
toolchain option).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
