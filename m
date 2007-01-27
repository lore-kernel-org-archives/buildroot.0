From: joe at smittys.pointclark.net <joe@smittys.pointclark.net>
Date: Sat, 27 Jan 2007 10:42:36 -0500
Subject: [Buildroot] libintl_gettext errors at end of build??
In-Reply-To: <20070124140618.GB10837@aon.at>
References: <20070123192841.6sa6ze5j404ckcks@www.smittys.pointclark.net>
	<20070124140618.GB10837@aon.at>
Message-ID: <20070127104236.bf6l73fa98o0c4sk@www.smittys.pointclark.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Bernhard Fischer <rep.dot.nop@gmail.com>:

> On Tue, Jan 23, 2007 at 07:28:41PM -0500, joe at smittys.pointclark.net wrote:
>> Hello,
>> No matter what versions I choose I keep getting ": undefined reference
>> to `libintl_gettext'" error at the very end of the build. I tried to
>> build gettext into the build thinking this would solve the problem but
>> no go, still comes up. Looks like it is looking for it in the kernel
>> build config area? Anyone know why this is happening and how to
>> correct it?
>>
>> Thanks - Joe
>>
>>
>>
>
>> make[1]: Entering directory `/root/buildroot/build_i686/linux-2.6.19.2'
>>   HOSTLD  scripts/kconfig/conf
>> scripts/kconfig/conf.o(.text+0x93): In function `check_stdin':
>> : undefined reference to `libintl_gettext'
>
> Well sounds like you need gettext on the build-host installed.
> You could add a host-gettext to the gettext.mk that installs into the
> toolbuild_dir and use that if you do not want or can not install the gettext
> that comes with your distro..
>
> HTH,
>
>

Ok, I ws able to install gettext on the build-host but I had to  
configure it with the --disable-nls option.

This worked and the build went along but when I got to the part where  
it was building the kernel headers i am now getting an error "No space  
left on device" message. The build-host is 30gb with only about 5gb  
used. Is this "No space left on device" message referring to the user  
space of the final build image? If so how can I adjust it? Are the  
paremeters found in fakeroot or genext2fs?



Thanks - Joe
