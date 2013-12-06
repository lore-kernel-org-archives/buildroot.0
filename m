From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Dec 2013 09:05:38 +0100
Subject: [Buildroot] [PATCH 01/16] infra: introduce github helper
	function
In-Reply-To: <1386264059-14057-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386264059-14057-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LXAqPxmecPVN8n52iev4MTYvvOtFVq_s-y0X2LknOsDeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 5, 2013 at 6:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> From: Mischa Jonker <Mischa.Jonker@synopsys.com>
>
> In order to make it easier to cope with changes in github download-URL's,
> this patch introduces the github helper function. It generates the site
> URL of a github repository. It's usage is $(call github,user,pkg,version).
>
> [Thomas: extracted from Mischa original commit, macro moved to
> pkg-download.mk]
>
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-download.mk | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 8e4a1ec..758b211 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -55,6 +55,9 @@ notdomain=$(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(c
>  # default domainseparator is /, specify alternative value as first argument
>  domainseparator=$(if $(1),$(1),/)
>
> +# github(user,package,version): returns site of github repository
> +github = https://github.com/$(1)/$(2)/tarball/$(3)
> +
>  ################################################################################
>  # The DOWNLOAD_* helpers are in charge of getting a working copy
>  # of the source repository for their corresponding SCM,

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
