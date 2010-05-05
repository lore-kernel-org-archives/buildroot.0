From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 May 2010 12:17:55 +0200
Subject: [Buildroot] [PATCH] Remove gtk-doc documentations from target
In-Reply-To: <20100505100936.6123.58539.stgit@pauliusz> (Paulius Zaleckas's
	message of "Wed, 05 May 2010 13:09:36 +0300")
References: <20100505100936.6123.58539.stgit@pauliusz>
Message-ID: <87ocgubqjw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 Paulius> On my target rootfs it is installed documentation for:
 Paulius> atk, cairo, gdk, gdk-pixbuf, gio, glib, gobject, gtk, pango

 Paulius> It ocupies 34M of space. Configure option --disable-gtk-doc doesn't
 Paulius> prevent installation of it. So we should remove them manually if
 Paulius> documentation is disabled.

I was thinking the exact same thing yesterday - Committed, thanks.

I'll get rid of the manual cleanups we do in some places as well:

git grep usr/share/gtk-doc
hal/hal.mk:     rm -rf $(TARGET_DIR)/usr/share/gtk-doc
libglade/libglade.mk:   rm -rf $(TARGET_DIR)/usr/share/gtk-doc \
libxml2/libxml2.mk:            $(TARGET_DIR)/usr/share/gtk-doc

-- 
Bye, Peter Korsgaard
