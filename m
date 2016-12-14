From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Dec 2016 17:42:55 +0100
Subject: [Buildroot] [PATCH 0/3] core/pkg-infra: allow packages to
 provide permisions in a file
In-Reply-To: <87r35b1mrk.fsf@dell.be.48ers.dk>
References: <cover.1481665059.git.yann.morin.1998@free.fr>
 <87r35b1mrk.fsf@dell.be.48ers.dk>
Message-ID: <20161214164255.GB3617@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-12-13 23:34 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Hello All!
>  > This series is a quick proof-of-concpet to allow packages to provide a
>  > permission table in a file rather than in-line in the .mk fiile.
> 
>  > That permission file can be generated. It is usefull for the SELinux
>  > stuff and busybox, where individual applets should have a suid bit, but
>  > we only know what applets exist at configure time, not when parsing the
>  > .mk file.
> 
>  > This is RFC material, jsut for quick review of the concept, not the
>  > actual code. This is not meant to be applied now.
> 
> I'm not really happy with having 2 ways of specifying per-package
> permissions, but OK - perhaps it is the best way of handling this.
> 
> Alternatively we could drop the check-for-empty <pkg>_PERMISSIONS in
> pkg-generic.mk, so PACKAGES_PERMISSIONS only get expanded at filesystem
> creation time and then do something like:
> 
> BUSYBOX_PERMISSIONS = \
>         $(if $(shell grep 'CONFIG_PING=y' $(BUSYBOX_BUILD_CONFIG)),/bin/ping f 4755 0  0 - - - - -$(sep)) \
>         $(if $(shell grep 'CONFIG_PING6=y' $(BUSYBOX_BUILD_CONFIG)),/bin/ping6 f 4755 0  0 - - - - -$(sep))

Which is exactly what I suggested on IRC...

> But that also isn't very pretty.

.. and which I also dismissed becayuse it is not nice either.

I prefer that we have a proper infra in place rather than do tricks like
that...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
