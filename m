From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 May 2021 23:50:04 +0200
Subject: [Buildroot] [PATCHv3 15/15] utils/genrandconfig: also test
 BR2_ENABLE_RUNTIME_DEBUG
In-Reply-To: <20210525122750.5022-16-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-16-patrickdepinguin@gmail.com>
Message-ID: <624b2a92-8850-fea5-4687-86d43e011300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/05/2021 14:27, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> ... similar to BR2_ENABLE_DEBUG.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> ---
>  utils/genrandconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 93dc6d898b..ca3e77e3e3 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -357,6 +357,8 @@ def gen_config(args):
>      # Amend the configuration with a few things.
>      if randint(0, 20) == 0:
>          configlines.append("BR2_ENABLE_DEBUG=y\n")
> +    if randint(0, 20) == 0:

 Although actually, I think we should increase the frequency of all these
options quite a lot...

 Regards,
 Arnout

> +        configlines.append("BR2_ENABLE_RUNTIME_DEBUG=y\n")
>      if randint(0, 1) == 0:
>          configlines.append("BR2_INIT_BUSYBOX=y\n")
>      elif randint(0, 15) == 0:
> 
