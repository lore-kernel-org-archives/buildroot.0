From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 23 Sep 2007 00:28:27 +0200
Subject: [Buildroot] buildroot with ipkg
Message-ID: <20070922222827.GD711@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2007 at 11:50:43PM +0200, Bernhard Fischer wrote:
> 
> Don't forget about package/Makefile.autowhatever.in.

Done. also "modularized" the x11r7 tree. Pretty simple but it fails
somewhere not realetd to my changes, so untested.

> Yes. Not sure if that'd work, but perhaps something like
> $(PROJECT_BUILD_DIR)/%/$(FOO_BINARY): $(TARGET_DIR)/$(FOO_BINARY) \
> 	$(TARGET_PACKAGES_DIR)/$(FOO_BINARY): $(FOO_DIR)/.unpacked
> 	$(MAKE) -C $(FOO_DIR) et cetera
> 
> may do the trick. We'd have to see if something like that makes sense.

I have to admit that it did not for me. Probably just too much magic in
it. It does look like you are both adding it to the target and the
packages directory? I can't really see a test there.

> $ svngrep -r ^TARGET_DIR:= /mnt/cvs/busybox/upstream/buildroot/ 2> /dev/null
> /mnt/cvs/busybox/upstream/buildroot/project/Makefile.in:TARGET_DIR:=$(PROJECT_BUILD_DIR)/root

Ok, red face then (forgot :=, looked for TARGET= )

New patch attached, this time against the latest trunk. It does build
dropbear properly but the ipkg suport is not done, just .udeb / .deb and
tarballs.

I'd also would like to do dependencies and package descriptions based on
the packages Config.in but then the script has to know where every
targets Config.in resides which isn't obvious unfortunately.

Patch was too big for the list so you can find it here:

http://www.zelow.no/floppyfw/download/Development/Patches/buildroot/packages.diff



Thomas.
