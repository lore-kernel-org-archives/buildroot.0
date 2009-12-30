From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 30 Dec 2009 17:41:13 +0100
Subject: [Buildroot] [PATCH] jpeg: convert to autotools infrastructure
In-Reply-To: <4d28d4b50912300507j42de4b9bn7068347f3827c19e@mail.gmail.com>
	(Lionel Landwerlin's message of "Wed, 30 Dec 2009 14:07:02 +0100")
References: <4d28d4b50912290214u6b15af37nbefdf6b672b87c3d@mail.gmail.com>
	<87aax1v6zy.fsf@macbook.be.48ers.dk>
	<1262123141.5867.51.camel@coalu.atr>
	<87637ovd01.fsf@macbook.be.48ers.dk>
	<4d28d4b50912300507j42de4b9bn7068347f3827c19e@mail.gmail.com>
Message-ID: <87ws04tnx2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

Hi,

 Lionel>     The standard staging install handling does this as well, so
 Lionel>     there's no need for this.

 Lionel> Are you sure it does sed on libjpeg.la ?
 Lionel> I tried without specifying JPEG_INSTALL_STAGING_CMDS and didn't see a
 Lionel> libjpeg.la containing the staging directory.
 Lionel> ?

Yes - From Makefile.autotools.in:

define $(2)_INSTALL_STAGING_CMDS
        $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C
 $$($$(PKG)_SRCDIR)
        for i in $$$$(find $(STAGING_DIR)/usr/lib/ -name "*.la"); do \
                cp $$$$i $$$$i~; \
                $$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
        done
endef

grep staging /tmp/br/staging/usr/lib/libjpeg.la
libdir='/tmp/br/staging/usr/lib'

-- 
Bye, Peter Korsgaard
