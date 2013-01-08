From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 09:28:15 +0100
Subject: [Buildroot] [git commit] perf: add kernel version checks
In-Reply-To: <20130108091534.38d07446@skate>
References: <20130107212531.5E07E9A691@busybox.osuosl.org>
 <50EBBFA8.1070503@mind.be> <20130108091534.38d07446@skate>
Message-ID: <50EBD89F.6050409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/01/13 09:15, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Tue, 08 Jan 2013 07:41:44 +0100, Arnout Vandecappelle wrote:
>
>>    There are a number of packages that would benefit from kernel version
>> checks. For instance, the native driver implementations of igh-ethercat
>> are specific for a certain kernel version. Would it be a good idea to
>> make the kernel version user-configurable, and add a check for its
>> correctness similar to the external toolchains?
>
> Huh? The kernel version is already user configurable, thanks to the
> BR2_LINUX_KERNEL_3_7, BR2_LINUX_KERNEL_SAME_AS_HEADERS,
> BR2_LINUX_KERNEL_CUSTOM_VERSION, BR2_LINUX_KERNEL_CUSTOM_TARBALL,
> BR2_LINUX_KERNEL_CUSTOM_GIT configuration options.
>
> The thing is that when the BR2_LINUX_KERNEL_CUSTOM_TARBALL or
> BR2_LINUX_KERNEL_CUSTOM_GIT options are used, you don't know (at the
> Kconfig level), the kernel version that will be used.
>
> And I don't think we should ask the user to tell us, through a separate
> option, what kernel version his/her Git tree actually contains.
>
> Or maybe I'm missing what you're proposing here?

  I propose what you just said we shouldn't do: ask the user to tell us, 
through a separate option, what kernel version his/her git tree actually 
contains. Similar to the configuration of a preinstalled external toolchain.


> Regarding the kernel and the autobuilders, my plan was to modify the
> autobuilders script to randomly enable the kernel build. The script of
> course knows, per-architecture, of a known-working kernel defconfig
> file that it would use in the Buildroot configuration.

  It will be hard to find a kernel version that is supported by all of 
linux-fusion, igh-ethercat, owl-linux, lttng-modules and perf (and then 
I'm leaving out Xenomai and RTAI). For my all-package build, I just 
disabled those because it was too difficult to find a good one.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
