From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 16 Nov 2009 12:20:15 +0100
Subject: [Buildroot] [PATCH 4/8] flex: add flex-host package (required
	by webkit)
In-Reply-To: <87skcfy4ko.fsf@macbook.be.48ers.dk>
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
	<1258279977-1482-5-git-send-email-llandwerlin@gmail.com>
	<20091115152653.29810036@surf> <1258299584.24296.91.camel@coalu.atr>
	<87ws1ryd6v.fsf@macbook.be.48ers.dk>
	<1258308289.24296.94.camel@coalu.atr>
	<87skcfy4ko.fsf@macbook.be.48ers.dk>
Message-ID: <4d28d4b50911160320v1bd7e1b4i5faa01d99dfc733@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 15, 2009 at 8:24 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:
>
> Hi,
>
>  >> You must install 'flex' on your build machine
>  >>
>  >> make: *** [dependencies] Error 1
>
>  Lionel> I will recheck again tomorrow, it was on a machine at work (RH
>  Lionel> enterprise 5).
>
> OK.
>
>
I rechecked and flex is in fact installed, but it's not the good version (RH
Enterprise 5 has 2.5.4 instead of 2.5.33).

At least, gperf is not checked by dependencies.sh.



>  Lionel> By the way, what's the policy about host packages that should be
>  Lionel> included in buildroot ?
>
> Well, we try to keep the amount of dependencies low to make it easy to
> use, but within sane limits ofcourse, we don't want to build an entire
> host system as well.
>
> There's no hard fixed rules in other words. Certain things just have to
> be there (shell, make, toolchain). For the rest it's a question about:
>
>  - How big is the dependency (E.G. how much effort to compile for host)
>  - How version specific is the dependency (E.G. autoconf)
>  - How "standard" is the dependency - E.G. can we reasonably expect it
>   to be available on all/most developer machines?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091116/fd703e97/attachment-0001.htm>
