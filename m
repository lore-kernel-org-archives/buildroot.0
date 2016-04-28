From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 28 Apr 2016 18:39:50 +0200
Subject: [Buildroot] [V4 1/3] libtommath: new package
In-Reply-To: <87h9em23v6.fsf@dell.be.48ers.dk>
References: <1460300126-11046-1-git-send-email-francois.perrad@gadz.org>
 <87h9em23v6.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRstC6V9123cEaw-B88hX=a5NxmtLq7doRSFKdBze1bcYCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

I am also in doubt with Dropbear.
1) Dropbear is a critical component for many system.
2) Dropbear is often released (5 releases in 2015, 2015.67 to
2015.71), but the bundled libraries (libtommath & libtomcrypt) seem
never updated (most of files are 9 years old, see
github.com/mkj/dropbear).
3) in V1 & V2 of this serie, by default, Dropbear was built with the
bundled libraries, but the BR policy is "always use unbundled library"
(see review from Thomas P.)

I need libtommath & libtomcrypt as dependencies for other packages, so
could you at least commit the 2 first patches ?

Fran?ois.

Note: I did some upstream works (C linting, ...) on these 3 packages,
with some Pull Requests (pending or already merged).


2016-04-27 22:28 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
>
>  > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>  > Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> I was going to apply this, but I'm now not so sure after all.
>
> - Dropbear linked with external libtom* is 25% bigger (375K vs 300K)
> - We need to patch dropbear
> - Libtomcrypt and dropbear need extra fixes to build without wchar
>   (LTC_NO_WCHAR)
> - Nothing else uses libtommath/crypt, and other distributions
>   (E.G. Debian) also use the bundled libraries.
>
> Can you explain if there's any strong reasons to not use the bundled
> versions?
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
