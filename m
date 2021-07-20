From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 20 Jul 2021 10:56:59 +0200
Subject: [Buildroot] [PATCH] package/libmbim: bump to version 1.24.8
In-Reply-To: <CAAP7ucKbpPfUROc=rm2U4idc23+MOC8TJ405Qxf-M5CkHnz=TQ@mail.gmail.com>
References: <20210712091827.335522-1-aleksander@aleksander.es>
 <20210716225449.382c1426@windsurf>
 <CAGm1_kuFhe7U+qYMRiPP2htmfCDR4kmOKFaX0Vnsfh0XvSQVUA@mail.gmail.com>
 <CAAP7ucKbpPfUROc=rm2U4idc23+MOC8TJ405Qxf-M5CkHnz=TQ@mail.gmail.com>
Message-ID: <CAGm1_kvyEXaH8ZpZZdq5fWJw2ZDrtXS7ZxE4sDRO_uYQ1aKfvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Aleksander,

On Tue, Jul 20, 2021 at 10:45 AM Aleksander Morgado
<aleksander@aleksander.es> wrote:
>
>
>>
>> I still experience this error [1]. Any ideas?
>>
>> I have also applied libgudev patches as their build was failing.
>>
>> [1] http://autobuild.buildroot.net/results/f8a81aad0e262a567a2b31712575472ae92e5518/build-end.log
>>
>
> My eyes are failing, I'm not sure which is the issue that triggers the build error. Is it the -Winline issues? The build should go on in that case, as we don't have -Werror. Not really sure.

If I rerun "make", it ends as follows:

/usr/bin/make  all-recursive
Making all in .
Making all in build-aux
Making all in templates
make[5]: Nothing to be done for 'all'.
Making all in mbim-codegen
make[5]: Nothing to be done for 'all'.
Making all in .
make[5]: Nothing to be done for 'all-am'.
Making all in data
Making all in .
make[5]: Nothing to be done for 'all-am'.
Making all in pkg-config
make[5]: Nothing to be done for 'all'.
Making all in src
Making all in common
Making all in .
make[6]: Nothing to be done for 'all-am'.
Making all in test
make[6]: Nothing to be done for 'all'.
Making all in libmbim-glib
Making all in generated
/usr/bin/make  all-am
make[7]: Nothing to be done for 'all-am'.
Making all in .
make[6]: *** No rule to make target 'Mbim-1.0.typelib', needed by
'all-am'.  Stop.
Makefile:802: recipe for target 'all-recursive' failed
make[5]: *** [all-recursive] Error 1
Makefile:399: recipe for target 'all-recursive' failed
make[4]: *** [all-recursive] Error 1
Makefile:456: recipe for target 'all-recursive' failed
make[3]: *** [all-recursive] Error 1
Makefile:388: recipe for target 'all' failed
make[2]: *** [all] Error 2

The problem seems to be: No rule to make target 'Mbim-1.0.typelib',
needed by 'all-am'.

Best regards,
Yegor
