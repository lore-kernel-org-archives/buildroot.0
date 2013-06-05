From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 5 Jun 2013 11:17:44 -0700
Subject: [Buildroot] AM3517 Neon, OpenGL & EGLFS support
In-Reply-To: <CAMYPSMpE=ziBR4TuRbkjG+78fcJ=DXA67ePTXTDBPDRv+asEyw@mail.gmail.com>
References: <CALo-6+h9ELx+Hp_OQB0kvrdv9mH1VKnrKKcTTXLNSYkK0vFhHQ@mail.gmail.com>
 <CAMYPSMpE=ziBR4TuRbkjG+78fcJ=DXA67ePTXTDBPDRv+asEyw@mail.gmail.com>
Message-ID: <CALo-6+hLNK70Bdh7C+ViD+T8XgbpKdBorcsqZfvhNqz-cbcV5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Wojciech:

Thank you very much.

I look at your patch and it is addressing the things I have been
struggling with and then some. I need to test and understand what it
is doing, but I think it is certainly going in the right direction.

I also am using a seperate tree for the Graphics_SDK, so this recipe
is consistent. I am using the CodeSourcery 2011.09 that is part of
buildroot with similar flags, but will double check the flags.

You give me hope that the light at the end of the tunnel I am
currently in is daylight and not an approaching express train.

Charles

On 6/5/13, Wojciech Sle?ska <wojciech.slenska@gmail.com> wrote:
> Hello Charles,
>
> I already have full OpenGL ES support on my TI AM3517 in QT5 using eglfs
> plugin.
>
> I use following half-manual procedure to made this:
> 1. I build kernel modules using TI Graphics_SDK_4_09_00_01 package,
> downloaded from TI page
> 2. I made some changes in qt5 build scripts (check attachment) in
> buildroot and add path to ti libs
>
> As compiler I use arago-2011.09 with following flags -march=armv7-a
> -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
>
> 3. When build is finished. I copy some files from
> Graphics_SDK_4_09_00_01/gfx_rel_es3.x/ directory to target rootfs.
> 4. Now I can run ./hellogl_es2 -platform eglfs
>
> I hope that this solution will help You.
>
> Best Regards
> Wojciech Slenska
>
> 2013/6/5 Charles Krinke <charles.krinke@gmail.com>:
>> This is probably a question for Prabu and Spenser as I undestand a
>> buildroot patch is on the near horizon for Qt5 and OpenGL.
>>
>> I have downloaded last nights nightly build of buildroot and built Qt5
>> for ARM for the TI AM3517 as we try to move from Qt-4.8.2 to Qt-5.0.2
>> and am looking at three features that are currently disabled.
>>
>> These are support for Neon, OpenGL & EGLFS.
>>
>> I was able to add QMAKE_INCDIR_OPENGL_ES2, QMAKE_LIBDIR_OPENGL_ES2 &
>> QMAKE_LIBS_OPENGL_ES2 to the mkspec patch this week using last weeks
>> buildroot-20130529 and get OpenGL to compile pointing to my external
>> TI Graphics_SDK, but then get into trouble with EGLFS and later on
>> with VERSION in qt_module.prf. So, I think there is a bit more to the
>> problem then just adding constants to the mkspecs patch.
>>
>> Can someone possibly describe more of what needs to be done in a
>> dialect of techno-babble that I understand to get these three features
>> supported for the AM3517, please?
>>
>> --
>> Charles Krinke
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Charles Krinke
