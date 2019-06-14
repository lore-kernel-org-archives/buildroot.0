From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Jun 2019 22:26:26 +0200
Subject: [Buildroot] [PATCH v4 1/4] autobuild-run: move creation of
 result directory to run_instance()
In-Reply-To: <20190614105539.16301-1-itsatharva@gmail.com>
References: <20190614105539.16301-1-itsatharva@gmail.com>
Message-ID: <20190614202626.GN2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atharva, All,

On 2019-06-14 16:25 +0530, Atharva Lele spake thusly:
> We need the result directory to be present when the check_reproducibility()
> function (implemented in the next patch) executes. As of now the results
> directory is created in the send_results() function which executes after
> check_reproducibility() will.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v4: Add new patch to series
> ---
>  scripts/autobuild-run | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index ef2f2a5..190a254 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -470,8 +470,6 @@ def send_results(result, **kwargs):
>      srcdir = os.path.join(idir, "buildroot")
>      resultdir = os.path.join(outputdir, "results")
>  
> -    os.mkdir(resultdir)
> -
>      shutil.copyfile(os.path.join(outputdir, ".config"),
>                      os.path.join(resultdir, "config"))
>      shutil.copyfile(os.path.join(outputdir, "defconfig"),
> @@ -647,6 +645,9 @@ def run_instance(**kwargs):
>          if ret != 0:
>              continue
>  
> +        resultdir = os.path.join(idir, "output", "results")
> +        os.mkdir(resultdir)
> +
>          ret = gen_config(**kwargs)
>          if ret != 0:
>              log_write(kwargs['log'], "WARN: failed to generate configuration")
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
