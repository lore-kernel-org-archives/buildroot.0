From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 31 May 2019 22:49:39 +0200
Subject: [Buildroot] [PATCH v2] autobuild-run: fix copy_if_exists()
In-Reply-To: <20190530103305.37919-1-giulio.benetti@micronovasrl.com>
References: <20190530103305.37919-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190531204939.GD3407@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2019-05-30 12:33 +0200, Giulio Benetti spake thusly:
> Under copy_if_exists() 'dir' variable is referenced as 'd' leading to
> exception.
> 
> Substitute 'd' and 'dir' with 'directory' in copy_if_exists(), since
> 'dir' is a keyword in Python.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes:
> V1->V2: change 'dir' and 'd' into 'directory'
> 
>  scripts/autobuild-run | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 56bab25..8d58a83 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -488,9 +488,9 @@ def send_results(result, **kwargs):
>      shutil.copyfile(os.path.join(outputdir, "branch"),
>                      os.path.join(resultdir, "branch"))
>  
> -    def copy_if_exists(dir, src, dst=None):
> -        if os.path.exists(os.path.join(outputdir, d, src)):
> -            shutil.copyfile(os.path.join(outputdir, d, src),
> +    def copy_if_exists(directory, src, dst=None):
> +        if os.path.exists(os.path.join(outputdir, directory, src)):
> +            shutil.copyfile(os.path.join(outputdir, directory, src),
>                              os.path.join(resultdir, src if dst is None else dst))
>  
>      copy_if_exists("build", "build-time.log")
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
