From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jan 2013 09:15:34 +0100
Subject: [Buildroot] [git commit] perf: add kernel version checks
In-Reply-To: <50EBBFA8.1070503@mind.be>
References: <20130107212531.5E07E9A691@busybox.osuosl.org>
 <50EBBFA8.1070503@mind.be>
Message-ID: <20130108091534.38d07446@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 08 Jan 2013 07:41:44 +0100, Arnout Vandecappelle wrote:

>   There are a number of packages that would benefit from kernel version 
> checks. For instance, the native driver implementations of igh-ethercat 
> are specific for a certain kernel version. Would it be a good idea to 
> make the kernel version user-configurable, and add a check for its 
> correctness similar to the external toolchains?

Huh? The kernel version is already user configurable, thanks to the
BR2_LINUX_KERNEL_3_7, BR2_LINUX_KERNEL_SAME_AS_HEADERS,
BR2_LINUX_KERNEL_CUSTOM_VERSION, BR2_LINUX_KERNEL_CUSTOM_TARBALL,
BR2_LINUX_KERNEL_CUSTOM_GIT configuration options.

The thing is that when the BR2_LINUX_KERNEL_CUSTOM_TARBALL or
BR2_LINUX_KERNEL_CUSTOM_GIT options are used, you don't know (at the
Kconfig level), the kernel version that will be used.

And I don't think we should ask the user to tell us, through a separate
option, what kernel version his/her Git tree actually contains.

Or maybe I'm missing what you're proposing here?

Regarding the kernel and the autobuilders, my plan was to modify the
autobuilders script to randomly enable the kernel build. The script of
course knows, per-architecture, of a known-working kernel defconfig
file that it would use in the Buildroot configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
