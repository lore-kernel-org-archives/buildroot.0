From: Aleksander Morgado <aleksander@aleksander.es>
Date: Fri, 25 Aug 2017 16:09:32 +0200
Subject: [Buildroot] [PATCH] modem-manager: update dependencies
In-Reply-To: <20170825160230.7535243d@windsurf>
References: <20170825123015.10667-1-aleksander@aleksander.es>
 <20170825160230.7535243d@windsurf>
Message-ID: <CAAP7ucJvxcQbznRtXADnZ_7v4_12C28XUvtdP9Rgm1pWNKdVUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 25, 2017 at 4:02 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Thanks for your contribution!
>
> On Fri, 25 Aug 2017 14:30:15 +0200, Aleksander Morgado wrote:
>> The dbus-glib package isn't a dependency since ModemManager 1.0, which
>> is based on libglib2's GDBus implementation.
>
> And libglib2 GDBus implementation is built unconditionally, regardless
> of whether the DBus package is enabled or not ?
>

Yes; although dbus should probably be a mandatory dependency when
ModemManager is selected then (same as udev+libgudev are)

>> Also, explicitly set libglib2 as dependency, which currently was being
>> implicitly included by libgudev. The next major ModemManager release
>> will have udev/libgudev as optional packages, while libglib2 is
>> definitely not going to be ever optional.
>>
>> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
>> ---
>>  package/modem-manager/modem-manager.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
>> index 1eea355f5..c2999dc2e 100644
>> --- a/package/modem-manager/modem-manager.mk
>> +++ b/package/modem-manager/modem-manager.mk
>> @@ -9,7 +9,7 @@ MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>>  MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
>>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
>>  MODEM_MANAGER_LICENSE_FILES = COPYING
>> -MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool libgudev
>> +MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev host-intltool libglib2 libgudev
>
> Then you also need to:
>
>  1. Remove select BR2_PACKAGE_DBUS_GLIB from Config.in
>
>  2. add select BR2_PACKAGE_LIBGLIB2 in Config.in
>

Ah! will update those as well.

-- 
Aleksander
https://aleksander.es
