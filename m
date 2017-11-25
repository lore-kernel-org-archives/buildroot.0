From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Sat, 25 Nov 2017 13:32:52 +0300
Subject: [Buildroot] [PATCH] hostapd: add support for Realtek driver
In-Reply-To: <20171124215828.47855fdd@windsurf.lan>
References: <874C29DC-F92F-46E8-9323-EF25658D8834@gmail.com>
 <20170914110811.1670-1-alexander.i.mukhin@gmail.com>
 <20171124215828.47855fdd@windsurf.lan>
Message-ID: <20171125103252.GA1248@hpx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Nov 24, 2017 at 09:58:28PM +0100, Thomas Petazzoni wrote:
> To be honest, I was about to reject your patch: it's basically adding a
> feature patch to a package, which we normally don't do, and the patch
> is very likely to break when we update to newer versions of hostapd.
> 
> But I saw that both Peter and Arnout had a look at the problem, and the
> overall feeling is that there really isn't a better solution.
> 
> So, I've applied to next. We'll see how often it breaks hostapd (or
> not).

My patch as it was submitted two months ago will not apply to the
current buildroot tree because of the other patches applied to hostapd
since then. I'll send the updated version.

There's no problem in rejecting the patch. One can easily get by without
it by adding local changes to external.mk:

HOSTAPD_PATCH += https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
BR_NO_CHECK_HASH_FOR += rtlxdrv.patch
HOSTAPD_CONFIG_SET += CONFIG_DRIVER_RTW

-- 
Best regards,
Alexander.
