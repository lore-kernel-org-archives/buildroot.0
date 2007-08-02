From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 2 Aug 2007 10:47:44 +0200
Subject: [Buildroot] [RFC] libdaemon patch
In-Reply-To: <1185995952.7651.94.camel@elrond.sweden.atmel.com>
References: <1185995952.7651.94.camel@elrond.sweden.atmel.com>
Message-ID: <20070802084743.GJ11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 01, 2007 at 09:19:12PM +0200, Ulf Samuelsson wrote:
>libdaemon does not build properly, complaining about missing libtool
>and giving some hints what to do:
>Anyone can comment on the patch below?

First, why do you constantly add whitespace-damaged patches to
buildroot? Please don't do this.

The host system doesn't have to have autotools installed.
Providing a bz2'ed patch that holds the result of an autoreconf is the
proper thing to do.

>It at least allows libdaemon to complete the compile...
>
>Index: package/libdaemon/libdaemon.mk
>===================================================================
>--- package/libdaemon/libdaemon.mk      (revision 19374)
>+++ package/libdaemon/libdaemon.mk      (arbetskopia)
>@@ -29,7 +29,12 @@
>        touch $(LIBDAEMON_DIR)/.unpacked
> 
> $(LIBDAEMON_DIR)/.configured: $(LIBDAEMON_DIR)/.unpacked
>-       (cd $(LIBDAEMON_DIR) && rm -rf config.cache && autoconf)
>+       (cd $(LIBDAEMON_DIR) ;  \
>+        rm -rf config.cache ;  \
>+        aclocal ;              \
>+        autoconf;              \
>+        automake;              \
>+        autoheader)
>        ( cd $(LIBDAEMON_DIR) && \
>                $(TARGET_CONFIGURE_OPTS) \
>                $(TARGET_CONFIGURE_ARGS) \
>
>
>Best Regards
>Ulf Samuelsson
>
>
>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
>
