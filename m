From: Thomas Lundquist <lists@zelow.no>
Date: Thu, 20 Sep 2007 23:37:24 +0200
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <46F2E33A.1070307@free.fr>
References: <7fc538d30709170509s4898cc55keb14ebb718d30090@mail.gmail.com>
	<46EED912.2070902@free.fr> <20070917201401.GA28671@codepoet.org>
	<46EEEEE2.7060705@free.fr> <20070919064200.GA29317@zelow.no>
	<20070919192740.GC817@aon.at> <20070919205603.GA16408@zelow.no>
	<20070919215043.GX20058@aon.at> <46F2E33A.1070307@free.fr>
Message-ID: <20070920213724.GA18637@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2007 at 11:16:42PM +0200, Julien Boibessot wrote:
> >  
> Well I 'm not sure it's a good idea to let the user mix "builtin" and 
> "packaged" software.
> If he choose to use ipkg, or another method, then all the Buildroot 
> utilities he wants to have in its rootfs should be packaged with the 
> selected method and then installed in the TARGET_DIR, just before 
> creating the (jffs2/ext2/...) rootfs image.

Why bother then? if all that will be done is putting it where everything
is today? Then it's no need to make packages at all. 

My whole point is that buildroot has a base and then added packages,
what to have where is up to the one building it and when / how to add up
to the builder and user. wget and install, nc and install, USB stick or
whatever.

> That's what they do in OpenWrt and I think it's a good idea:
> * build the selected utility/package

Done.

> * install it in a custom directory, instead of TARGET_DIR

Done. TARGET_PACKAGES_DIR

> * "ipkage" it from that directory

Done with tar.* and .udeb right now, ipkg is coming.

> * install the generated "xxx.ipkg" in TARGET_DIR

This is where I lost it. it's up to the end user to do this step. This
is why I do autonomous packages.

> That way your system is always aware of the installed packages even if 
> you flash a complete rootfs (I'm speaking of the ipkg case which is the 
> only one I have studied yet).

a very much bigger rootfs than needed.

> After flashing, you can even removed 
> packages directly from your target.

why not add them instead of removing? make a leanser rootfs and a user
able to choose what to use his valuable RAM/Flash on.

Feel free to to this and I'd be happy if there was a patch to choose
this method but no way am I going to make this the only one. The builder
should be able to choose what to put where.


Thomas.
