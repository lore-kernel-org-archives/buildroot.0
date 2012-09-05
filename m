From: norbert at nanobug.de <norbert@nanobug.de>
Date: Wed, 5 Sep 2012 02:19:29 +0200 (CEST)
Subject: [Buildroot] Package for libwt (Web Toolkit http://webtoolkit.eu)
Message-ID: <935246701.408118.1346804369727.JavaMail.open-xchange@email.1und1.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Experts,
I am trying to build Wt in my buildroot environment and it does not compile.

 I am a real noob  with Cmake or buildroot. Obviously I have misconfigured
 something. Cmake gets called but refuses to continue telling me something about
 missing path. Somehow the generated Cmake command is wrong, I think. I do not
see
 how to fix it. Maybe someone has already made a package for WT and could share
it here ?



 This is what I used:

 ------------- file libwt.mk in package/libwt -----------------

 #############################################################
 #
 # libwt
 #
 #############################################################

 LIBWT_VERSION =3.2.1
 LIBWT_SOURCE =wt-$(LIBWT_VERSION).tar.gz
 LIBWT_SITE =http://prdownloads.sourceforge.net/witty
<http://prdownloads.sourceforge.net/witty>
 LIBWT_INSTALL_STAGING = YES
 LIBWT_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols

 ifeq ($(BR2_PACKAGE_BOOST),y)
 LIBWT_DEPENDENCIES += boost
 LIBWT_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
 # configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
 # native stuff during the rest of configure when target == host.
 # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
 # are found first.
 # LIBWT_CONF_ENV += "LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib"
 endif

 --------------- end of libwt.mk -----------------------------------



 --------------- file Config.in  in package/libwt ------------------

 config BR2_PACKAGE_LIBWT
 bool "libwt"
 help
 wt web toolkit is a library for writing cgi code

 http://webtoolkit.eu/ <http://webtoolkit.eu/>

 --------------- end of Config.in -----------------------------------

Best regards,
   Norbert.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120905/657b8b6e/attachment.html>
