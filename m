From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sat, 13 Jul 2013 12:08:45 -0500
Subject: [Buildroot] [PATCH v5 2/3] ti-gfx: add new package
In-Reply-To: <20130713161147.7ef19265@skate>
References: <1373639678-7357-1-git-send-email-spenser@gillilanding.com>
 <1373639678-7357-2-git-send-email-spenser@gillilanding.com>
 <20130713161147.7ef19265@skate>
Message-ID: <CAEBucnCzR0mMnch+TbcFZJ3o=fBTDM5NZ1BwoRUhOzROiU+fiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 13, 2013 at 9:11 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Spenser Gilliland,
>
> On Fri, 12 Jul 2013 09:34:37 -0500, Spenser Gilliland wrote:
>
>> diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
>> index bd8040d..00e1f19 100644
>> --- a/package/opengl/libegl/libegl.mk
>> +++ b/package/opengl/libegl/libegl.mk
>> @@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>>  LIBEGL_DEPENDENCIES += rpi-userland
>>  endif
>>
>> +ifeq ($(BR2_PACKAGE_TI_GFX),y)
>> +LIBEGL_DEPENDENCIES += ti-gfx
>> +endif
>
> No, if you have introduced the powervr virtual package, then libegl
> should not directly depend on ti-gfx, but instead libegl should depend
> on powervr, which itself will depend on ti-gfx.

I don't believe this to be correct.  There is not specific dependency
chain as each powervr package implements its own set of egl/gles/vg.
The point of the PowerVR package is for each package that takes
advantage of PowerVR specific features.  IE. QT4.

Therefore, ti-gfx should depend on libgles, libegl,and powervr.

Thanks,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
