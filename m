From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Oct 2009 22:22:22 +0200
Subject: [Buildroot] [PATCH] Fix TARGET_PATH variable with external
	toolchain
In-Reply-To: <1256413962.28475.115.camel@coalu.atr> (Lionel Landwerlin's
	message of "Sat\, 24 Oct 2009 21\:52\:42 +0200")
References: <1256342684.28475.5.camel@coalu.atr>
	<87ljj0zlh6.fsf@macbook.be.48ers.dk>
	<1256413962.28475.115.camel@coalu.atr>
Message-ID: <878wf0zgn5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

 Lionel> First let me argue that when buildroot is not using an external
 Lionel> toolchain, the $(STAGING_DIR)/bin and $(STAGING_DIR)/usr/bin
 Lionel> paths are a part of the TARGET_PATH variable.

Hmm, you're right - what a mess. There's no good reason why these should
be different in the regard.

 Lionel> The script returns paths relative to the host. This is going to
 Lionel> be a problem when linking the webkit binaries because the
 Lionel> linker will have to deal with host binaries... That's the same
 Lionel> kind of problem we are fixing with the libtool patch.

Yes, but copying the script from staging to host shouldn't change that.

 Lionel> I'm wondering whether adding the following to package/webkit/webkit.mk
 Lionel> should fix the problem :

 Lionel> WEBKIT_CONF_ENV = icu_config=$(STAGING_DIR)/usr/bin/icu-config

If the webkit configure script handles that (didn't check), then that
would certainly be the easiest/cleanest solution.

-- 
Bye, Peter Korsgaard
