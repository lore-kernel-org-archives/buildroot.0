From: Nimai Mahajan <nimaim@gmail.com>
Date: Fri, 22 May 2015 18:41:42 -0400
Subject: [Buildroot] Possible libarchive.mk issue
Message-ID: <CALoSW64Xv5-_T3eqHG_kPzv1JsGQNcyPmLG_yBX56vMt9+1bsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just wanted to get this resolved before the official 2015.05 release.
Is there any reason libarchive has LIBARCHIVE_CONF_OPTS =
--without-lzma hard coded/defined without if/else's? We use libarchive
with xz on our project and don't know how to pre patch these
package/*.mk files before a build so was wondering if this change
could be made now. My assumption is that this was an oversight and
guessing it should be like this ... will push a patch if so.

ifeq ($(BR2_PACKAGE_XZ),y)
LIBARCHIVE_DEPENDENCIES += xz
else
LIBARCHIVE_CONF_OPTS += --without-lzma
endif

Thanks.
