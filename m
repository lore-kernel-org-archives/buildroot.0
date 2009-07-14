From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Tue, 14 Jul 2009 21:51:56 +0200
Subject: [Buildroot] External toolchain improvements
In-Reply-To: <20090714164109.26df9c81@surf>
References: <mailman.0.1246405094.1110.buildroot@busybox.net>
	<1246406073.21132.13.camel@coalu.atr> <20090701160513.2ce29151@surf>
	<1246484614.21132.36.camel@coalu.atr> <20090702145011.6b9f3fe9@surf>
	<1247513162.8439.10.camel@coalu.atr>  <20090714164109.26df9c81@surf>
Message-ID: <1247601116.8439.12.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mardi 14 juillet 2009 ? 16:41 +0200, Thomas Petazzoni a ?crit :
> Hello Lionel,
> 
> Le Mon, 13 Jul 2009 21:26:02 +0200,
> Lionel Landwerlin <lionel.landwerlin@openwide.fr> a ?crit :
> 
> > Just a word about the choice to put the EXTERNAL_LIBS variable in
> > toolchain/external-toolchain/ext-tool.mk. I don't think it's a good
> > choice. For example, my current toolchain includes a glibc version
> > 2.6. This make the ld-linux loader name /lib/ld-linux.so.2 instead
> > of /lib/ld-linux.so.3.
> > 
> > Modifying an enormous variable inside kconfig is painful, but I think
> > it's better to let this variable configurable rather than encourage
> > the buildroot user to modify an unfriendly makefile
> > (toolchain/external-toolchain/ext-tool.mk).
> 
> This is also something I've discovered recently. I'd like to spend some
> time to see if it's still possible to auto-detect the version of the
> libraries to copy. If it doesn't work, then I fallback to the previous
> solution, which I don't find really nice.
> 
> Sincerly,

I just successed in building webkit on top of directfb with an external
toolchain. We should also think to copy the libstdc++ files when
selected from the config file.

Regards,

-- 
Lionel Landwerlin <lionel.landwerlin@openwide.fr>
