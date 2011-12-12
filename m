From: Guillaume Gardet <guillaume.gardet@free.fr>
Date: Mon, 12 Dec 2011 11:13:15 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <87hb16up5z.fsf@macbook.be.48ers.dk>
References: <4EE1CB14.9010802@free.fr> <20111209193729.0cc88e6e@skate>
 <87y5ull8z0.fsf@macbook.be.48ers.dk> <87ty59l5y1.fsf@macbook.be.48ers.dk>
 <CAHUNapRt1=nyUK=o__fUDk2JQVn66F1ikwBF+jarECg9=CESSg@mail.gmail.com>
 <4EE5B9E9.40404@free.fr> <87hb16up5z.fsf@macbook.be.48ers.dk>
Message-ID: <4EE5D3BB.7000700@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Le 12/12/2011 10:15, Peter Korsgaard a ?crit :
>>>>>> "Guillaume" == Guillaume Gardet<guillaume.gardet@free.fr>  writes:
>   Guillaume>  Hi,
>   Guillaume>  I finally found the problem. It comes from the file /usr/share/site/x86_64-unknown-linux-gnu which deals with lib64 and does not support arm.
>   Guillaume>  A bug report with a patch has been submitted on openSUSE bugzilla :
>   Guillaume>  https://bugzilla.novell.com/show_bug.cgi?id=736143
>
> Ahh. I guess the best approach in buildroot is simply to unset
> CONFIG_SITE.

If buildroot do not use/need it, yes.
Because I have same kind of troubles with some host packages now (not yet released packages). :(

If I unset CONFIG_SITE, it seems to work fine. :)
Could you unset CONFIG_SITE in Buildroot, please?

Guillaume
