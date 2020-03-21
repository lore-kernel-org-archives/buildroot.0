From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 17:50:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/boinc: drop comment about
 server having no versioning
In-Reply-To: <20200321100820.137676-1-fontaine.fabrice@gmail.com>
References: <20200321100820.137676-1-fontaine.fabrice@gmail.com>
Message-ID: <20200321165035.GD4290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-03-21 11:08 +0100, Fabrice Fontaine spake thusly:
> server has versioning since April 2018 and
> https://github.com/BOINC/boinc/releases/tag/server_release%2F0.9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boinc/boinc.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
> index b6a9374715..7bbc4dfbf4 100644
> --- a/package/boinc/boinc.mk
> +++ b/package/boinc/boinc.mk
> @@ -7,8 +7,7 @@
>  BOINC_VERSION_MAJOR = 7.16
>  BOINC_VERSION = $(BOINC_VERSION_MAJOR).5
>  # client_release can be used to build the Client and Manager but not the Server
> -# part. The Server currently has no versioning (see
> -# https://github.com/BOINC/boinc/pull/1798).
> +# part.

I'm not even sure why we still talk about the server here, since this
package only ever builds the client. Even the part about the manager is
superfluous, since we explicitly do not build the manager either.

I've dropped the comment altogether, and pushed to master, thanks.

Regards,
Yann E. MORIN.

>  BOINC_SITE = \
>  	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
>  BOINC_LICENSE = LGPL-3.0+
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
