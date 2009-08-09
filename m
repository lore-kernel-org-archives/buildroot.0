From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2009 00:17:03 +0200
Subject: [Buildroot] [PATCH] Re: buildroot-libtool.patch failed with
 dbus 1.3.0
In-Reply-To: <4A7DFDF4.3020103@eclis.ch>
References: <4A7C85F0.7070604@eclis.ch> <20090807221717.53039a10@surf>
	<4A7C9F65.4060104@eclis.ch> <20090808004346.443b9e49@surf>
	<4A7CB3CC.8040401@eclis.ch> <20090808200911.4e986c77@surf>
	<4A7DFDF4.3020103@eclis.ch>
Message-ID: <20090810001703.396c8e38@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 09 Aug 2009 00:36:36 +0200,
Jean-Christian de Rivaz <jc@eclis.ch> a ?crit :

> > However, while dbus compilation works successfully now, dbus-glib
> > still fails to build here:
> > 
> >  /usr/lib/libgobject-2.0.so: could not read symbols: File in wrong
> >  format collect2: ld returned 1 exit status
> > 
> > So it's a libtool patch issue, again :-)
> 
> That's strange since I use dbus-glib on a ARM target for about 20
> applications with the dbus-1.3.0 without that problem. I usually get
> the wrong format message when I have not do a make clean before
> switching to an other architecture. Can you post more lines before
> the error so I can compare with my own build ?

The difference between my setup and your setup is probably that I do
actually have /usr/lib/libgobject-2.0.so in my filesystem, since the
libglib2.0-dev package is installed on my distribution. In your case,
this package is probably not installed, and therefore, libtool doesn't
think that the correct libgobject library is in /usr/lib.

I've actually tried this hypothesis on another package (webkit that was
failing in a similar way on libenchant), and remove the development
files in /usr/lib, and the link succeeded.

It seems to be hard to convince libtool that /usr/lib does *not*
contain anything interesting.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
