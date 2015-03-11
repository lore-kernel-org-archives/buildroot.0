From: Mike Williams <mike@mikebwilliams.com>
Date: Wed, 11 Mar 2015 09:55:08 -0400
Subject: [Buildroot] [PATCH v2] wpa_supplicant: install systemd service
	files
In-Reply-To: <20150309233256.0b0e0550@free-electrons.com>
References: <1425917011-16598-1-git-send-email-mike@mikebwilliams.com>
 <20150309233256.0b0e0550@free-electrons.com>
Message-ID: <CANPyyuMi5xqCwn9R0PLLQ7EtEMqX7oHrxZeJPUxJhAqE=E2TvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Mar 9, 2015 at 6:32 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Mike Williams,
>
> On Mon,  9 Mar 2015 12:03:31 -0400, Mike Williams wrote:
>
>> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
>> index 682cb4c..242bea5 100644
>> --- a/package/wpa_supplicant/wpa_supplicant.mk
>> +++ b/package/wpa_supplicant/wpa_supplicant.mk
>> @@ -164,4 +164,15 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
>>       $(WPA_SUPPLICANT_INSTALL_DBUS)
>>  endef
>>
>> +define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
>> +     $(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant.service \
>> +             $(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant.service
>> +     $(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant at .service \
>> +             $(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant at .service
>> +     $(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-nl80211 at .service \
>> +             $(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-nl80211 at .service
>> +     $(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-wired at .service \
>> +             $(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-wired at .service
>> +endef
>
> Could you please add the symlinks needed to make sure that these
> services are started at boot by default?

Yes, but it will take me a little while, maybe next week. Some of
these appear to be mutually exclusive, some of them require specific
configuration files for the interface or they will fail, and the
wpa_supplicant.service file needs to be modified depending on build
options set, etc. so it's not as simple as just enabling all of them.

>
> I know this is not your opinion, but starting services by default is
> what we do in basically all packages in Buildroot today, and therefore
> something we should continue doing for consistency (and also because
> we believe that's a sane default).
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
