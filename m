From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Mar 2020 21:01:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/smack: annotate CVE-2016-10027
In-Reply-To: <20200301193527.209837-1-fontaine.fabrice@gmail.com>
References: <20200301193527.209837-1-fontaine.fabrice@gmail.com>
Message-ID: <20200301210127.476be796@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  1 Mar 2020 20:35:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> CVE-2016-10027 is misclassified (by our CVE tracker) as affecting smack, while
> in fact it affects https://github.com/igniterealtime/Smack.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/smack/smack.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/smack/smack.mk b/package/smack/smack.mk
> index d2ac005ab9..1237c8356c 100644
> --- a/package/smack/smack.mk
> +++ b/package/smack/smack.mk
> @@ -11,6 +11,10 @@ SMACK_LICENSE_FILES = COPYING
>  SMACK_INSTALL_STAGING = YES
>  SMACK_DEPENDENCIES = host-pkgconf
>  
> +# CVE-2016-10027 is misclassified (by our CVE tracker) as affecting smack, while
> +# in fact it affects https://github.com/igniterealtime/Smack.
> +SMACK_IGNORE_CVES += CVE-2016-10027

I think this should be resolved by adding CPE mappings, not by adding
an IGNORE_CVES value.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
