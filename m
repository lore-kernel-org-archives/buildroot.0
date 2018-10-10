From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 09:09:32 +0200
Subject: [Buildroot] [PATCH 00/13] scancpan
In-Reply-To: <20181010064621.19253-1-francois.perrad@gadz.org>
References: <20181010064621.19253-1-francois.perrad@gadz.org>
Message-ID: <20181010090932.78ff793a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Wed, 10 Oct 2018 08:46:08 +0200, Francois Perrad wrote:

> Without runtime dependencies, the build time is speed up (in parallel mode).
> And now, I can upgrade easily all perl modules.

Thanks a lot for this patch series!

> Francois Perrad (13):
>   scancpan: wrap abstract if too long
>   scancpan: trim the abstract
>   scancpan: sort license files
>   scancpan: sort license in hash file
>   scancpan: split multiple dependencies on multiple lines
>   scancpan: remove run-time dependencies
>   perl-*: regeneration of hash files
>   perl-*: regeneration of Config.in files
>   perl-*: regeneration of *.mk files

I have applied all patches up to this point.

One thing that would be nice is to adjust the Config.in generation
logic to add a "# runtime" comment after the runtime dependencies. In
practice it will be all target dependencies, but it is a convention we
have in other packages, so it would be good to comply with it as well,
and it's easy to do thanks to those packages being auto-generated.

>   scancpan: add PERL_FOO_DISTNAME in perl-foo.mk
>   perl-*: regeneration with _DISTNAME
>   pkg-perl: add a target which upgrades all packages from metacpan
>   [RFC] pkg-perl: add per package upgrade target

For this one, I'll leave a bit more time, so that other Buildroot
developers can say what they think about it. In general, I like the
idea. I'm not sure how applicable a per-package <pkg>-upgrade target is
going to be to non-Perl packages, but let's see what other people think.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
