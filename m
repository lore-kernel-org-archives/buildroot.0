From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Mon, 23 Dec 2013 10:54:07 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: new package
In-Reply-To: <20131223095040.GE11794@sapphire.tkos.co.il>
References: <1387791444-28056-1-git-send-email-alexandre.belloni@free-electrons.com>
 <20131223095040.GE11794@sapphire.tkos.co.il>
Message-ID: <52B8083F.80005@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/12/2013 10:50, Baruch Siach wrote:
>
>> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
>> new file mode 100644
>> index 000000000000..f0a71125e2ad
>> --- /dev/null
>> +++ b/package/bluez5_utils/Config.in
>> @@ -0,0 +1,16 @@
>> +config BR2_PACKAGE_BLUEZ5_UTILS
>> +	bool "bluez5-utils"
>> +	depends on !BR2_avr32
>> +	depends on BR2_USE_WCHAR # libglib2
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
> Why alsa-lib?

Hum, right, it got copied from bluez-utils, I'll remove it


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
