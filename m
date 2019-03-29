From: yann.morin at orange.com <yann.morin@orange.com>
Date: Fri, 29 Mar 2019 10:53:25 +0100
Subject: [Buildroot] [PATCH-2019.02] package/glibc: bump version for
 additional post-2.28 security fixes
In-Reply-To: <20190329094714.10437-1-peter@korsgaard.com>
References: <20190329094714.10437-1-peter@korsgaard.com>
Message-ID: <12873_1553853207_5C9DEB17_12873_476_1_20190329095325.GD2625@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-03-29 10:47 +0100, Peter Korsgaard spake thusly:
[--SNIP--]
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../glibc.hash                                                          | 2 +-
>  package/glibc/glibc.mk                                                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename package/glibc/{glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1 => glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a}/glibc.hash (69%)
> 
> diff --git a/package/glibc/glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/glibc.hash b/package/glibc/glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a/glibc.hash
> similarity index 69%
> rename from package/glibc/glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/glibc.hash
> rename to package/glibc/glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a/glibc.hash
> index e83b1caf4c..442ef0d7aa 100644
> --- a/package/glibc/glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/glibc.hash
> +++ b/package/glibc/glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  ebf04c7b00153d6df8beceec0666d4b13e1ac613b40d5774d1b8c6f61c1686e6  glibc-glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1.tar.gz
> +sha256  295d436aac4dc45afc3b440f85fc4556c03b1140ca0f625ee015c8156d2f52ae  glibc-glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index ec5b3cedc9..cb6f8097dc 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -13,7 +13,7 @@ GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
>  else
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
> -GLIBC_VERSION = glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1
> +GLIBC_VERSION = glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a

If you drop the leading 'glibc-' from the version string, it still
works, and makes for nicer filenames, as we have in master now for
glibc-2.29.

Note that, for 2019.02 that is an LTS, we may want to keep the ugly
filenames, though, for stability for those that have "instrumentation
scripts" above buildroot.

Regards,
Yann E. MORIN.

>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
>  # sometimes the connection times out. So use an unofficial github mirror.
> -- 
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
