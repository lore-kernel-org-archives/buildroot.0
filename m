From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 11:46:43 +0100
Subject: [Buildroot] [PATCH] hostapd: add support for Realtek driver
In-Reply-To: <20171125103252.GA1248@hpx>
References: <874C29DC-F92F-46E8-9323-EF25658D8834@gmail.com>
 <20170914110811.1670-1-alexander.i.mukhin@gmail.com>
 <20171124215828.47855fdd@windsurf.lan> <20171125103252.GA1248@hpx>
Message-ID: <20171125114643.5b290738@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Nov 2017 13:32:52 +0300, Alexander Mukhin wrote:

> > So, I've applied to next. We'll see how often it breaks hostapd (or
> > not).  
> 
> My patch as it was submitted two months ago will not apply to the
> current buildroot tree because of the other patches applied to hostapd
> since then. I'll send the updated version.

I have already applied your patch. So if any fix is needed, please base
your new patch on top of the "next" branch.

But I did test the build of hostapd with the realtek driver support
applied, and it built fine for me. So I'm not sure why you say it
doesn't apply.

> There's no problem in rejecting the patch. One can easily get by without
> it by adding local changes to external.mk:
> 
> HOSTAPD_PATCH += https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
> BR_NO_CHECK_HASH_FOR += rtlxdrv.patch
> HOSTAPD_CONFIG_SET += CONFIG_DRIVER_RTW

If things turn out to be too annoying because it breaks too often, we
might end up doing that. But it's obviously nicer for users if the
feature is integrated in Buildroot itself.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
