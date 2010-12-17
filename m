From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Dec 2010 11:40:23 +0100
Subject: [Buildroot] [PATCH v2] buildroot:linux: Add options to checkout
 Linux kernel source from SVN or GIT repository.
In-Reply-To: <1292492992-15797-2-git-send-email-sonic.adi@gmail.com>
References: <1292492992-15797-1-git-send-email-sonic.adi@gmail.com>
	<1292492992-15797-2-git-send-email-sonic.adi@gmail.com>
Message-ID: <20101217114023.6459c16e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Dec 2010 17:49:52 +0800
Sonic Zhang <sonic.adi@gmail.com> wrote:

> Current buildroot Config.in and linux.mk don't support kernel source in SVN
> or GIT repository. A pre-checkouted local SVN or GIT kernel tree set in
> KERNEL_CUSTOM_TREE is the only option.

The KERNEL_CUSTOM_TREE option is not in mainline Buildroot. And as per
my answer to the previous patch, I'd very much prefer a more generic
solution than a solution specific to the Linux kernel build process.

> Because the local path can be anywhere, no buildroot default config file can be defined in sub folder
> target/device/company/boards to run quick building. It is inconvient to run
> regression testing. Since buildroot has already support SVN and GIT repository
> for application packages, it is reasonable to have it for linux kernel as well.

I have a similar comment here: I agree that we must have GIT and SVN
support for the Linux build process, but we should also have it for all
the bootloaders (see the recent patch to introduce X-Loader).
Therefore, instead of solving it in a Linux-specific way, I'd prefer if
we could have a generic infrastructure (in the spirit of the package
infrastructure) that would satisfy the need of bootloaders and Linux
kernel in terms of build process.

Yes, it's a lot more work than just making the change on the Linux
kernel build process only, but on the long term, it's much more
interesting.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
