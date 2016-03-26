From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 26 Mar 2016 17:45:20 -0300
Subject: [Buildroot] [PATCH 2/5] webkitgtk: new package
In-Reply-To: <20160326214112.0dff04cf@free-electrons.com>
References: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
 <1459020911-20593-3-git-send-email-gustavo@zacarias.com.ar>
 <20160326214112.0dff04cf@free-electrons.com>
Message-ID: <56F6F4E0.8040103@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/03/16 17:41, Thomas Petazzoni wrote:

>> +WEBKITGTK_LICENSE = LGPLv2.1+ BSD-2c
>
> Is it an "and" (in which case they should be comma separated) or an
> "or" (in which case it should be "LGPLv2.1+ or BSD-2c") ? If it's an
> "and", are the parts under each license identifiable ?

Hi.
It's and, LGPL for the glue part (gtk), BSD for the webkit part if i 
remember correctly. I'll add the coma.

>> +WEBKITGTK_LICENSE_FILES = \
>> +	Source/WebCore/LICENSE-APPLE \
>> +	Source/WebCore/LICENSE-LGPL-2.1
>> +WEBKITGTK_DEPENDENCIES = host-ruby host-flex host-bison host-gperf \
>> +	enchant harfbuzz icu jpeg libgtk3 libsecret libsoup \
>> +	libxml2 libxslt sqlite webp \
>> +	$(if $(BR_PACKAGE_XLIB_LIBXCOMPOSITE),xlib_libXcomposite) \
>> +	$(if $(BR_PACKAGE_XLIB_LIBXDAMAGE),xlib_libXdamage)
>
> And those two X11 dependencies already taken care of by libgtk3 ? Why
> only libXcomposite and libXdamage handled here and not the other ones ?
> Are they really useful for Wayland ?

No they aren't, they are explicit X11 deps for webkit, i'll move them 
down to the X11 block though since they aren't useful for wayland.
gtk3 wants/asks for: libx11, libxext, libxrender and libxi.

> You're again handling libX* dependencies here, so I guess there is some
> duplication/issue here.

Yes, forgot to clean up, will do for v2.
Regards.
