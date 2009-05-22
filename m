From: George Matveev <geomat@europe.com>
Date: Fri, 22 May 2009 15:39:53 +0000
Subject: [Buildroot] unrecognized option `-Qy'
Message-ID: <20090522154000.07747478023@ws1-5.us4.outblaze.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

got pretty much same result using buildroot-2009.05-rc2.tar.bz2:

/home/work/buildrootgeo/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-as: unrecognized option 
`-Qy'
make[2]: *** [build/genmodes.o] Error 1
make[2]: Leaving directory 
`/home/work/buildrootgeo/toolchain_build_arm/gcc-4.3.2-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory 
`/home/work/buildrootgeo/toolchain_build_arm/gcc-4.3.2-initial'
make: *** 
[/home/work/buildrootgeo/toolchain_build_arm/gcc-4.3.2-initial/.compiled] 
Error 2
geomat at fermat:/home/work/buildroot200905rc2$

Configuration file (also attached) is a bit different this time:

BR2_GCC_TARGET_ARCH="armv4t"

was correctly recognized and no manual intervention was needed.

But still got this "unrecognized option `-Qy'" error.
This is simple busybox configuration done on Lenny.

Could someone possibly share .config which resulted in successful build?

Best regards,
George

> ----- Original Message -----
> From: "Gustavo Zacarias" <gustavo@zacarias.com.ar>
> To: "George Matveev" <geomat@europe.com>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] unrecognized option `-Qy'
> Date: Thu, 21 May 2009 16:45:18 -0300
>
>
> George Matveev wrote:
>
> > Hi,
> >
> > buildroot-2009.02.tar.bz2 returns this:
> >
> > 
> /home/work/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-as: unrecognized option > 
> `-Qy'
> > make[2]: *** [build/genmodes.o] Error 1
> > make[2]: Leaving directory > 
> `/home/work/buildroot/toolchain_build_arm/gcc-4.3.2-initial/gcc'
> > make[1]: *** [all-gcc] Error 2
> > make[1]: Leaving directory > 
> `/home/work/buildroot/toolchain_build_arm/gcc-4.3.2-initial'
> > make: *** > 
> [/home/work/buildroot/toolchain_build_arm/gcc-4.3.2-initial/.compiled] Error 
> > 2
> > geomat at fermat:/home/work/buildroot$
> >
> > when building for arm920t.
>
> Hi.
> Why don't you try with buildroot-2009.05-rc2?
> This was fixed after 2009.02 was released, i build arm920t images almost
> on a daily basis without major issues with gcc-4.3.3 + binutils-2.19.1.
> Regards.

>


-- 
Be Yourself @ mail.com!
Choose From 200+ Email Addresses
Get a Free Account at www.mail.com

-------------- next part --------------
A non-text attachment was scrubbed...
Name: armv4t.config
Type: application/octet-stream
Size: 17964 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090522/d1fd8b7b/attachment-0001.obj>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: log-make-200905rc2.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090522/d1fd8b7b/attachment-0001.txt>
