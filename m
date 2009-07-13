From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Mon, 13 Jul 2009 21:26:02 +0200
Subject: [Buildroot] External toolchain improvements
In-Reply-To: <20090702145011.6b9f3fe9@surf>
References: <mailman.0.1246405094.1110.buildroot@busybox.net>
	<1246406073.21132.13.camel@coalu.atr> <20090701160513.2ce29151@surf>
	<1246484614.21132.36.camel@coalu.atr>  <20090702145011.6b9f3fe9@surf>
Message-ID: <1247513162.8439.10.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeudi 02 juillet 2009 ? 14:50 +0200, Thomas Petazzoni a ?crit :
> Hi,
> 
> Le Wed, 01 Jul 2009 23:43:34 +0200,
> Lionel Landwerlin <lionel.landwerlin@openwide.fr> a ?crit :

> > >  * Buildroot version
> > 
> > Your external-toolchain branch
> 
> Which doesn't exist anymore since it has been merged in the official
> Buildroot :-)

Just a word about the choice to put the EXTERNAL_LIBS variable in
toolchain/external-toolchain/ext-tool.mk. I don't think it's a good
choice. For example, my current toolchain includes a glibc version 2.6.
This make the ld-linux loader name /lib/ld-linux.so.2 instead
of /lib/ld-linux.so.3.

Modifying an enormous variable inside kconfig is painful, but I think
it's better to let this variable configurable rather than encourage the
buildroot user to modify an unfriendly makefile
(toolchain/external-toolchain/ext-tool.mk).

> But ok, fine, I know what you're using.
> 

> Thanks!
> 
> Thomas
> -- 

Thanks again for your support.

Regards,

-- 
Lionel Landwerlin <lionel.landwerlin@openwide.fr>
