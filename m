From: Nimai Mahajan <nimaim@gmail.com>
Date: Sun, 25 Feb 2018 18:10:59 +0000
Subject: [Buildroot] Drop support for Qt 5.6? [was: [RFC 1/2] qt5: bump
 latest version to 5.10.0]
In-Reply-To: <20180225175247.GB2276@scaer>
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
 <20180211161320.8864-2-gael.portay@savoirfairelinux.com>
 <1518442630960-0.post@n4.nabble.com>
 <78215947-020b-17da-27d8-89bcdfe1c859@mind.be> <20180225172619.GA2276@scaer>
 <CALoSW672Hh1KbdDRWE72JjZn4ajqM1zdFuNakGEJ3G0XM=g6hQ@mail.gmail.com>
 <20180225175247.GB2276@scaer>
Message-ID: <CALoSW678nNChNVY1pJfq7BKxW4f1YfGXXdcgRW8xsYQDSO0XvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 25, 2018, 12:52 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Nimai, All,
>
> On 2018-02-25 17:42 +0000, Nimai Mahajan spake thusly:
> > I completely overlooked the bump to LGPLv3, my apologies. As mentioned,
> it forces many companies to use the commercial license due
> > to much more stringent rules, which is unacceptable.
> > That being said, we use Qt at work on a daily basis and 5.6 is missing
> tons of new features and security updates, which forced us to
> > move to 5.9.x. 5.9.x added the new qt quick controls 2 embedded
> controls, which just about every project today is using, especially
> > on embedded devices that are resource limited.
>
> If you upgraded to 5.9, it means the licensing "issue" is not an issue
> for you. So, why do you not upgrade to 5.10 for your own project, then?
>

Thanks for the suggestion. While licensing is of course a major issue, its
not the only concern when upgrading. When you upgrade to the latest Qt,
they do not ensure binary and source compatibility (their official policy
is they "try" to not break anything). In production code, this is not
acceptable. Many libraries are also unstable.

Also, it's not about me and my project, I am just but one individual. I am
also concerned how it affects everyone else... therefore, I am fine with
whatever everyone decides.

>
> > I think the only compromise here is to rework the Qt build system to
> leave the Qt 5.6.x LTS series (legacy LTS), add in Qt 5.9.x LTS
> > (latest LTS), and Qt 5.10.x as the bleeding edge / latest. I'm not sure
> how others feel about that though and how much work that is.
> > It's not trivial to test all 3 versions on the myriad of architectures
> and platforms Buildroot supports.
>
> My position would be to just change the "latest" to be the actual
> latest, i.e. 5.10.
>

That's fine, but keep in mind this will never be as stable as their LTS
releases, where they are constantly fixing bugs (5.9 is supposed to be
supported til 2020, whereas 5.11 will come out in May and deprecate 5.10).
Latest branch just keeps getting new features thrown in it without fixes to
existing ones.

>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180225/71b2b48a/attachment.html>
