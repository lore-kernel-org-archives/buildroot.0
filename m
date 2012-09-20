From: Waldemar.Rymarkiewicz at tieto.com <Waldemar.Rymarkiewicz@tieto.com>
Date: Thu, 20 Sep 2012 09:31:25 +0300
Subject: [Buildroot] [PATCH v2 2/2] ccid: new package
In-Reply-To: <505A318A.6080107@mind.be>
References: <1348059150-32601-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <1348059150-32601-2-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <505A318A.6080107@mind.be>
Message-ID: <99B09243E1A5DA4898CDD8B70011144818039905E5@EXMB04.eu.tieto.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

>[snip]
>> +ifeq ($(BR2_PACKAGE_LIBUSB),y)
>> +CCID_CONF_OPT += --enable-libusb
>> +CCID_DEPENDENCIES += libusb
>> +else
>> +CCID_CONF_OPT += --disable-libusb
>> +endif
>> +
>> +$(eval $(call autotools-package))
>
>  I just build-tested on a config without libusb, and it doesn't seem
>to install anything.  The examples are compiled (not installed), but
>I doubt they're useful for anything without the ccid plugin.
>
>  So maybe it's better to select libusb after all.

You are right. I missed that. 

It seems that ccid itself is broken and this option does not work as supposed so I will require libusb then. 

Thanks,
/Waldek
