From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 7 Jan 2013 22:52:08 +0100
Subject: [Buildroot] [PATCH v2 3/6] libatasmart: new package.
In-Reply-To: <20130107223046.74aa74a4@skate>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-4-git-send-email-marek.belisko@open-nandra.com>
 <20130107223046.74aa74a4@skate>
Message-ID: <CAAfyv37Cd6NzPHTQmWXUS2bWB70UhA47CyWnNxD6R6igKp4Agw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jan 7, 2013 at 10:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Marek Belisko,
>
> On Mon,  7 Jan 2013 21:43:16 +0100, Marek Belisko wrote:
>
>> diff --git a/package/Config.in b/package/Config.in
>> index c889d8a..53bb5be 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -239,6 +239,8 @@ source "package/iostat/Config.in"
>>  source "package/irda-utils/Config.in"
>>  source "package/kbd/Config.in"
>>  source "package/lcdproc/Config.in"
>> +source "package/libatasmart/Config.in"
>> +source "package/linux-firmware/Config.in"
>
> Seems like a mismerge. You shouldn't be adding a
> linux-firmware/Config.in include.
Right. I did rebase to actual master and make wrong config resolve.
Will fix that.
>
>> +config BR2_PACKAGE_LIBATASMART
>> +     bool "libatasmart"
>> +     depends on BR2_PACKAGE_UDEV
>> +     help
>> +       Reading and Parsing Library.
>
> This description sounds odd. Reading and Parsing Library for what?
>
>> +       As the name suggests libatasmart only does ATA S.M.A.R.T.
>> +
>> +       http://www.linuxfromscratch.org/blfs/view/svn/general/libatasmart.html
>> +
>> +comment "libatasmart requires udev to be enabled"
>> +     depends on !BR2_PACKAGE_UDEV
>
> Could you detail a little why udev is a dependency. Is libudev a
> dependency? Something else? We need to understand if it's a build
> dependency, a runtime dependency, the requirement for the system to
> actually use and run udev, etc.
libudev is dependency for libatasmart.
>
>> diff --git a/package/libatasmart/libatasmart.mk b/package/libatasmart/libatasmart.mk
>> new file mode 100644
>> index 0000000..3f8e36b
>> --- /dev/null
>> +++ b/package/libatasmart/libatasmart.mk
>> @@ -0,0 +1,17 @@
>> +#############################################################
>> +#
>> +# libatasmart
>> +#
>> +#############################################################
>> +LIBATASMART_VERSION = 0.19
>> +LIBATASMART_SOURCE = libatasmart-$(LIBATASMART_VERSION).tar.xz
>> +LIBATASMART_SITE    = http://0pointer.de/public
>> +LIBATASMART_LICENCE = LGPL
>
> LICENSE. Be more specific that LGPL.
>
>> +LIBATASMART_LICELCE_FILE = LGPL
>
> LICENSE_FILES
>
>> +LIBATASMART_INSTALL_STAGING = YES
>> +
>> +LIBATASMART_AUTORECONF = YES
>
> Please add a comment here that explains why AUTORECONF = YES is needed.
>
>> +
>> +LIBATASMART_DEPENDENCIES = udev
>> +
>> +$(eval $(autotools-package))
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Thanks,

mbe

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
