From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 18 Feb 2018 21:03:04 -0300 (BRT)
Subject: [Buildroot] [PATCH v2 2/2] modem-manager: Update to version
 1.7.990
In-Reply-To: <20180216215334.7385e898@windsurf.lan>
References: <1518799091-845-1-git-send-email-jared.bents@rockwellcollins.com>
 <1518799091-845-2-git-send-email-jared.bents@rockwellcollins.com>
 <20180216215334.7385e898@windsurf.lan>
Message-ID: <361202886.84859.1518998584797.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Jared Bents" <jared.bents@rockwellcollins.com>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Friday, February 16, 2018 6:53:34 PM
> Subject: Re: [Buildroot] [PATCH v2 2/2] modem-manager: Update to version 1.7.990

> Hello,
> 
> On Fri, 16 Feb 2018 10:38:11 -0600, Jared Bents wrote:
> 
>> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
>> index 8e995b4..5f1f6d5 100644
>> --- a/package/modem-manager/Config.in
>> +++ b/package/modem-manager/Config.in
>> @@ -1,12 +1,11 @@
>>  config BR2_PACKAGE_MODEM_MANAGER
>>  	bool "modemmanager"
>> -	depends on BR2_PACKAGE_HAS_UDEV
>>  	depends on BR2_USE_WCHAR # libglib2 and gnutls
>>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>>  	depends on BR2_USE_MMU # dbus
>>  	select BR2_PACKAGE_DBUS # runtime dependency
>>  	select BR2_PACKAGE_LIBGLIB2
>> -	select BR2_PACKAGE_LIBGUDEV
>> +	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
>>  	help
>>  	  ModemManager is a DBus-activated daemon which controls mobile
>>  	  broadband (2G/3G/4G) devices and connections.
>> @@ -28,7 +27,7 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
>>  	  This option enables support for QMI protocol
>>  endif
>>  
>> -comment "modemmanager needs udev /dev management and a toolchain w/ wchar,
>> threads"
>> +comment "modemmanager needs /dev management and a toolchain w/ wchar, threads"
> 
> The "/dev management and" part should be removed entirely.
> 
>>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>>  		!BR2_PACKAGE_HAS_UDEV
> 
> And the BR2_PACKAGE_HAS_UDEV dependency.
> 
>>  	depends on BR2_USE_MMU
>> diff --git a/package/modem-manager/modem-manager.hash
>> b/package/modem-manager/modem-manager.hash
>> index bc08044..52cc7a6 100644
>> --- a/package/modem-manager/modem-manager.hash
>> +++ b/package/modem-manager/modem-manager.hash
>> @@ -1,4 +1,4 @@
>>  # Locally computed
>> -sha256  bc74326fa69ae8012f806e235f3d296144922669b952d4d4987dd0af645d5f68
>> ModemManager-1.6.10.tar.xz
>> +sha256  d465094fc6fc173354f5a00d212049056829cc245d60a9083f3c53f86a8f90ec
>> ModemManager-1.7.990.tar.xz
>>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
>>  COPYING
>>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551
>>  COPYING.LIB
>> diff --git a/package/modem-manager/modem-manager.mk
>> b/package/modem-manager/modem-manager.mk
>> index b741acf..61672dd 100644
>> --- a/package/modem-manager/modem-manager.mk
>> +++ b/package/modem-manager/modem-manager.mk
>> @@ -4,12 +4,12 @@
>>  #
>>  ################################################################################
>>  
>> -MODEM_MANAGER_VERSION = 1.6.10
>> +MODEM_MANAGER_VERSION = 1.7.990
> 
> Are you sure 1.7.990 isn't a development version ? Interestingly, their
> Git repo has no tag with this name:
> https://cgit.freedesktop.org/ModemManager/ModemManager/refs/tags. It
> has a 1.8-rc1 version. So it does feel like 1.7.x might be a
> development version. Could you double check this ?

It is a development version. That's why I submitted an update to the
latest release version, which is 1.6.12:

    https://patchwork.ozlabs.org/patch/871059/

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
