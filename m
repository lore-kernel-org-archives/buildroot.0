From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Nov 2016 18:00:39 +0100
Subject: [Buildroot] [PATCH v2 1/2] libidn2: new package
In-Reply-To: <20161103130341.6485-1-jer@airfi.aero>
References: <20161103130341.6485-1-jer@airfi.aero>
Message-ID: <43b9a262-91d8-a267-d94a-2468809f4ce7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-16 14:03, Jeroen Roovers wrote:
> An implementation of the IDNA2008 specifications (RFC 5890, RFC 5891,
> RFC 5892, RFC 5893)

 Would be good to mention that libidn only does IDNA2003 which is not acceptable
for .de domains.

> 
> Signed-off-by: Jeroen Roovers <jer@airfi.aero>

 I should have replied to this version of the patch (which is v3 by the way, not
v2), but my remarks from v1 still apply.


 Regards,
 Arnout

> ---
>  package/Config.in            |  1 +
>  package/libidn2/Config.in    |  4 ++++
>  package/libidn2/libidn2.hash |  2 ++
>  package/libidn2/libidn2.mk   | 11 +++++++++++
>  4 files changed, 18 insertions(+)
>  create mode 100644 package/libidn2/Config.in
>  create mode 100644 package/libidn2/libidn2.hash
>  create mode 100644 package/libidn2/libidn2.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9ed296f..7ffb756 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1198,6 +1198,7 @@ menu "Networking"
>  	source "package/libgsasl/Config.in"
>  	source "package/libhttpparser/Config.in"
>  	source "package/libidn/Config.in"
> +	source "package/libidn2/Config.in"
>  	source "package/libiscsi/Config.in"
>  	source "package/libldns/Config.in"
>  	source "package/libmbus/Config.in"
> diff --git a/package/libidn2/Config.in b/package/libidn2/Config.in
> new file mode 100644
> index 0000000..991a4aa
> --- /dev/null
> +++ b/package/libidn2/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_LIBIDN2
> +	bool "libidn2"
> +	help
> +	  An implementation of the IDNA2008 specifications (RFCs 5890, 5891, 5892, 5893)
> diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
> new file mode 100644
> index 0000000..a9e5295
> --- /dev/null
> +++ b/package/libidn2/libidn2.hash
> @@ -0,0 +1,2 @@
> +# Calculated locally after checking signature
> +sha256  5d397bdc258b372b8a25c8fb5240430d6fae28f9d790d3670f4b6012fa87bfff  libidn2-0.11.tar.gz
> diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
> new file mode 100644
> index 0000000..40221f3
> --- /dev/null
> +++ b/package/libidn2/libidn2.mk
> @@ -0,0 +1,11 @@
> +################################################################################
> +#
> +# libidn2
> +#
> +################################################################################
> +
> +LIBIDN2_VERSION = 0.11
> +LIBIDN2_SITE = ftp://alpha.gnu.org/gnu/libidn
> +LIBIDN2_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
