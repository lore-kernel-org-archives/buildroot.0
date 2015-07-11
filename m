From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 11 Jul 2015 15:12:33 +0200
Subject: [Buildroot] [PATCH 28/32] package/x11r7/xlib_libXpresent: new
 package
In-Reply-To: <20150418145901.7849d444@free-electrons.com>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
 <1429360844-12625-28-git-send-email-bernd.kuhls@t-online.de>
 <20150418145901.7849d444@free-electrons.com>
Message-ID: <55A11641.3080802@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd, Thomas, all

Le 18/04/2015 14:59, Thomas Petazzoni a ?crit :
> Dear Bernd Kuhls,
> 
> On Sat, 18 Apr 2015 14:40:40 +0200, Bernd Kuhls wrote:
> 
>> diff --git a/package/x11r7/xlib_libXpresent/Config.in b/package/x11r7/xlib_libXpresent/Config.in
>> new file mode 100644
>> index 0000000..f9cad60
>> --- /dev/null
>> +++ b/package/x11r7/xlib_libXpresent/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_XLIB_LIBXPRESENT
>> +	bool "libXpresent"
>> +	select BR2_PACKAGE_XLIB_LIBX11
>> +	select BR2_PACKAGE_XLIB_LIBXEXT
>> +	select BR2_PACKAGE_XLIB_LIBXFIXES
>> +	select BR2_PACKAGE_XLIB_LIBXRANDR
>> +	select BR2_PACKAGE_XPROTO_PRESENTPROTO
>> +	select BR2_PACKAGE_XPROTO_XPROTO

By looking at the configure.ac, it seems that libXpresent depends only on
xproto-presentproto.

I missed your patch, so I have packaged my own version for my efl-1.14 branch:

https://github.com/RomainNaour/buildroot/commit/59b59baf6a2d17db9a0ede6677879f686bf3bb79

It build fine with only xlib_libX11 and xproto_presentproto as dependency.

>> +	help
>> +	  X Present Extension C Library
>> +	  This package contains header files and documentation for the Present
>> +	  extension.  Library and server implementations are separate.
> 
> This seems weird. The package is named "xlib_libXpresent", but it does
> not contain the library? This description looks more like a xproto*
> description than a xlib* description.

You can use the description from the debian package:
https://ftp-master.debian.org/new/libxpresent_1.0.0-1.html

> 
>> +$(eval $(host-autotools-package))
> 
> Why is a host package needed?

As I can say, libXpresent doesn't need a host package to build.

Best regards,
Romain Naour

> 
> Thanks!
> 
> Thomas
> 
