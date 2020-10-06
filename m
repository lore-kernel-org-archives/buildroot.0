From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Oct 2020 12:27:21 -0500
Subject: [Buildroot] [PATCH 14/17] package/pkg-utils.mk: add the CPE ID
 in show-info
In-Reply-To: <20201006134250.22738-15-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
 <20201006134250.22738-15-gregory.clement@bootlin.com>
Message-ID: <CANQCQpa6Sjm7kTb2WsSYxOi+hRDN7h3+rJAPYhO2HZ_kke=3Ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greg,

On Tue, Oct 6, 2020 at 8:46 AM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
> Add the CPE ID of each package.
>
> This information will be useful for a cve-checker.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  package/pkg-utils.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index f1d085ece1..99000a3043 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -130,6 +130,7 @@ define _json-info-pkg-details
>         "version": "$($(1)_DL_VERSION)",
>         "licenses": "$($(1)_LICENSE)",
>         "dl_dir": "$($(1)_DL_SUBDIR)",
> +       "cpeid":  "$($(1)_CPE_ID)",

Here's the point where I'd also suggest getting that valid variable
for use by the scripts.

Regards,
Matt
