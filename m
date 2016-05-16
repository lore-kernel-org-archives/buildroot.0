From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 16 May 2016 06:03:12 +0200
Subject: [Buildroot] [PATCH] package/gcc: 4.8.x to 5.x: backport a fix
 for building gcc with gcc-6
In-Reply-To: <20160515221745.6db55477@free-electrons.com>
References: <1463291260-2544-1-git-send-email-s.martin49@gmail.com>
 <20160515211743.0dba51fd@free-electrons.com>
 <CAHXCMMLLCTp79YOTj0N_U1FfdK0XwYp5dTmnFpBO-sw4OD_QJg@mail.gmail.com>
 <20160515221745.6db55477@free-electrons.com>
Message-ID: <CAHXCMMKsanJKgU9-WpXcHmnpL0kE8EX+d99si-nOkSt2TeOr8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 15, 2016 at 10:17 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 15 May 2016 22:01:12 +0200, Samuel Martin wrote:
>
>> >>  package/gcc/4.8.5/130-build_gcc-5_with_gcc-6.patch | 153 +++++++++++++++++++++
>> >>  package/gcc/4.9.3/130-build_gcc-5_with_gcc-6.patch | 153 +++++++++++++++++++++
>> >
>> > Isn't it a bit odd to have a patch named "build_gcc-5_with_gcc-6" when
>> > in fact you're fixing gcc 4.x ?
>>
>> Well, I just imported the patch from crosstool-ng without renaming it,
>> but I did run the build test for the 6 versions of gcc Buildroot
>> currently supports:
>> - 4.7.4 (deprecated): patch not needed
>> - 4.8.5: patch needed
>> - 4.9.3: patch needed
>> - 5.3.0: patch needed
>> - 6.1.0: patch needed
>
> gcc 6 cannot be built with gcc 6 without patches? Plus your patch did
> not contain any patch against gcc 6.
Oops, my bad!
Of course gcc-6.1.0 do not needed this patch.

>
>> - arc-2015.12 (based on gcc-4.8.5): patch needed
>>
>> If you prefer, I can rename them, then repost the patch...
>
> Yes, renaming would be nicer. Just 130-fix-build-with-gcc-6.patch is
> fine, for example.
v2 on its way.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Regards,

-- 
Samuel
