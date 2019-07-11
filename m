From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Jul 2019 16:05:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/at-spi2-core: fix build with NLS
In-Reply-To: <CAPi7W81_0L+BwFWadF+nv06attTFfnKuoiCshbuf3mGGiOX5Gw@mail.gmail.com>
References: <20190704170538.19478-1-fontaine.fabrice@gmail.com>
 <CAMWSM7gdtjvdp=py9+isYfKqf_Bd9OXS7jQB18ym_XX78sV7CQ@mail.gmail.com>
 <CAPi7W81_0L+BwFWadF+nv06attTFfnKuoiCshbuf3mGGiOX5Gw@mail.gmail.com>
Message-ID: <373aa6e1-3edb-7be2-f842-3c47cc460878@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/07/2019 09:24, Fabrice Fontaine wrote:
> Hi Joseph,
> 
> Le lun. 8 juil. 2019 ? 22:11, Joseph Kogut <joseph.kogut@gmail.com> a ?crit :
>>
>> Hi Fabrice,
>>
>> On Thu, Jul 4, 2019 at 10:05 AM Fabrice Fontaine
>> <fontaine.fabrice@gmail.com> wrote:
>>>
>>> Fixes:
>>>  - http://autobuild.buildroot.org/results/0b0d3370d8d050f7a3ba5663833e5e06e7c0b7b1?
>>>
>>
>> It appears there's an extra character on the end of that buildbot URL.
>>
>> It looks like the correct URL is:
>> http://autobuild.buildroot.org/results/0b0d3370d8d050f7a3ba5663833e5e06e7c0b7b1
> I'll send a v2 with the correct URL.

 You didn't :-) So I did it and applied to master, thanks.

 Regards,
 Arnout

>>
>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>> ---
>>>  package/at-spi2-core/at-spi2-core.mk | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
>>> index 40b29bdb3f..3a5197eb03 100644
>>> --- a/package/at-spi2-core/at-spi2-core.mk
>>> +++ b/package/at-spi2-core/at-spi2-core.mk
>>> @@ -11,7 +11,10 @@ AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI
>>>  AT_SPI2_CORE_LICENSE = LGPL-2.0+
>>>  AT_SPI2_CORE_LICENSE_FILES = COPYING
>>>  AT_SPI2_CORE_INSTALL_STAGING = YES
>>> -AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 xlib_libXtst
>>> +AT_SPI2_CORE_DEPENDENCIES = host-pkgconf dbus libglib2 xlib_libXtst \
>>> +       $(TARGET_NLS_DEPENDENCIES)
>>>  AT_SPI2_CORE_CONF_OPTS = -Ddbus_daemon=/usr/bin/dbus-daemon
>>>
>>> +AT_SPI2_CORE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
>>> +
>>>  $(eval $(meson-package))
>>> --
>>> 2.20.1
>>>
>>
>> Also fixes:
>> - http://autobuild.buildroot.net/results/b46f989e2c5d37e9c6535ce5630c80ca9d0a9009
>>
>> Tested-by: Joseph Kogut <joseph.kogut@gmail.com>
>>
>> Lastly, it appears there is a similar failure with atk. I assume the
>> fix is also the same. Do you have time to make a patch for that as
>> well? If not, I can submit one.
> Patch for atk is already available: http://patchwork.ozlabs.org/patch/1126485
>>
>> Best,
>> Joseph
> Best Regards,
> 
> Fabrice
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
