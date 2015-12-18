From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Dec 2015 22:12:13 +0100
Subject: [Buildroot] [PATCH v2 3/5] package/nodejs: correct 0.10.x
 option name
In-Reply-To: <1450394426-3349-3-git-send-email-martin@barkynet.com>
References: <1450394426-3349-1-git-send-email-martin@barkynet.com>
 <1450394426-3349-3-git-send-email-martin@barkynet.com>
Message-ID: <20151218211213.GD27578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-12-17 23:20 +0000, Martin Bark spake thusly:
> The nodejs options incorrectly started BR2_BR2_xxx.  This change corrects
> the name for 0.10.x releases to BR2_PACKAGE_NODEJS_0_10_X
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> 
> ---
> Changes v1 -> v2
>  - New in v2
> ---
>  Config.in.legacy         | 8 ++++++++
>  package/nodejs/Config.in | 6 +++---
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index db1eeae..5d9a3ee 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -186,6 +186,14 @@ config BR2_PACKAGE_INFOZIP
>  	  to avoid ambiguities with Info-Zip's UnZip which has been added
>  	  in the unzip package.
>  
> +config BR2_BR2_PACKAGE_NODEJS_0_10_X
> +	bool "nodejs 0.10.x option renamed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_NODEJS_0_10_X

No, you can't select an option that is in a choice. All you can do in
this case is tell the user to check his configuration, and refer him
to the version choice.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
