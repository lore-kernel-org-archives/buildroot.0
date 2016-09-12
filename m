From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Sep 2016 23:09:35 +0200
Subject: [Buildroot] [PATCH v3 3/4] docs/manual: update contribute.txt
 to cover get-developers
In-Reply-To: <1473713695-2611-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1473713695-2611-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1473713695-2611-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160912210935.GA15314@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-09-12 22:54 +0200, Thomas Petazzoni spake thusly:
> This commit updates the contribute.txt part of the manual to tell
> people to use get-developers to get the appropriate "git send-email"
> command when sending patches.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/contribute.txt | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 1b1f4de..2973ef7 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -283,10 +283,18 @@ automatically adding the +Signed-off-by+ line.
>  Once patch files are generated, you can review/edit the commit message
>  before submitting them, using your favorite text editor.
>  
> -Lastly, send/submit your patch set to the Buildroot mailing list:
> +Buildroot provides a handy tool to know to whom your patches should be
> +sent, called +get-developers+. This tool reads your patches and
> +outputs the appropriate +git send-email+ command to use:
>  
>  ---------------------
> -$ git send-email --to buildroot at buildroot.org outgoing/*
> +$ ./support/scripts/get-developers outgoing/*
> +---------------------
> +
> +Use the output of +get-developers+ to send your patches:
> +
> +---------------------
> +$ git send-email --to buildroot at buildroot.org --to bob --to alice outgoing/*

Minor tweak: I'd prefer we use carbon-copy:   --cc alice --cc bob

Regards,
Yann E. MORIN.

>  ---------------------
>  
>  Note that +git+ should be configured to use your mail account.
> -- 
> 2.7.4
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
