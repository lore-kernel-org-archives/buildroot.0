From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Jul 2018 23:31:11 +0200
Subject: [Buildroot] [PATCH] package/automake: bump version to 1.16.1
In-Reply-To: <20180706212709.10376-1-jean-francois.tetu@savoirfairelinux.com>
References: <20180706212709.10376-1-jean-francois.tetu@savoirfairelinux.com>
Message-ID: <13b9a287-31bf-fc90-5d49-ba78cb68b002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-07-18 23:27, Jean-Fran?ois T?tu wrote:
> If Buildroot is run from a folder containing a '@' in the path, automake
> will fail since the aclocal Perl script will interpret what is after the
> '@' as an array in its system include paths. This was fixed in automake
> 1.16.1.
> 
> Signed-off-by: Jean-Fran?ois T?tu <jean-francois.tetu@savoirfairelinux.com>

 Applied to master, thanks.

 automake is a package that runs a risk of breaking other packages using it.
Would you be willing to monitor the autobuild results in the coming weeks to
find and fix breakage caused by this bump?

 Thanks!

 Regards,
 Arnout

> ---
>  package/automake/automake.hash | 2 +-
>  package/automake/automake.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/automake/automake.hash b/package/automake/automake.hash
> index b194c3c2bc..9ff55a4bae 100644
> --- a/package/automake/automake.hash
> +++ b/package/automake/automake.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256 af6ba39142220687c500f79b4aa2f181d9b24e4f8d8ec497cea4ba26c64bedaf  automake-1.15.1.tar.xz
> +sha256 5d05bb38a23fd3312b10aea93840feec685bdf4a41146e78882848165d3ae921  automake-1.16.1.tar.xz
>  # License files, locally calculated
>  sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/automake/automake.mk b/package/automake/automake.mk
> index 270337712e..92e7d64666 100644
> --- a/package/automake/automake.mk
> +++ b/package/automake/automake.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -AUTOMAKE_VERSION = 1.15.1
> +AUTOMAKE_VERSION = 1.16.1
>  AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
>  AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
>  AUTOMAKE_LICENSE = GPL-2.0+
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
