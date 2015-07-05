From: Mike <mikez@OpenPlayer.org>
Date: Sun, 5 Jul 2015 11:56:17 -0500
Subject: [Buildroot] host-luarocks include path does not match
 installation of host-luajit
In-Reply-To: <20150705150335.GQ3647@free.fr>
References: <20150704140142.3aa5c982@core2quad.morethan.org>
 <20150704214734.GC3634@free.fr>
 <20150704213628.21ff7e6e@core2quad.morethan.org>
 <20150705000050.7c2be969@core2quad.morethan.org>
 <20150705111007.63ff239b@free-electrons.com>
 <20150705083253.1bfaefa5@core2quad.morethan.org>
 <20150705142725.GN3647@free.fr>
 <20150705095425.174bde89@core2quad.morethan.org>
 <20150705150335.GQ3647@free.fr>
Message-ID: <20150705115617.76d410a2@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 5 Jul 2015 17:03:35 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > >>> host-luarocks 2.2.2 Extracting  
> > gzip -d -c /var1/arm/buildroot.git/dl/luarocks-2.2.2.tar.gz | tar
> > --strip-components=1
> > -C /var1/arm/new-i386/build/host-luarocks-2.2.2  -xf -  
> > >>> host-luarocks 2.2.2 Patching
> > >>> host-luarocks 2.2.2 Configuring  

That is the luarocks package that is reporting that it can not
find 'lua.h'.

Only LuaJIT is in an external source directory, and it installed
just fine, with your proposed patch.

There is just a mis-match between where host-luajit was installed
and where host-luarocks is expecting them.

- - - - -

Translation: One problem fixed, now exposes another one.

Hah! 
And someone commented on how the title of this thread does
not strictly apply.
So I changed the title, but kept the same threading.

Mike
