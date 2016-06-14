From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jun 2016 21:58:10 +0200
Subject: [Buildroot] [PATCH] scancpan: fix doc
In-Reply-To: <1465930064-19189-1-git-send-email-francois.perrad@gadz.org>
References: <1465930064-19189-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160614195810.GD3759@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2016-06-14 20:47 +0200, Francois Perrad spake thusly:
> we need to install a host perl with the same version as our target perl
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  support/scripts/scancpan | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/scancpan b/support/scripts/scancpan
> index 6c70cfb..c2aa2e9 100755
> --- a/support/scripts/scancpan
> +++ b/support/scripts/scancpan
> @@ -748,7 +748,7 @@ support/scripts/scancpan Try-Tiny Moo
>  
>  curl -kL http://install.perlbrew.pl | bash
>  
> -perlbrew install perl-5.18.2
> +perlbrew install perl-5.22.2

Would it be possible that, if this requirement is not met, it exits
with an informative message instead of just bailing out?

That information message could possibly state something like:

    The same version of perl (5.022) as used by Buildroot is not
    available on your machine.

    You may install a local one by running:
        perlbrew install perl-5.22.2

Note however that my installtion (Ubuntu 16.04) is missing perlbrew; it
is not installed by default.

I am not sure where to go from here. On one side, I thing people dealing
with perl would already have such things installed (or be willing to
install them) on their machine.

On the other hand, we've always tried to keep Buildroot's requirement on
the host as minimal as possible, and perlbrew would be adding yet
another dependency.

I'm undecided. But I'd really like the error message, above! ;-)

Regards,
Yann E. MORIN.

>  supports/scripts/scancpan [options] [distname ...]
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
