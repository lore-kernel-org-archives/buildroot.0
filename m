From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 3 Jul 2016 12:22:02 -0300 (BRT)
Subject: [Buildroot] [PATCH 14/24] perl-file-util: drop unused host
 variant
In-Reply-To: <1467207991-4905-15-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <1467207991-4905-15-git-send-email-julien.floret@6wind.com>
Message-ID: <645482902.7741906.1467559322826.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Julien Floret" <julien.floret@6wind.com>
> To: buildroot at buildroot.org
> Cc: "thomas petazzoni" <thomas.petazzoni@free-electrons.com>
> Sent: Wednesday, June 29, 2016 10:46:21 AM
> Subject: [Buildroot] [PATCH 14/24] perl-file-util: drop unused host variant

> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> ---
> package/perl-file-util/perl-file-util.mk | 2 --
> 1 file changed, 2 deletions(-)
> 
> diff --git a/package/perl-file-util/perl-file-util.mk
> b/package/perl-file-util/perl-file-util.mk
> index 7026515e6649..fe83585f3614 100644
> --- a/package/perl-file-util/perl-file-util.mk
> +++ b/package/perl-file-util/perl-file-util.mk
> @@ -10,7 +10,5 @@ PERL_FILE_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOMMY
> PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
> PERL_FILE_UTIL_LICENSE = Artistic or GPLv1+
> PERL_FILE_UTIL_LICENSE_FILES = COPYING LICENSE
> -HOST_PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
> 
> $(eval $(perl-package))
> -$(eval $(host-perl-package))
> --
> 2.1.0

Not again, please!

commit 5b7cb94c967549cd59cc692ec2fc843f66974478
Author: Carlos Santos <casantos@datacom.ind.br>
Date:   Tue Nov 17 10:24:06 2015 -0200

    perl-file-util: restore host variant and fix dependencies
    
    The host variant was added by us (DATACOM) because it is useful to
    build some third-party packages that we use in our firmware. We humbly
    request you to keep it alive.
    
    Declare that it requires host-perl-module-build.
    
    Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

commit 4b33c324809c4928e0da827a3ec88703a73c654a
Author: Yann E. MORIN <yann.morin.1998@free.fr>
Date:   Fri Nov 13 22:48:49 2015 +0100

    package/perl-file-util: remove host variant
    
    It does not build, and no one depends on it.
    
    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
    Cc: Francois Perrad <fperrad@gmail.com>
    Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Carlos Santos (Casantos)
DATACOM, P&D
