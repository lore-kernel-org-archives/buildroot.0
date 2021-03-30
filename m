From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Mar 2021 22:22:53 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts: fix pycompile for
 short filenames
In-Reply-To: <20210329105554.1622972-1-outtierbert@gmail.com>
References: <20210329105554.1622972-1-outtierbert@gmail.com>
Message-ID: <20210330202253.GE24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bert, All,

On 2021-03-29 12:55 +0200, Bert Outtier spake thusly:
> Signed-off-by: Bert Outtier <outtierbert@gmail.com>

I was pretty sure I had already handled that issue some time ago... And
indeed, there was a patch posted, some changes were requested, but a v2
never materialised.

Applied to master, thanks.

Regards,
Yann E. MORIN.

http://lists.busybox.net/pipermail/buildroot/2020-December/298707.html
http://lists.busybox.net/pipermail/buildroot/2020-December/298734.html

> ---
>  support/scripts/pycompile.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
> index 2b636e03cb..b8cd3cee6c 100644
> --- a/support/scripts/pycompile.py
> +++ b/support/scripts/pycompile.py
> @@ -30,7 +30,7 @@ def compile_one(host_path, strip_root=None, verbose=False):
>      if os.path.islink(host_path) or not os.path.isfile(host_path):
>          return  # only compile real files
>  
> -    if not re.match(r"^[_A-Za-z][_A-Za-z0-9]+\.py$",
> +    if not re.match(r"^[_A-Za-z][_A-Za-z0-9]*\.py$",
>                      os.path.basename(host_path)):
>          return  # only compile "importable" python modules
>  
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
