From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2015 09:42:27 +0200
Subject: [Buildroot] [PATCH 1/2] librtas: new package
In-Reply-To: <20150508045205.GG2183@tarshish> (Baruch Siach's message of "Fri, 
 8 May 2015 07:52:05 +0300")
References: <cover.1431059241.git.sam.bobroff@au1.ibm.com>
 <780e48cca88c90480b3b038c5965e52db284d403.1431059241.git.sam.bobroff@au1.ibm.com>
 <20150508045205.GG2183@tarshish>
Message-ID: <874mnnldlo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> diff --git a/package/librtas/missing-librtas.so.1.patch b/package/librtas/missing-librtas.so.1.patch
 >> new file mode 100644
 >> index 0000000..de21d66
 >> --- /dev/null
 >> +++ b/package/librtas/missing-librtas.so.1.patch
 >> @@ -0,0 +1,11 @@

 > Please add your Sign-off here.

And a description. Why is it needed, has the patch been sent upstream?
What is the status?

 >> +diff -purN librtas-1.3.12.orig/librtas_src/Makefile librtas-1.3.12/librtas_src/Makefile
 >> +--- librtas-1.3.12.orig/librtas_src/Makefile	2015-04-09 10:45:19.772381633 +1000
 >> ++++ librtas-1.3.12/librtas_src/Makefile	2015-04-09 10:45:57.968604762 +1000
 >> +@@ -33,6 +33,7 @@ install:
 >> + 	@$(call install_lib,$(LIBRTAS),$(DESTDIR))
 >> + 	@$(call install_inc,$(HEADERS),$(DESTDIR))
 >> + 	@ln -sf $(LIBRTAS) $(DESTDIR)/$(LIB_DIR)$(call is_lib64,$(LIBRTAS))/$(LIBRTAS_SONAME)
 >> ++	@ln -sf $(LIBRTAS) $(DESTDIR)/$(LIB_DIR)$(call is_lib64,$(LIBRTAS))/$(LIBRTAS_SONAME).1
 >> + 
 >> + uninstall:
 >> + 	@$(call uninstall_lib,$(LIBRTAS),$(DESTDIR))


-- 
Bye, Peter Korsgaard
