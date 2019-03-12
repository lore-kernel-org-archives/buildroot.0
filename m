From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Mar 2019 19:44:14 +0100
Subject: [Buildroot] [PATCH 2/2] docs/manual: document new behaviour of
 'make printvars'
In-Reply-To: <20190312175535.18152-2-arnout@mind.be>
References: <20190312173602.GE25009@scaer>
 <20190312175535.18152-1-arnout@mind.be>
 <20190312175535.18152-2-arnout@mind.be>
Message-ID: <20190312184414.GG25009@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-03-12 18:55 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Add a 'VARS=...' setting to the example. To make it clear that several
> variables can be specified, use two variables in the first example.
> Only 2 variables are printed, so the ... is removed.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/make-tips.txt | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
> index ea1d825bef..869b6807dd 100644
> --- a/docs/manual/make-tips.txt
> +++ b/docs/manual/make-tips.txt
> @@ -80,18 +80,18 @@ to xref:ccache[].
>  
>  .Dumping the internal make variables:
>  
> -One can dump all the variables known to make, along with their values:
> +One can dump the variables known to make, along with their values:
>  
>  ----
> - $ make -s printvars
> - VARIABLE=value_of_variable
> - ...
> + $ make -s printvars VARS='VARIABLE1 VARIABLE2'
> + VARIABLE1=value_of_variable
> + VARIABLE2=value_of_variable
>  ----
>  
>  It is possible to tweak the output using some variables:
>  
>  - +VARS+ will limit the listing to variables which names match the
> -  specified make-pattern
> +  specified make-patterns - this must be set else nothing is printed
>  - +QUOTED_VARS+, if set to +YES+, will single-quote the value
>  - +RAW_VARS+, if set to +YES+, will print the unexpanded value
>  
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
