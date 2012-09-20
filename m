From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Sep 2012 21:59:53 +0200
Subject: [Buildroot] [PATCH 05/13] perl: add GDBM_File
In-Reply-To: <1347107325-4163-5-git-send-email-francois.perrad@gadz.org>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <1347107325-4163-5-git-send-email-francois.perrad@gadz.org>
Message-ID: <20120920215953.4d4650fb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat,  8 Sep 2012 14:28:37 +0200, Francois Perrad wrote:

> +ifdef BR2_PACKAGE_PERL_GDBM_FILE

ifeq ($(BR2_PACKAGE_PERL_GDBM_FILE),y)

> +    PERL_DEPENDENCIES += gdbm
> +endif
>  HOST_PERL_DEPENDENCIES =

There is no configuration option or argument to pass to Perl to tell it
to use Gdbm (or Berkeley DB)? I am a bit worried that if GDBM is
available on the build machine (for the build machine architecture),
the Perl build system might get confused and think that GDBM or
Berkeley DB are available, while they are not available for the target.
I.e, for autotools packages, we typically have:

ifeq ($(BR2_PACKAGE_FOO_FEATURE_A),y)
FOO_DEPENDENCIES += liba
FOO_CONF_OPT += --enable-feature-a
else
FOO_CONT_OPT += --disable-feature-a
endif

Isn't a similar construct necessary here?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
