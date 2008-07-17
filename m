From: softa at ttechgroup.com <softa@ttechgroup.com>
Date: Thu, 17 Jul 2008 12:54:24 +0300
Subject: [Buildroot] aplay fails because of alsa-lib build issue with
	uclibc	and versioned symbols - (Solution included)
References: <mailman.1.1203278405.28189.buildroot@uclibc.org><5BF78BCE8D9BF14A83F836BD9E3916BA053E63@blrms.slti.sanyo.co.in>
	<487E0A0B.7010107@free.fr>
Message-ID: <002501c8e7f3$1a1a0080$6614a8c0@softalap>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Julien Boibessot" <julien.boibessot@free.fr>
To: "Gururaja Hebbar K R" <gururajakr@sanyo.co.in>
Cc: <buildroot@uclibc.org>
Sent: Wednesday, July 16, 2008 5:47 PM
Subject: Re: [Buildroot] aplay fails because of alsa-lib build issue with 
uclibc and versioned symbols - (Solution included)


> Hi,
>
> I was recently faced to the same problem Gururaja encountered some times
> ago:
> (my config is buildroot / uclibc / arm920)
>
> Gururaja Hebbar K R a ?crit :
>> when i tried aplay built shared with buildroot uclibc arm926ejs
>> toolchain it failed with below error
>>
>> mnt/mmc # aplay /home/default/10Sec_44.1K.wav
>> Playing WAVE '/home/default/10Sec_44.1K.wav' : Signed 16 bit Little
>> Endian, Rate 44100 Hz, Stereo
>> aplay: set_params:1012: unable to install sw params:
>> start_mode: DATA
>> ...
>>
> aplay fails with a strange error...
>> When i searched on the internet for below error, i found that this error
>> is mainly related to alsa-lib and uclibc and it requires adding
>> --with-versioned=no as an option to alsa-lib ./configure.
>>
>> http://article.gmane.org/gmane.linux.alsa.devel/50595
>>
>> i added the same to alsa-lib.mk and now its working fine.
>>
>> ./configure \
>> --target=$(GNU_TARGET_NAME) \
>> --host=$(GNU_TARGET_NAME) \
>> --build=$(GNU_HOST_NAME) \
>> --prefix=/usr \
>> --with-versioned=no \
>> --sysconfdir=/etc \
>> --enable-shared \
>> --enable-static \
>> --disable-docs \
>> $(DISABLE_NLS) \
>>
>>
> Gururaja suggested to add "--with-versioned=no" to alsa-lib configuration.
> It was the solution for me too, even if I have no idea why yet.
>
> Do the "non-arm" people have the same problem ? Is it related to uclibc
> for all architectures ?

Yes! x86 have the same problem too and "--with-versioned=no" solves the 
problem.

>
> Should I open a bug report to see this problem corrected ?
>
> Regards,
> Julien
> http://www.armadeus.com
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Regards,
Assen 
