From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Feb 2017 15:46:25 +0100
Subject: [Buildroot] [PATCH] support/scripts: add script to test a
	package
In-Reply-To: <87zihyqd0o.fsf@dell.be.48ers.dk>
References: <1486404173-31700-1-git-send-email-yann.morin.1998@free.fr>
 <508724e1-501e-4e44-6817-55bcdbf2f8ee@lucaceresoli.net>
 <20170207093303.GB3578@free.fr> <87zihyqd0o.fsf@dell.be.48ers.dk>
Message-ID: <20170207144625.GE3578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-02-07 15:41 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Luca, All,
>  > On 2017-02-06 21:40 +0100, Luca Ceresoli spake thusly:
>  >> On 06/02/2017 19:02, Yann E. MORIN wrote:
>  > [--SNIP--]
>  >> > +    printf ", olddefconfig"
>  >> > +    if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
>  >> > +        printf ": FAILED\n"
>  >> > +        return
>  >> > +    fi
>  >> > +    while read line; do
>  >> > +        if ! grep "^${line}\$" "${dir}/.config" >/dev/null 2>&1; then
>  >> 
>  >> I suggest removing the redirects and using 'grep -q' here.
> 
>  > grep -q is not POSIX. ;-)
> 
> But is that a real concern?

No, of course it is not. But I prefer not having non-portable stuff when
the portable solution is pretty easy and straightforward... Personal
preference...

Regards,
Yann E. MORIN.

> We do use grep -q quite a bit already
> (including in dependencies.sh):
> 
> git grep 'grep -q' | wc -l
> 46
> 
> -- 
> Bye, Peter Korsgaard

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
