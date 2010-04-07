From: Piyush Verma <verma.piyush@wimi.com.tw>
Date: Wed, 7 Apr 2010 17:54:40 +0800
Subject: [Buildroot] HOST_LIBXSLT bug fix
Message-ID: <n2o85e413fb1004070254ke1f3ad4bs91b174ac329d8721@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All

I was trying to build X Server.

While some way automatically include HOST_LIBXSLT and build fail while
building HOST_LIBXSLT as it was misssing "libgcrypt"

By searching on mail archive I found patch which fix libxslt.mk like below.

**************************************************************
ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
LIBXSLT_DEPENDENCIES_EXTRA=libgcrypt
else
LIBXSLT_XTRA_CONF_OPT = --without-crypto
endif
*************************************************************

But LIBXSLT_XTRA_CONF_OPT was not included in HOST_LIBXSLT_CONF_OPT.

I just add that as below and it compile successfully.

**********************************************************************
HOST_LIBXSLT_CONF_OPT = --enable-shared \
--without-debugging \
--without-python \
$(LIBXSLT_XTRA_CONF_OPT) \
--without-threads
***********************************************************************


If possible please update this in source  tree.



-- 
Thanks & Regards

Piyush Verma
DIGILIFE
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100407/ef4f6eec/attachment-0001.htm>
