From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Dec 2009 08:44:52 +0100
Subject: [Buildroot] [Bug 821] New: cp: illegal operation
In-Reply-To: <bug-821-163@https.bugs.busybox.net/> (bugzilla@busybox.net's
	message of "Mon, 21 Dec 2009 23:13:10 +0000 (UTC)")
References: <bug-821-163@https.bugs.busybox.net/>
Message-ID: <87bphrxxjf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "bugzilla" == bugzilla  <bugzilla@busybox.net> writes:

Hi,

 bugzilla> When building the toolchain on my Mac, it always halts
 bugzilla> because of an illegal parameter for cp. the parameter "-d" is
 bugzilla> not supported on Mac OS X. The following patch should work on
 bugzilla> all systems:

 bugzilla> --- Makefile    2008-02-25 09:15:31.000000000 +0100
 bugzilla> +++ Makefile    2009-12-22 00:04:29.000000000 +0100
 bugzilla> @@ -283,11 +257,11 @@
 bugzilla>  $(BR2_DEPENDS_DIR): .config
 bugzilla>         rm -rf $@
 bugzilla>         mkdir -p $(@D)
 bugzilla> +       cp -af $(CONFIG)/buildroot-config $@
 bugzilla> -       cp -dpRf $(CONFIG)/buildroot-config $@

That's not the only place cp -d is used:

git grep -l 'cp -d'
Makefile
docs/buildroot.html
package/argus/argus.mk
package/berkeleydb/berkeleydb.mk
package/bsdiff/bsdiff.mk
package/directfb-examples/directfb-examples.mk
package/dmalloc/dmalloc.mk
package/dummy/dummy.mk
package/fuse/libfuse.mk
package/gettext/gettext.mk
package/gmp/gmp.mk
package/imagemagick/imagemagick.mk
package/input-tools/input-tools.mk
package/java/concierge/concierge.mk
package/jpeg/jpeg.mk
package/l2tp/l2tp.mk
package/libaio/libaio.mk
package/libcgi/libcgi.mk
package/libcgicc/libcgicc.mk
package/libdrm/libdrm.mk
package/libeXosip2/libeXosip2.mk
package/libfloat/libfloat.mk
package/libgcrypt/libgcrypt.mk

With the above fixed, can you really build on macosx?

-- 
Bye, Peter Korsgaard
