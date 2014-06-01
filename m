From: =?UTF-8?B?UGV0ZXIgS8O8bW1lbA==?= <syntheticpp@gmx.net>
Date: Sun, 01 Jun 2014 12:17:47 +0200
Subject: [Buildroot] [PATCH 1/2] ti-gfx: use only -I${includedir} as
	pkg-config Cflags
In-Reply-To: <20140601100906.GA3430@free.fr>
References: <1401616242-5692-1-git-send-email-syntheticpp@gmx.net>
 <20140601100906.GA3430@free.fr>
Message-ID: <538AFDCB.608@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01.06.2014 12:09, Yann E. MORIN wrote:
> Peter, All,
>
> On 2014-06-01 11:50 +0200, Peter K?mmel spake thusly:
>> Using only -I${includedir} in common practice.
>>
>> Settings only -I${includedir}/GLES2 breaks Qt5's CMake files,
>> because at configure time CMake only searchs the paths reported
>> by pkg-config, and not even /usr/include is used as default.
>
> I would add something like:
>
>      Even though pkg-config strips out standard include path, that's not
>      the case with pkgconf (which we are using) in cross-compilation,
>      which correctly reports the /usr/include dir prefixed with the
>      sysroot.
>
>> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
>
> With the above blurb added in the commit log:
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Also noticed it, but I though it will be added by git send-email (at least a Cc:)

>
> Regards,
> Yann E. MORIN.
>
>> ---
>>   package/ti-gfx/egl.pc    |    2 +-
>>   package/ti-gfx/glesv2.pc |    2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/ti-gfx/egl.pc b/package/ti-gfx/egl.pc
>> index 223fb04..36ea413 100644
>> --- a/package/ti-gfx/egl.pc
>> +++ b/package/ti-gfx/egl.pc
>> @@ -8,4 +8,4 @@ Description: TI Graphics SDK implementation of EGL
>>   Version: 1.9.2188537
>>   Requires:
>>   Libs: -L${libdir} -lEGL -lGLESv2 -lIMGegl
>> -Cflags: -I${includedir}/EGL/ -I${includedir}
>> +Cflags: -I${includedir}
>> diff --git a/package/ti-gfx/glesv2.pc b/package/ti-gfx/glesv2.pc
>> index 4c70aec..b458133 100644
>> --- a/package/ti-gfx/glesv2.pc
>> +++ b/package/ti-gfx/glesv2.pc
>> @@ -8,4 +8,4 @@ Description: TI Graphics SDK implementation of OpenGL ESv2
>>   Version: 1.9.2188537
>>   Requires:
>>   Libs: -L${libdir} -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGegl
>> -Cflags: -I${includedir}/GLES2
>> +Cflags: -I${includedir}
>> --
>> 1.7.10.4
>>
>
