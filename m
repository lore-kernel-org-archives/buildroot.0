From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 15:52:22 +0200
Subject: [Buildroot] [PATCH 2/2] i2c-tools: Adds check of i2c kernel
 option
In-Reply-To: <96448357.4733141.1438695534642.JavaMail.root@openwide.fr>
References: <20150804144556.58dd8978@free-electrons.com>
 <96448357.4733141.1438695534642.JavaMail.root@openwide.fr>
Message-ID: <20150804155222.580ff18e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Denis,

On Tue, 4 Aug 2015 15:38:54 +0200 (CEST), Denis Thulin wrote:

> I understand that this is a mistake for kernel options.
> But could patch [1/2] be useful for the other kconfig packages ?
> I think it would be useful to know options of busybox when building
> packages.

I am not sure for what reasons other packages would need to know the
Busybox options that are enabled.

> Would it not be a better thing for all packages to provide a list
> of kernel options they need and for LINUX_KCONFIG_FIXUP_CMDS
> to select those options rather than using lots of if blocks ?

Could be, yes. Not sure how that would work, though. We want to keep
this list of condition relatively short, and not encourage adding
millions of interactions between user space dependencies and kernel
options.

> That list could also be exported so that people using a custom kernel
> would know which options Buildroot would have selected had they used
> the default kernel.

People using a custom kernel "know what they are doing", so I'm not too
interested in solving this particular use case.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
