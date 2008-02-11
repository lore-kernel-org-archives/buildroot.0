From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 11 Feb 2008 19:01:57 +0100
Subject: [Buildroot] alsa for arm compile options & svn 20557
In-Reply-To: <c166aa9f0802110927n1fcade83w87c3bae4017b509a@mail.gmail.com>
References: <c166aa9f0802110927n1fcade83w87c3bae4017b509a@mail.gmail.com>
Message-ID: <20080211180157.GA31048@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 11, 2008 at 11:27:11AM -0600, Andrew Dyer wrote:
>I believe a change introduced in SVN 20557 is incorrect for some arm
>kernel builds with alsa.  Here is the 20557 change:
>
>--- trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007/10/01 16:15:31	20163
>+++ trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007/11/28 07:09:57	20557
>@@ -24,7 +24,7 @@
> 	(cd $(ALSA_LIB_DIR); rm -rf config.cache; \
> 		$(TARGET_CONFIGURE_ARGS) \
> 		$(TARGET_CONFIGURE_OPTS) \
>-		CFLAGS="$(TARGET_CFLAGS)" \
>+		CFLAGS="$(TARGET_CFLAGS) -mabi=aapcs-linux" \
> 		LDFLAGS="$(TARGET_LDFLAGS)" \
> 		./configure \
> 		--target=$(GNU_TARGET_NAME) \

Yes, that is pretty broken, too. I think that this works like it should
in my tree.
