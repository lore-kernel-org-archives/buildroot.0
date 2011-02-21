From: Marco <chopin1998@gmail.com>
Date: Mon, 21 Feb 2011 18:24:55 +0800
Subject: [Buildroot] build python failed
In-Reply-To: <871v31eq4s.fsf@macbook.be.48ers.dk>
References: <AANLkTinfpWsELrvHSZYq1+w-W_zF6fgoSVgPEMVYxvjg@mail.gmail.com>
	<871v31eq4s.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTi=u98Dp4Ts2jYN_3oi3Ni8dHEOUy7PC6gjp4-r9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WOW, that' cool!  Python running!

Thank thee very much!

On Mon, Feb 21, 2011 at 4:41 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Marco" == Marco  <chopin1998@gmail.com> writes:
>
>  Marco> Hi, All
>
>  Marco>     my buildroot has git pulled, and my target is at91sam9260. I
>  Marco> choose python package via make menuconfig, but make failed:
>
>
>  Marco>     In file included from Include/Python.h:86,
>  Marco>                      from ./Modules/python.c:4:
>  Marco>     Include/unicodeobject.h:575: warning: type defaults to 'int' in
> declaration
>  Marco>     of 'wchar_t'
>
> It doesn't find the wchar_t type.
>
> Python does depend on wchar support in the toolchain, so you probably
> have done a build without wchar, and then gone and added wchar support
> and python without doing a clean rebuild.
>
> For this kind of toolchain changes you need to do make clean; make.
>
>
> --
> Bye, Peter Korsgaard
>



-- 
LinuX
Violin
Canon EOS
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110221/9d683055/attachment.html>
