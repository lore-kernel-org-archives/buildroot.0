From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:22:12 +0100
Subject: [Buildroot] Wrong rpath after linking with libmysqlclient
In-Reply-To: <20151213201358.GC27971@free.fr>
References: <566DCFFE.5070504@mind.be>
	<20151213201358.GC27971@free.fr>
Message-ID: <20151213222212.5cafd797@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Dec 2015 21:13:58 +0100, Yann E. MORIN wrote:

> >  My first idea was to install libmysqlclient.so in /usr/lib instead, but that's
> > probably a great idea.
> 
> that's what Thomas and I were discussing the other day: why are those
> libraries not in /usr/lib to start with? We believe this should be the
> case.

Agreed, all libraries should be in /lib or /usr/lib, so that we can get
rid of /etc/ld.so.conf and /etc/ld.so.cache handling, which doesn't
work since there is no cross-ldconfig. Yes, it could work without
ld.so.conf configuration using rpath, but I don't think it's a good
idea.

It would really be preferable if libmysqlclient.so was in /usr/lib like
any other libraries.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
