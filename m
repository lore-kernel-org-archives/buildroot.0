From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 27 Jan 2010 15:43:41 +0100
Subject: [Buildroot] toolchain problem:wrong path in libSDL.la
In-Reply-To: <4B5633CF.3000605@gmx.de>
References: <4B55DEAF.40808@gmx.de> <4B55FFC2.3010800@free.fr>
	<4B5633CF.3000605@gmx.de>
Message-ID: <4B60511D.2000409@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jens,

Jens a ?crit :
> Hi Julien,
>
> Thank you very much! Yes in staging_dir libdir of libSDL.a has fixed now.
> But your patch is just a workaround because in build dir of SDL the
> path will be still wrong.
and why do you need libSDL.la from SDL build dir ?
Shouldn't you use staging_dir content to link your application against
SDL (or other .so) ?
>
> Could not find it as known bug in recent buglist, hence I supposed to
> write a new bug report, but I still don't have an account.
If think it's an SDL cross-compiling problem (libtool?). When
configuring SDL with --prefix="/usr" I think you will have a correct
libdir in libSDL.la, but in that case SDL would try to install itself in
/usr/ of your host.

So I will propose my workaround unless someone has a better idea...

Regards,
Julien
