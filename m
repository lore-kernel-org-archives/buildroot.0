From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 18:16:45 -0500
Subject: [Buildroot] [PATCH v7 16/22] rsyslog: fix config file comment
	style
In-Reply-To: <CAHXCMMLHopnN3GKo4i=c2PqnCh9Z9NPe0gj8-pu4w9Jn4dZpuA@mail.gmail.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-17-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMMLHopnN3GKo4i=c2PqnCh9Z9NPe0gj8-pu4w9Jn4dZpuA@mail.gmail.com>
Message-ID: <CANn-YGT948X+x0cV0JPdEL5=H6STApJBCOcmbUdk-96Er27GLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

>> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
>> index 261f59d..00c313a 100644
>> --- a/package/rsyslog/rsyslog.mk
>> +++ b/package/rsyslog/rsyslog.mk
>> @@ -73,6 +73,10 @@ endef
>>  define RSYSLOG_INSTALL_CONF
>>         $(INSTALL) -m 0644 -D $(@D)/platform/redhat/rsyslog.conf \
>>                 $(TARGET_DIR)/etc/rsyslog.conf
>> +       # Fix invalid config file comment style
>> +       $(SED) 's~\/\* ~#  ~g' $(TARGET_DIR)/etc/rsyslog.conf
>> +       $(SED) 's~ \*\/~# ~g' $(TARGET_DIR)/etc/rsyslog.conf
>> +       $(SED) 's~ \*~# ~g' $(TARGET_DIR)/etc/rsyslog.conf
> Hum... this sed command are not really nice, I would prefer carrying
> the upstream patch fixing this [1].

I agree. I'll change this to the patch instead.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
