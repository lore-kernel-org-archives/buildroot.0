From: Alexander (Sasha) Sirotkin <buildroot@browserseal.com>
Date: Wed, 31 Mar 2010 18:48:04 +0300
Subject: [Buildroot] init segfaults when compiled with glibc
In-Reply-To: <hovmml$391$1@dough.gmane.org>
References: <4BB20A06.1090407@browserseal.com> <4BB2794A.3030400@free.fr>
	<j2i478c82f01003310718gbaf125f7t382a3dd8ac5b3823@mail.gmail.com>
	<hovmml$391$1@dough.gmane.org>
Message-ID: <x2g478c82f01003310848x8e42f326v263e14193e0972a6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 31, 2010 at 5:37 PM, Javier Viguera <javier.viguera@digi.com>wrote:

> Alexander (Sasha) Sirotkin wrote:
>
>>
>> You are right, nevertheless the isssue, i.e. init sudden death is not
>> related to the instruction set - as I already mentioned, it works just fine
>> with uClibc. The problem appears only when I use external glibc based
>> toolchain.
>>
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

I did not manage to compile crosstoll-ng with eglibc yet. It looks like
eglibc support is broken in crosstool-ng and glibc support is broken in
buildroot.

Dead end...


>
> Give it a try to a newer version of glibc/eglibc (starting with 2.10) and
> let us know if it works.
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
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100331/6c65079c/attachment-0001.htm>
