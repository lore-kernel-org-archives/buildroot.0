From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 15 Nov 2009 16:39:44 +0100
Subject: [Buildroot] [PATCH 4/8] flex: add flex-host package (required
 by webkit)
In-Reply-To: <20091115152653.29810036@surf>
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
	<1258279977-1482-5-git-send-email-llandwerlin@gmail.com>
	<20091115152653.29810036@surf>
Message-ID: <1258299584.24296.91.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dimanche 15 novembre 2009 ? 15:26 +0100, Thomas Petazzoni a ?crit :
> Le Sun, 15 Nov 2009 11:12:53 +0100,
> llandwerlin at gmail.com a ?crit :
> 
> >  $(eval $(call AUTOTARGETS,package,flex))
> > +$(eval $(call AUTOTARGETS,package,flex,host))
> 
> BTW, why do we need to build flex for the host ? flex is part of the
> few tools that we consider to be a dependency of Buildroot.

It's required to build webkit. I didn't notice the problem until I built
it on a host system where it wasn't installed.

> 
> In toolchain/dependencies/dependencies.sh, we check that a host flex is
> available. This tool (along with bison) is anyway mandatory to build
> the toolchain.

Oh, I didn't know that, but I didn't receive any error when building
webkit with uclibc (no external toolchain).


> 
> So :
> 
>  * Either we consider flex to be part of Buildroot dependencies and
>    Webkit should not depend on host-flex ;
> 
>  * Or we don't consider flex to be part of the Buildroot dependencies
>    and we should fix all packages and toolchain that use flex without
>    depending on it.
> 

I guess it's up to Peter to decide.

According to me, flex isn't a big piece of software. So rebuilding it
shouldn't be a problem (in term of time of compilation).
For example host-libglib is quite more annoying to build (is it only
required for glib-genmarshal ?).

-- 
Lionel Landwerlin
