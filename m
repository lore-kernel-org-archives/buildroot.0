From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 09:06:10 +0200
Subject: [Buildroot] [PATCH] nodejs: new package
In-Reply-To: <502703DF.5000602@gmail.com>
References: <1344665495-27246-1-git-send-email-net147@gmail.com>
 <20120811222306.4e21b827@skate> <502703DF.5000602@gmail.com>
Message-ID: <20120812090610.6cf8fd4d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jonathan,

Please keep the list Cc'ed for our exchanges, thanks!

Le Sun, 12 Aug 2012 11:16:15 +1000,
Jonathan Liu <net147@gmail.com> a ?crit :

> >> +config BR2_PACKAGE_NODEJS
> >> +	bool "nodejs"
> >> +	select BR2_PACKAGE_OPENSSL
> > I know nothing about nodejs. Is OpenSSL support absolutely mandatory?
> If I remember correctly, Node.js already bundles a copy of OpenSSL so 
> this dependency can be removed.
> I can add an option to enable/disable built-in SSL support in the 
> Node.js build.

It would be better if Node.js could use the OpenSSL version that is in
Buildroot rather than its own internal one. It avoids having two copies
of OpenSSL on the target system.

And yes, if the SSL support can be enabled/disabled easily, it would be
great: OpenSSL is a fairly heavy dependency.

> >> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> >> new file mode 100644
> >> index 0000000..8a0fa91
> >> --- /dev/null
> >> +++ b/package/nodejs/nodejs.mk
> >> @@ -0,0 +1,54 @@
> >> +#############################################################
> >> +#
> >> +# nodejs
> >> +#
> >> +#############################################################
> >> +NODEJS_VERSION = 0.8.6
> >> +NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
> >> +NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
> >> +NODEJS_INSTALL_STAGING = YES
> > Does NodeJS contains libraries required by other packages?
> The headers and node-waf binary are needed to build 3rd party native 
> modules. I figured it may be useful if someone wants to create buildroot 
> packages for node.js modules in the future.

Can you add a comment with a similar explanation just before this line.
For libraries, the reason to have _INSTALL_STAGING is fairly obvious,
for things like nodejs, it's a little bit less obvious for the ones who
are not familiar with what nodejs is.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
