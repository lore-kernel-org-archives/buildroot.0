From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 23:22:19 +0200
Subject: [Buildroot] [PATCH 1/2] gst1-plugins-bad: rework license type
 construction
In-Reply-To: <1525633443-942-1-git-send-email-danomimanchego123@gmail.com>
References: <1525633443-942-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20180513232219.710f6cd1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 May 2018 15:04:02 -0400, Danomi Manchego wrote:
> Use "GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), xxxx" construct
> so that the list of licenses is presented as a comma-separated list.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

I've applied to master, thanks! One comment below though.

>  # Add GPL license if GPL licensed plugins enabled.
>  ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
> -GST1_PLUGINS_BAD_LICENSE += GPL
> +GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), GPL

It would be nice to make this vague "GPL" statement a bit clearer. Are
we talking about GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+ ? Or a
combination of these ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
