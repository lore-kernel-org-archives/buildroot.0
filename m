From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 16:02:14 +0200
Subject: [Buildroot] [PATCH] support/brpkutil: fix flake8 error
In-Reply-To: <20190412193500.13393-1-yann.morin.1998@free.fr>
References: <20190412193500.13393-1-yann.morin.1998@free.fr>
Message-ID: <5401ebce-b70d-bd8a-f92c-d87e11e73d21@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/04/2019 21:35, Yann E. MORIN wrote:
> When locally checking with flake8, we now detect errors that are not
> reported in gitlab-ci pipelines.

 I gave the commit message a more positive spin :-P and applied to master, thanks.

 Regards,
 Arnout

> 
> Fix one such an error now.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/scripts/brpkgutil.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/brpkgutil.py b/support/scripts/brpkgutil.py
> index 9ceda71b7f..f65068d348 100644
> --- a/support/scripts/brpkgutil.py
> +++ b/support/scripts/brpkgutil.py
> @@ -31,7 +31,8 @@ def get_dependency_tree():
>  
>      cmd = ["make", "-s", "--no-print-directory", "show-dependency-tree"]
>      with open(os.devnull, 'wb') as devnull:
> -        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=devnull, universal_newlines=True)
> +        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=devnull,
> +                             universal_newlines=True)
>          output = p.communicate()[0]
>  
>      for l in output.splitlines():
> 
