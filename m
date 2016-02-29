From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Mon, 29 Feb 2016 09:17:55 +0100
Subject: [Buildroot] [nano] error compiling nano
In-Reply-To: <87a8mnv5nq.fsf@dell.be.48ers.dk>
References: <CALtfCQZsG=u4scz83-6Ke1iVp9pDqpiN79365vnS2mpF05SFRw@mail.gmail.com>
 <87a8mnv5nq.fsf@dell.be.48ers.dk>
Message-ID: <CALtfCQbFpphcc4AS_BEEOpphEemSGMGs8PAfbyF_KPB-4cTitg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Your proposal works perfectly.

Thank you very much.

Oscar Gomez Fuente

On 26 February 2016 at 16:43, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "?scar" == ?scar G?mez Fuente <oscargomezf@gmail.com> writes:
>
>  > Hi,
>  > I'm trying to compile the test editor: nano, with raspberrypi2_defconf
>  > configuration and fail. It seems to be that the problem is in the source
>  > file: char.c.
>
>  > I attached you the log of the make:
>
>  > ---
>  > ...
>  >      IGNORE_CALL_RESULT(mbtowc(NULL, NULL, 0));
>  >      ^
>  > chars.c: In function ?wctomb_reset?:
>  > chars.c:101:5: warning: implicit declaration of function ?wctomb?
>  > [-Wimplicit-function-declaration]
>  >      IGNORE_CALL_RESULT(wctomb(NULL, 0));
>
> Nano needs wide character support. It sounds like you have built a
> toolchain without it, and then changed the toolchain configuration and
> added nano without doing a clean rebuild.
>
> You need to do a clean rebuild if you change toolchain options.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160229/5b35e97d/attachment.html>
