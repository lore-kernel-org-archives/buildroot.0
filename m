From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 27 Sep 2012 18:01:13 +0200
Subject: [Buildroot] How to enable sighold and sigrelse in uClibc ?
In-Reply-To: <5064763D.8010203@petroprogram.com>
References: <5064763D.8010203@petroprogram.com>
Message-ID: <CAHXCMMLRnbyOdS+nsTwCiZG1GA7MYh2VL6uEQaiWLeWMV1JyrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

2012/9/27 Stefan Fr?berg <stefan.froberg@petroprogram.com>:
> Hello everyone
>
> I need to enable sighold() and sigrelse() functions in uClibc (version
> 0.9.33 using NPTL)
> and I have enabled the corresponding UCLIBC_SUSV4_LEGACY (Enable SuSv4
> Legacy or obsolescent functions)
> option in .config.
>
> However, when trying to use those functions in application they are
> undeclared and
> indeed, when checking from uClibc source directory libc/signal I see
> that they are not even compiled
> (no sighold.o and sigrelse.o).
>
> So what else is needed to make sighold.o and sigrelse.o ?
>
> Best regards
> Stefan
>
> P.S:
> Is there __fxstat64() function somewhere in uClibc ?

Whenever one changes the uclibc configuration, the whole toolchain
should be rebuilt.

So, after running 'make uclibc-menuconfig', to rebuild everything, you
should run: 'make clean all'.


Regards,

-- 
Sam
