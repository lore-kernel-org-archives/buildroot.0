From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 6 Oct 2012 21:37:41 +0200
Subject: [Buildroot] [PATCH v8 02/11] perl: new package
In-Reply-To: <20121006191817.618f5d98@skate>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <1348593508-14254-2-git-send-email-francois.perrad@gadz.org>
 <20121004231833.7c4f3cb5@skate>
 <CAB0FRstB06t_6PC9ocQ-M7r9EhmF9v1XwXwjQAjQnoC5oqGFYw@mail.gmail.com>
 <20121006191817.618f5d98@skate>
Message-ID: <CAB0FRssiQb_YJSsqwSy+EViX8F_aSUXkn6o2n4Zr91jyQyO+tA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/6 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>
> On Sat, 6 Oct 2012 15:33:02 +0200, Fran?ois Perrad wrote:
>
>> > Also, on the target there is a usr/bin/perl and a usr/bin/perl5.x.y
>> > files. One is a hardlink to the other, but it is always a bit
>> > disturbing to see two big files of the same size. Shouldn't we
>> > replace that by a symlink instead, which is more obvious?
>>
>> libperl.so  1.2 MB
>> perl      4 KB (stripped)
>> perl5.16.1   4 KB
>> We speak about 4KB !
>
> Here:
>
> $ ls -l output/target/usr/bin/perl*
> -rwxr-xr-x 2 thomas thomas 4558484 oct.   4 23:12 output/target/usr/bin/perl
> -rwxr-xr-x 2 thomas thomas 4558484 oct.   4 23:12 output/target/usr/bin/perl5.16.1
> -rwxr-xr-x 2 thomas thomas   41693 oct.   4 22:59 output/target/usr/bin/perlbug
> -rwxr-xr-x 1 thomas thomas     224 oct.   4 22:59 output/target/usr/bin/perldoc
> -rwxr-xr-x 1 thomas thomas   10766 oct.   4 22:59 output/target/usr/bin/perlivp
> -rwxr-xr-x 2 thomas thomas   41693 oct.   4 22:59 output/target/usr/bin/perlthanks
>
> So it's not exactly 4 KB :)
>

do you have a shared library libperl.so, in
output/target/usr/lib/perl5/5.16.1/-your-arch-/CORE/libperl.so ?
or in output/build/perl-5.16.1/libperl.so ?

looks like a static linked build
the use of shared lib is forced at configure time by the option : -Duseshrplib

I need to see the ouput of :
on your target :
     # perl -V
or on your host :
     $ output/host/usr/bin/qemu-your-arch output/build/perl-5.16.1/perl -Ilib -V

Fran?ois

> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
