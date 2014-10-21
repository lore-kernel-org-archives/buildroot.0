From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 21 Oct 2014 20:23:47 +0200
Subject: [Buildroot] [PATCH 1/1] Add proxy download support
In-Reply-To: <20141021164901.GF3912@free.fr>
References: <1413903203-33909-1-git-send-email-kaszak@gmail.com>
 <20141021164901.GF3912@free.fr>
Message-ID: <CABbD_XC3g0Avbeydtg3Aq9v9HsP5Eh+yKnxVBVchFcNFVEQrtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
> NAK.
>
> This should belong to the user's envirnment.
>
> OK, but then I think this should be stated in the user manual.


> I once tried to handle proxy support in crosstool-NG, and after trying
> to handle the exponentially growing cases (http proxy, with or without
> authentication, socks proxy...)
>
This handles standard http proxies (hence the name) with or without auth.
Most proxies (and even corporate ones) fall into this category (like Squid,
MS Forefront, etc).


>
> Also, this solution is not bullet proof, because it leaves alone
> non-http protocols: cvs, git, svn, scp...
>
Not true. Only CVS won't work, but:
A, There is currently no CVS based package in Buildroot
B, If there would, it would fall back the sources.buildroot.com, which is
http
C, I may have mislooked and CVS can be proxied - if You allow me to send a
V2, I will introduce that too

All other download methods work with the distributed packages.
Should at least, I only downloaded a few packages from every possible type.

AFAIK SCP & SSH are not standard download methods in the packaging system,
they are
added functionality for custom packages.


>
> Actually, it does take care of git, but some proxies do not allow the
> CONNECT to anything else than 443, so we're back to square one for the
> git protocol anyway.

Git always falls back back to https (the "instead of" directive) and the
standard 443,
because git:// protocol simply cannot be proxied.


> If we were to add a proxy setting, then users would expect it to work
> for all kind of downloads, which is absolutely impossible to achieve.
>
It does work with all existing packages (again, I found no CVS, SCP or SSH
based packages in the distribution).
I can proxy scp or ssh over http, but that relies on the user's proxy
server - there are proxies which won't allow a
CONNECT method for ssh.


>
> So, we do not have a 100% coverage, and quite some is left out.
>
Please name, I will try my best, to send a V2 covering those methods.
Currently it support the 5 types that
are used in the packages.


>
> So, I prefer we not have any of this proxy settings in Buildroot at all,
> and just rely on the user's environment to be properly set up.
>
I think setting up all methods in the user environment is possible, but
sometimes can be quite complicated.

Thank you for your opinion, could you state in which case would you accept
the patch?
I think I can add CVS support, and ssh/scp support - which means ALL 8
download helpers would be able to
use http proxies.
And again, this is a http proxy patch, I didn't aim to support all proxy
types in the world, as that would be
probably pointless.

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141021/32f00315/attachment.html>
