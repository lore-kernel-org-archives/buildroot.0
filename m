From: Sven Neumann <s.neumann@raumfeld.com>
Date: Sun, 25 Sep 2011 22:31:36 +0200
Subject: [Buildroot] [PATCH] taglib: bump to 1.7
In-Reply-To: <87d3eozcib.fsf@macbook.be.48ers.dk>
References: <1316767809-5856-1-git-send-email-s.neumann@raumfeld.com>
 <87d3eozcib.fsf@macbook.be.48ers.dk>
Message-ID: <1316982696.9373.3.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, 2011-09-25 at 20:46 +0200, Peter Korsgaard wrote:

>  Sven> +TAGLIB_DEPENDENCIES = host-pkg-config libglib2
> 
> This is wrong. I don't see any references to either pkg-config or
> libglib2 in the sources. If libglib2 was needed, then you should have
> selected it in Config.in as well.

Oops, sorry about that. We have a patch against taglib in our tree that
adds a dependency on glib2 and I forgot to remove this.
 
>  Sven> -define TAGLIB_REMOVE_DEVFILE
>  Sven> -	rm -f $(TARGET_DIR)/usr/bin/taglib-config
>  Sven> +define TAGLIB_INSTALL_TARGET_CMDS
>  Sven> +	cp -a $(STAGING_DIR)/usr/lib/libtag.so* $(TARGET_DIR)/usr/lib
>  Sven>  endef
> 
> This is wrong. The existing install support was fine. With this you
> broke BR2_HAVE_DEVFILES / BR2_HAVE_DOCUMENTATION / BR2_PREFER_STATIC_LIB
> configurations.

If I remember correctly I tried the existing install support first and
we ended up with all the development files (taglib header files and
such) on the target. But I'll check this again.


Thanks for the fixes and the commit,
Sven
