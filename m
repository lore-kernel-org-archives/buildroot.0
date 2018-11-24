From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 13:03:56 +0100
Subject: [Buildroot] [PATCH 1/1] usb_modeswitch: disable parallel build
In-Reply-To: <20181122180746.24616-1-fontaine.fabrice@gmail.com>
References: <20181122180746.24616-1-fontaine.fabrice@gmail.com>
Message-ID: <20181124130356.25f4df62@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Nov 2018 19:07:46 +0100, Fabrice Fontaine wrote:
> Build of package will sometime fails because of the following issue:
> install-static target has two dependencies: dispatcher-static and
> install-common
> 
> Because dispatcher-static is not a file but only a target, it will
> always be called to build usb_modeswitch_dispatcher.
> So, even if install-common depends on usb_modeswitch_dispatcher, in some
> rare cases, install-static won't be able to install
> usb_modeswitch_dispatcher because it is being rebuild by
> dispatcher-static
> 
> To fix this issue, disable parallel build
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8297be35725b816ff5afaf909605ceb41223efb6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/usb_modeswitch/usb_modeswitch.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks. It would be nice to report the issue
upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
