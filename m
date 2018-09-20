From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Sep 2018 00:03:44 +0200
Subject: [Buildroot] [PATCH 2/3] scancpan: skip Dist::Zilla
In-Reply-To: <20180820111623.23173-3-chrismcc@gmail.com>
References: <20180820111623.23173-1-chrismcc@gmail.com>
 <20180820111623.23173-3-chrismcc@gmail.com>
Message-ID: <20180921000344.5ea3d57e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 04:16:22 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  utils/scancpan | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/utils/scancpan b/utils/scancpan
> index 6c90588ed4..c83730fa13 100755
> --- a/utils/scancpan
> +++ b/utils/scancpan
> @@ -603,6 +603,7 @@ sub fetch {
>              # we could use the host Module::CoreList data, because host perl and
>              # target perl have the same major version
>              next if ${$dep}{phase} eq q{develop};
> +	    next if ${$dep}{phase} eq q{x_Dist_Zilla};

I fixed the indentation issue that Fran?ois reported, and applied.

BTW, it is not really great that a comment made on August 21 is not
addressed by a new version of the patches while we are a month later.
I was in fact waiting for a new version to apply this change, but since
it didn't arrive, I ended up fixing it up before applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
