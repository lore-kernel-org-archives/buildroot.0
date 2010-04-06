From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 6 Apr 2010 15:15:25 +0000 (UTC)
Subject: [Buildroot] External toolchain built by buildroot no longer
	supported.
References: <hpfh61$drp$1@dough.gmane.org> <87y6h0r5e9.fsf@macbook.be.48ers.dk>
Message-ID: <hpfj6c$mpa$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-04-06, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:
>
> Grant> As of this commit
> Grant>   http://git.buildroot.org/buildroot/commit/?id=3b7aee23f2ab732f06b8a090ca002fb102d547ee
>
> Grant> use of of external toolchains built by buildroot is no longer
> Grant> possible.
>
> Grant> Are we to assume that crosstool-NG is now the "officially supported"
> Grant> source for external toolchains?
>
> Long term I think users are better off with using crosstool-NG for
> their toolchains, as that has a more active development community.

That seems to be the case.

> The buildroot toolchains work, and I do small fixes / version
> updates, but noone is really doing active development on them.
>
> As an example, GDB 7.x is out since October, but still not in BR (I
> had a quick look, but didn't get it to work).
>
> With that said, I would very much like to support BR toolchains as
> external toolchains if it's possible without too many dirty hacks
> (sorry, haven't been following the recent discussion about it).

AFAICT, the recent commit relies on the assumption that both --prefix
and --sysroot values are correct and that the "prefix" is a child of
"sysroot".

That's not the case for buildroot toolchains.  They have a prefix of
"/usr" and a sysroot pointing to the output/staging directory.  I'm
guessing that setting the buildroot toolchain's --prefix value to
output/staging/usr should fix the problem, but I'm still a bit fuzzy
on how the recently committed change works.

> Besides the advantages you listed there's also the fact that it will
> make migration easier in the future - E.G.:
>
> BR with internal toolchain -> BR with external BR toolchain -> BR with
> crosstool-NG toolchain.

True.

-- 
Grant Edwards               grant.b.edwards        Yow! My mind is making
                                  at               ashtrays in Dayton ...
                              gmail.com            
