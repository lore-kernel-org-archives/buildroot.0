From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 13 Jul 2009 16:32:44 +0200
Subject: [Buildroot] [PATCH] optional DBus support in wpa_supplicant
In-Reply-To: <87ljms981c.fsf@macbook.be.48ers.dk>
References: <1247473258.4007.7.camel@sven> <1247476399.4007.13.camel@sven>
	<87ljms981c.fsf@macbook.be.48ers.dk>
Message-ID: <1247495564.20117.4.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 2009-07-13 at 12:44 +0200, Peter Korsgaard wrote:

>  >> the attached patch adds the buildroot config option
>  >> BR2_PACKAGE_WPA_SUPPLICANT_DBUS. With this option enabled the DBus
>  >> specific files from wpa_supplicant will be installed to the target and
>  >> support for the DBus control interface will be compiled into
>  >> wpa_supplicant. Please consider to include this patch.
> 
>  Sven> After updating our copy of buildroot to the latest snapshot, I found
>  Sven> that the patch does not any longer apply cleanly. Attached is an updated
>  Sven> patch that does.
> 
> Thanks, but do we really need a special option for this? Shouldn't
> this just always be done if you have dbus enabled?
> 
> Similiar to how openssl support is handled in various packages
> (E.G. libcurl).

I don't have a strong opinion on that. The DBus control interface adds
about 24kB to the the wpa_supplicant binary size. People might have DBus
enabled for some other reason and don't need this feature in
wpa_supplicant. But then, perhaps it's just not worth the extra
option...


Sven
