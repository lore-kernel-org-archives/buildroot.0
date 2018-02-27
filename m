From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 22:43:43 +0100
Subject: [Buildroot] [NEXT 02/26] cpe-info: update manual for new pkg
 vars
In-Reply-To: <1519697441-54194-3-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-3-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180227224343.14ad0df8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Feb 2018 20:10:17 -0600, Matt Weber wrote:
> Provide guidance on setting up the <pkgname>_CPE_ID
> and <pkgname>_CVE_PATCHED variables.
> ---
>  docs/manual/adding-packages-generic.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 63ea51b..635c5d2 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -453,6 +453,21 @@ information is (assuming the package name is +libfoo+) :
>    FLAT binary format is only 4k bytes. If the application consumes more stack,
>    append the required number here.
>  
> +* +LIBFOO_CPE_ID+ is a space-separated list of the package's Common Product
> +  Enumeration (CPE) identification string(s).

So you can have mutiple entries in this list ? In which cases ?

> +  +make cpe-info+ copies all of these into a +cpe-manifest.csv+ file.
> +  This variable is optional. If it is not defined, +unknown+ will appear in
> +  the +CPI ID+ field of the manifest file for this package.

Side question: is this manifest.csv file generated in some standardized
format, or is it just some CSV format you can up with, just like we did
for legal-info ?

> +  To identify a package's possible CPE(s), the National Vunerability
> +  Database can be searched at https://nvd.nist.gov/products/cpe/search.
> +
> +* +LIBFOO_CVE_PATCHED+ is a space-separated list of the package's Common
> +  Vunerability Enumeration (CVE) identification strings.  This list
> +  represents patches applied to the package beyond the current version,
> +  which may fix CVEs.

I find this description a bit unclear. Indeed LIBFOO_CVE_PATCHED
doesn't "represents patches". Instead it "Enumerates CVEs that are
fixed by patches added in Buildroot". We can perhaps expand and say
that it allows the CPE reporting mechanism to know that a given CVE is
fixed, even if Buildroot is not using an upstream release that has the
CVE fixed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
