From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Sun, 08 Mar 2015 16:16:56 +0100
Subject: [Buildroot] [PATCH v3 2/2] wine: Add gettext dependency check
 for host-wine
In-Reply-To: <20150308155730.11c74ecc@free-electrons.com>
References: <54FC5B41.5050004@dawncrow.de>
 <20150308155730.11c74ecc@free-electrons.com>
Message-ID: <54FC67E8.7010004@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 08.03.2015 um 15:57 schrieb Thomas Petazzoni:
> Dear Andr? Hentschel,
> 
> On Sun, 08 Mar 2015 15:22:57 +0100, Andr? Hentschel wrote:
> 
>> +# selecting gettext also enables host-gettext which is
>> +# essential for .po file support in wrc from host-wine
>> +ifeq ($(BR2_PACKAGE_GETTEXT),y)
>> +HOST_WINE_CONF_OPTS += --with-gettext --with-gettextpo
>> +HOST_WINE_DEPENDENCIES += host-gettext
>> +else
>> +HOST_WINE_CONF_OPTS += --without-gettext --without-gettextpo
>> +endif
> 
> I'm sorry but this still doesn't make sense.
> 
> BR2_PACKAGE_GETTEXT=y indicates that the gettext package is built for
> the *target*, i.e it installs stuff in $(TARGET_DIR) and
> $(STAGING_DIR), most notably the libintl library.
> 
> So, using BR2_PACKAGE_GETTEXT=y as an indication to know whether
> gettext support is available for a *host* package (which looks only in
> $(HOST_DIR)) does not make sense.
> 
> What are you trying to do here?
> 
> If you're trying to have optional gettext support for the target Wine,
> then what you need is:

Wine is built using host-wine, so i need gettext support in host-wines wrt.
For this i want to detect if host-gettext will be build, but the only way I see
to do so is to query BR2_PACKAGE_GETTEXT which is obviously a target package, but also
will build host-gettext
