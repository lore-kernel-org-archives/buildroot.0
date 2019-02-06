From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 11:59:20 +0100
Subject: [Buildroot] openocd CMSIS-DAP support
In-Reply-To: <CADjezmZq4MSvxbGm9HAHxAGN2O5F1XZrVRRoGw9ehV-i=CUSyg@mail.gmail.com>
References: <CADjezmZq4MSvxbGm9HAHxAGN2O5F1XZrVRRoGw9ehV-i=CUSyg@mail.gmail.com>
Message-ID: <20190206115920.6636a156@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Mon, 7 Jan 2019 12:12:19 -0500
mattwood2000 at gmail.com wrote:

> Hi,
> 
> I need CMSIS-DAP support in openOCD on my target build.  I noticed the
> comment in openocd.mk explaining that CMSIS-DAP support is disabled for the
> host build because HIDAPI is not supported in buildroot.
> 
> However, I see cmsis-dap support in the target options of openocd as well
> as HIDAPI support for target buids.
> 
> I was able to add cmsis-dap support for the target easily with the patch
> below.
> 
> Is there a reason why the CMSIS-DAP Adapter option in Config.in was removed
> or never added for the target build?  If not I'll submit this but wanted to
> make sure I wasn't missing something.
> 
> Thanks, Matt.
> 
> diff --git a/package/openocd/Config.in b/package/openocd/Config.in
> index 6cba7a04c8..2145ac72eb 100644
> --- a/package/openocd/Config.in
> +++ b/package/openocd/Config.in
> @@ -9,6 +9,16 @@ if BR2_PACKAGE_OPENOCD

Applied to master after adding the missing "depends on" as pointed by
Arnout, and after reworking the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
