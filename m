From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 24 Oct 2009 21:07:08 +0200
Subject: [Buildroot] Autoconf still not building (M4 ) results
In-Reply-To: <87y6n0zmjp.fsf@macbook.be.48ers.dk>
References: <D675D91F830D4777BC8E1C8B2AF4CD7C@apexjs>
	<87y6n0zmjp.fsf@macbook.be.48ers.dk>
Message-ID: <1256411229.28475.78.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 24 octobre 2009 ? 20:14 +0200, Peter Korsgaard a ?crit :
> >>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:
> 
>  Sagaert> Peter
> 
>  Sagaert> ./output/host/usr/bin/m4 -F conftest.m4f </dev/null
> 
>  Sagaert> Produces a file (see attachement ) and does not complain on the console.
> 
>  Sagaert> This 
>  Sagaert> echo 'changequote(<,>)indir(<ifdef>,mac,bug)patsubst(a,\(b\)\|\(a\),\1)dnl'
>  Sagaert> |\
>  Sagaert>  output/host/usr/bin/m4 --trace=mac
> 
>  Sagaert> Does not output anything on the console
> 
> OK, that all looks normal. This is getting strange - To summarize:
> 
> - Fails on Ubuntu (what version?), but not on Debian
Which version of Debian ?
I'm using Debian unstable and I got the problem.

> - M4 check fails on autoconf2.64, works on 2.63 - But the M4 check is
>   almost completely the same for the two versions
> - The two tests done by the configure script succeeds when run by hand
> 
> Does it also fail if you prepend output/host/bin:output/host/usr/bin to
> the path before running configure by hand (E.G. a setup very close to
> how it's done in buildroot)?
> 
> It's hard for me to debug it here as I cannot reproduce it. It would be
> very helpful if you could add a few debug echo lines to ./configure
> around line 2356, so we can see what's going on.
> 
