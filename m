From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 7 Nov 2011 11:23:09 +0100
Subject: [Buildroot] QT support for Buildroot RFS.
In-Reply-To: <20111107111749.7748f185@skate>
References: <1F383CDA589639468828C7E2B75EDE9D06029498@POCITMSEXMB02.LntUniverse.com>
 <1F383CDA589639468828C7E2B75EDE9D0602B149@POCITMSEXMB02.LntUniverse.com>
 <CAGm1_ks4qcMAV7gPyq4odX4ub+RXnh=BmhrU4zzdU4_BQ+m0oA@mail.gmail.com>
 <1F383CDA589639468828C7E2B75EDE9D0602B1A8@POCITMSEXMB02.LntUniverse.com>
 <20111107111749.7748f185@skate>
Message-ID: <CAAXf6LU-bEEV_8RkpCwERcS3Xg1SAcLx4M+f2qCKFyCB+xT-7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 7, 2011 at 11:17 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Mon, 7 Nov 2011 10:11:15 +0000,
> Mahanteshwari Hiremath <Mahanteshwari.Hiremath@lnties.com> a ?crit :
>
>> Cross compiling is not a problem, I can able to do it. But I want to
>> compile my program directly on target device using qmake, I want to
>> have qmake support on my target. So only I wanted some suggestions in
>> executing this.
>
> This is not supported in the current Buildroot, which does not build
> qmake for the target. Buildroot is designed for cross-compilation, i.e
> the situation where your target is rather slow compared to your
> development PC, and therefore cases for which native compilation is not
> possible or really too painful. We have some support to have a native
> toolchain on the target (so you can build standard C or C++ programs on
> the target), but we don't support that for Qt.
>
> If you want, you can work on extending the Qt .mk file to also generate
> a qmake for the target, but I think it's going to be very complicated
> for a benefit that isn't really obvious to me.

Alternatively, you can download and compile Qt on your target itself,
with the native toolchain that you installed there.

You could even (but this is really far-fetched) install buildroot on
your target, and use it to generate qmake (which will be in
output/host *on your target*).

Best regards,
Thomas

>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
