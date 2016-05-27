From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 May 2016 23:10:00 +0200
Subject: [Buildroot] [PATCH] system: add comment about
 busybox-show-others
In-Reply-To: <20160527205924.GE3624@free.fr>
References: <1464381291-24985-1-git-send-email-yann.morin.1998@free.fr>
 <20160527225012.2ed6e4e6@free-electrons.com>
 <20160527205924.GE3624@free.fr>
Message-ID: <20160527231000.56429fde@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 May 2016 22:59:24 +0200, Yann E. MORIN wrote:

> What was puzzling me is that BR2_PACKAGE_BUSYBOX_SHOW_OTHERS *appears*
> to be a Busybox option.
> 
> Package options should not be selected before ensurign that the package
> itself is enabled, so we have wither:
> 
>     select BR2_PACKAGE_FOO
>     select BR2_PACKAGE_FOO_OPTION
> 
> or:
> 
>     depends on BR2_PACKAGE_FOO
>     select BR2_PACKAGE_FOO_OPTION
> 
> or:
> 
>     select BR2_PACKAGE_FOO_OPTION if BR2_PACKAGE_FOO
> 
> However, for this specific option, it is *also* available when Busybox
> is *not* enabled: it is not a package option.
> 
> So it is perfectly legit to select it without checking that Busybix
> itself is enabled.

Then change the code to:

	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX

Indeed, when BR2_PACKAGE_BUSYBOX is disabled,
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is *always* set to 'y'.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
