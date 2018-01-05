From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 5 Jan 2018 13:46:45 +0100
Subject: [Buildroot] [PATCH 2/3] package/waffle: new package
In-Reply-To: <20171229232538.03219251@windsurf.lan>
References: <20171225154923.18773-1-romain.naour@gmail.com>
 <20171225154923.18773-2-romain.naour@gmail.com>
 <20171229232538.03219251@windsurf.lan>
Message-ID: <e33ef32e-c2a5-c0e0-022c-fef144a85550@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 29/12/2017 ? 23:25, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Mon, 25 Dec 2017 16:49:22 +0100, Romain Naour wrote:
>> diff --git a/package/waffle/Config.in b/package/waffle/Config.in
>> new file mode 100644
>> index 0000000000..a9799ef43e
>> --- /dev/null
>> +++ b/package/waffle/Config.in
>> @@ -0,0 +1,30 @@
>> +comment "waffle needs an OpenGL GL or EGL provider"
>> +	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
>> +	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBEGL
>> +
>> +config BR2_PACKAGE_WAFFLE
>> +	bool "waffle"
>> +	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
>> +	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBEGL
>> +	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
> 
> I'm curious: why are you selecting xlib_libX11, but not libxcb, while
> both seem to be needed for X11 support ?

Indeed but libxcb is selected by xlib_libX11 anyway.

I'll add it for the v2.

Best regards,
Romain

> 
> Other than this question, looks good to me.
> 
> Thanks!
> 
> Thomas
> 
