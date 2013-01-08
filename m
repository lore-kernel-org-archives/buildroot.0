From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 07:41:44 +0100
Subject: [Buildroot] [git commit] perf: add kernel version checks
In-Reply-To: <20130107212531.5E07E9A691@busybox.osuosl.org>
References: <20130107212531.5E07E9A691@busybox.osuosl.org>
Message-ID: <50EBBFA8.1070503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/13 21:40, Peter Korsgaard wrote:
> perf is only available since kernel 2.6.31, so if we can't find
> tools/perf/Makefile, error out and tell the user about this.
>
> perf without libelf can only be built since kernel 3.7, so error out
> and tell the user about this if he's trying to build perf from a<  3.7
> kernel without libelf.
>
> Unfortunately, those tests can only be build-time checks as we either
> need to know the real kernel version (i.e, using LINUX_VERSION would
> not be correct as it can be a Git commit ID, or Git tag), or have
> access to the kernel sources themselves. So we can't prevent those
> invalid situations at the configuration, we can only nicely tell the
> user at build time.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> Signed-off-by: Peter Korsgaard<jacmet@sunsite.dk>

  There are a number of packages that would benefit from kernel version 
checks. For instance, the native driver implementations of igh-ethercat 
are specific for a certain kernel version. Would it be a good idea to 
make the kernel version user-configurable, and add a check for its 
correctness similar to the external toolchains?

  This would allow us to add a kernel build to the autobuilders, and thus 
autobuild the 5 packages that depend on BR2_LINUX_KERNEL.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
