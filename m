From: Martin Hicks <mort@bork.org>
Date: Thu, 17 Mar 2011 15:11:21 -0400
Subject: [Buildroot] [RFC] [PATCH] Add targetclean Makefile target
Message-ID: <20110317191121.GA25781@chinook.eng-services.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I have scripts that hack around with the root filesystem prior to
image creation, so I wanted a way to remove $(TARGET_DIR) and
reinstall it without doing a wholesale 'make clean; make'.  This is
what I came up with.  It only works with external toolchain.

Comments?  This seems fragile, but it also doesn't require that
every package have an uninstall target, and additionally handles the
case where pre-image-generation scripts mangle contents of $TARGET_DIR

mh
