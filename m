From: markus.heidelberg at web.de <markus.heidelberg@web.de>
Date: Fri, 15 Aug 2008 08:09:33 +0200
Subject: [Buildroot] GDB attempting to apply patches severla times
Message-ID: <619657791@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
> > index 6220cd9..d156758 100644
> > --- a/toolchain/gdb/gdb.mk
> > +++ b/toolchain/gdb/gdb.mk
> > @@ -57,11 +57,8 @@ ifeq ($(GDB_VERSION),snapshot)
> >                tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1)
> >        ln -sf $(TOOL_BUILD_DIR)/$(shell tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1) $(GDB_DIR)
> >  endif
> > -       toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
> > -       $(CONFIG_UPDATE) $(GDB_DIR)
> > -       touch $@

Oh, we don't want to delete the last command "touch $@". That's the reason why br wants to rebuild gdb every time now, br thinks it has never been unpacked. But I think that should have occured with your patch the same way already, I have just taken this part from your patch. However...

Markus
_______________________________________________________________________
EINE F?R ALLE: die kostenlose WEB.DE-Plattform f?r Freunde und Deine
Homepage mit eigenem Namen. Jetzt starten! http://unddu.de/?kid=kid at mf2
