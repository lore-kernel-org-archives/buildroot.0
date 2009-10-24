From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Oct 2009 20:37:57 +0200
Subject: [Buildroot] [PATCH] Fix TARGET_PATH variable with external
	toolchain
In-Reply-To: <1256342684.28475.5.camel@coalu.atr> (Lionel Landwerlin's message
	of "Sat\, 24 Oct 2009 02\:04\:44 +0200")
References: <1256342684.28475.5.camel@coalu.atr>
Message-ID: <87ljj0zlh6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

 Lionel> Some time ago, an external toolchain improvement patch added
 Lionel> $(HOST_DIR)/bin and $(HOST_DIR)/usr/bin to the TARGET_PATH variable.
 Lionel> This patch also removed $(STAGING_DIR)/bin and $(STAGING_DIR)/usr/bin
 Lionel> to TARGET_PATH which breaks the build of the WebKit package for
 Lionel> example.

 Lionel> WebKit depends on the icu package, and when configuring the package,
 Lionel> there is a need to run icu-config which is installed inside the
 Lionel> staging directory.

I don't like this, as it mixes binaries/scripts for the host and the
target - I think it's better for the icu package to install the host
tool into host/usr/bin as well instead.

-- 
Bye, Peter Korsgaard
