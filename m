From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 8 Jul 2011 23:16:38 +0200
Subject: [Buildroot] Download external toolchain with make source
In-Reply-To: <87ei20yiab.fsf@macbook.be.48ers.dk>
References: <CA+Xn3W1gTygZ03eu15dafntc2Nynn6X=cNgzKsW2RmRh9oPh2A@mail.gmail.com>
 <87ei20yiab.fsf@macbook.be.48ers.dk>
Message-ID: <201107082316.38408.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Herv?, All,

On Friday 08 July 2011 16:10:52 Peter Korsgaard wrote:
> >>>>> "Herve" == Fache, Herve <h-fache@ti.com> writes:
> 
>  Herve> Hello list,
>  Herve> We have a need for an external toolchain, and need to be able to
>  Herve> download everything for off-line compilation. To reach this goal, we
>  Herve> have added the option for make source to download the external
>  Herve> toolchain together with the packages.
> 
>  Herve> I thought you may be interested in this very simple patch to support
>  Herve> this feature :-)
> 
> Thanks. I would prefer to use (ab)use the uclibc-source target, similar
> to how we ensure the external toolchain gets setup before building
> packages.
> 
> I also just noticed crosstool-ng needs it as well.

For crosstool-NG, that's not that easy. There is no top-level rule to just
do the download. crosstool-NG does its own downloading.

So, we have to build crosstool-NG, which implies building host-gawk and
host-automake, and their dependencies...

I've done the necessary stuff here, and will post a patch shortly after a
little bit more of testing...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
