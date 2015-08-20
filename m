From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Aug 2015 10:02:57 +0200
Subject: [Buildroot] [PATCH 1/1] libpam-tacplus: new package
In-Reply-To: <CAMQcK5JaQx3fVKL0T5CSg+nWmzN+VSyAP4prY4ttaD2HAcDQYQ@mail.gmail.com>
References: <1440017226-14463-1-git-send-email-giovanni.zantedeschi@datacom.ind.br>
 <CAMQcK5JaQx3fVKL0T5CSg+nWmzN+VSyAP4prY4ttaD2HAcDQYQ@mail.gmail.com>
Message-ID: <20150820100257.390721eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, Giovanni,

On Wed, 19 Aug 2015 17:06:00 -0500, Ryan Barnett wrote:

> > diff --git a/package/libpam-tacplus/Config.in b/package/libpam-tacplus/Config.in
> > new file mode 100644
> > index 0000000..88d10ff
> > --- /dev/null
> > +++ b/package/libpam-tacplus/Config.in
> > @@ -0,0 +1,5 @@
> > + config BR2_PACKAGE_LIBPAM_TACPLUS
> > +        bool "libpam-tacplus"
> > +        help
> > +          Lib needed to use pam-tacplus
> 
> Would spell 'Library' out completely. It would also be good if you
> could link to the projects homepage as well.

Agreed, but I believe the description could also be improved by
copy/pasting more from the upstream website:

	  TACACS+ protocol client library and PAM module in C. This PAM
	  module support authentication, authorization (account
	  management) and accounting (session management)performed
	  using TACACS+ protocol designed by Cisco.

> > +LIBPAM_TACPLUS_INSTALL_STAGING = YES
> > +LIBPAM_TACPLUS_AUTORECONF = YES

Please add a comment above this line:

# Fetching from github, we need to generate the configure script

> > +LIBPAM_TACPLUS_CONF_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)"
> 
> I'm not sure if this is needed but I could definitely be wrong since I
> haven't had a chance to dig into the package. It seems like this is
> something that buildroot's autotools package infrastructure should
> take care of passing into in order to ensure that it using the correct
> compiler.

The package is using autoconf, but not automake: it uses a hand-written
Makefile. Due to this, passing some variable at build time might be
required. However, it would be useful to try something like:

LIBPAM_TACPLUS_CONF_ENV = $(TARGET_CONFIGURE_OPTS)

instead.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
