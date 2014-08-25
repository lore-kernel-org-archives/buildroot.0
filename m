From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 25 Aug 2014 23:00:39 +0200
Subject: [Buildroot] [PATCH 1/2] package/xscreensaver: fix linking with
 intl
In-Reply-To: <20140825200144.187d22ad@free-electrons.com>
References: <1408629367-7336-1-git-send-email-romain.naour@openwide.fr>
 <20140825200144.187d22ad@free-electrons.com>
Message-ID: <53FBA3F7.2000501@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 25/08/2014 20:01, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Thu, 21 Aug 2014 15:56:06 +0200, Romain Naour wrote:
> 
>> diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
>> index 0e84d27..ac8b09d 100644
>> --- a/package/xscreensaver/xscreensaver.mk
>> +++ b/package/xscreensaver/xscreensaver.mk
>> @@ -14,7 +14,7 @@ XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
>>  XSCREENSAVER_DEPENDENCIES = jpeg libglade libgtk2 xlib_libX11 xlib_libXt \
>>  	$(if $(BR2_PACKAGE_GETTEXT),gettext)
>>  
>> -XSCREENSAVER_CONF_ENV = $(if $(BR2_PACKAGE_GETTEXT),LIBS=-lintl)
>> +XSCREENSAVER_CONF_ENV = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
> 
> I am not convinced by this one, because in XSCREENSAVER_DEPENDENCIES,
> the gettext dependency is still added when BR2_PACKAGE_GETTEXT=y. And
> also, in the Config.in of this package, there is nothing like select
> BR2_PACKAGE_GETTEXT if !BR2_NEEDS_GETTEXT_IF_LOCALE.
> 

Ok, I'll rework on it :)

Best regards,
Romain
