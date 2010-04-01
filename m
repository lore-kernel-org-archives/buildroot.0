From: Alexander (Sasha) Sirotkin <buildroot@browserseal.com>
Date: Thu, 1 Apr 2010 10:48:34 +0300
Subject: [Buildroot] init segfaults when compiled with glibc
In-Reply-To: <hovmml$391$1@dough.gmane.org>
References: <4BB20A06.1090407@browserseal.com> <4BB2794A.3030400@free.fr>
	<j2i478c82f01003310718gbaf125f7t382a3dd8ac5b3823@mail.gmail.com>
	<hovmml$391$1@dough.gmane.org>
Message-ID: <g2k478c82f01004010048k4be4d5b6k45052abe0249f81e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 31, 2010 at 5:37 PM, Javier Viguera <javier.viguera@digi.com> wrote:
> Alexander (Sasha) Sirotkin wrote:
>>
>> You are right, nevertheless the isssue, i.e. init sudden death is not
>> related to the instruction set - as I already mentioned, it works just fine
>> with uClibc. The problem appears only when I use external glibc based
>> toolchain.
>
> I had the same problem a month ago more or less. With a glibc toolchain
> built with crosstool-NG the init process was dying and the kernel panic'ing
> as a result because init (pid=1) was not supposed to die.
>
> Unfortunately i could not manage to find what the problem was. All i found
> is that it was happening with some versions of glibc while it was working
> with other versions: glibc-2.9 was failing, so my workaround was finally to
> select EGLIBC-2.10 to build the toolchain. With that version it worked for
> me.
>
> Give it a try to a newer version of glibc/eglibc (starting with 2.10) and
> let us know if it works.

Eventually I managed to compile crosstool-ng with eglibc 2.10 after
downgrading the compiler to 4.3.2 from 4.4.1 and binutils to 2.19 from
2.20. This one seems to work OK with buildroot.

>
> --
> Regards,
>
> Javier Viguera
> Software Engineer
>
> Digi International Spain, S.A.
> http://www.digi.com
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
