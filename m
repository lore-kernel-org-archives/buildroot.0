From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 05 Aug 2019 07:38:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/stellarium: new package
References: <20190804160432.19791-1-bernd.kuhls@t-online.de>
 <20190805000752.06b970bf@windsurf.home>
Message-ID: <ourk1gx4lk.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 05 Aug 2019 00:07:52 +0200 schrieb Thomas Petazzoni:

>> +	select BR2_PACKAGE_QT5SCRIPT if BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>> +	select BR2_PACKAGE_QT5SERIALPORT if 
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
> 
> So how does it work when BR2_PACKAGE_QT5_JSCORE_AVAILABLE or
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6 are not 'y' ?

Hi Thomas,

both BR2_PACKAGE_QT5SCRIPT and BR2_PACKAGE_QT5SERIALPORT are only 
optional dependencies. My goal is to enable all available options in 
Config.in.

Regarding OpenGL ES I need to test this option, for now I only did build-
tests using OpenGL so the package depends on BR2_PACKAGE_HAS_LIBGL for 
now.

Regards, Bernd
