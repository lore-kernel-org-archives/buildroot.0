From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Sep 2015 23:23:23 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <8737yg3dt0.fsf@dell.be.48ers.dk>
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
 <20150904101128.4206779d@free-electrons.com>
 <55E9540C.9060000@mind.be> <20150904163121.GD4540@free.fr>
 <8737yg3dt0.fsf@dell.be.48ers.dk>
Message-ID: <20150914212323.GB3602@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-09-14 23:12 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> >> I will always turn this option on, even in non-systemd, because it makes for a
>  >> better environment. See the Fedora document for a long explanation why split
>  >> /usr is just legacy baggage. Other parts of your system will also work better
>  >> when this option is turned on - no more confusion between busybox installing
>  >> something in /bin and the full package putting it in /usr/bin. No more worries
>  >> about a shebang being correct.
>  >> 
>  >> So no, I don't want this to be hidden.
> 
>  > Ditto, I do not want this to be hidden. I want to have the choice of
>  > using a merged-usr even without systemd (and I even have a use-case in
>  > my head for that).
> 
> And as explained, we might even want to default it to y in the future,
> just because it is simpler when you have a single rootfs.
> 
> Is there any reason why we explicitly add the symlinks for /bin / /sbin
> and /lib and don't just do:
> 
> ln -sf . usr

Well, for one, I would not like to have that, otherwise, we would have
an infinite hierarchy:

    cd /usr/usr/usr/usr/usr/

and that's ugly... :-(

Also, I'd like we do not diverge too much from what distros are doing,
and they are doing the /{bin,sbin,lib} symlink dance.

Finally, fundamentally, things are now to be put into /usr rather than /
so it makes more sense to have the symlinks that way rather than the
other way around as you suggest.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
