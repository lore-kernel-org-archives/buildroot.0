From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 18 Dec 2017 15:16:22 +0100
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: increase error message
 verbosity
In-Reply-To: <20171218140016.13774-1-alexey.roslyakov@gmail.com>
References: <20171218140016.13774-1-alexey.roslyakov@gmail.com>
Message-ID: <CAGm1_kuNJesKGhK5nX1imSn1xTtiT83B6j6Cv9_uZ4PseTWuAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Mon, Dec 18, 2017 at 3:00 PM, Alexey Roslyakov
<alexey.roslyakov@gmail.com> wrote:
> When package installation fails it is good to know what happened.
>
> Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>

Nice catch.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Yegor

> ---
>  utils/scanpypi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 02384f2569..939c26a187 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -608,9 +608,9 @@ def main():
>                  else:
>                      raise
>                  continue
> -            except AttributeError:
> -                print('Error: Could not install package {pkg}'.format(
> -                    pkg=package.real_name))
> +            except AttributeError as error:
> +                print('Error: Could not install package {pkg}: {error}'.format(
> +                    pkg=package.real_name, error=error))
>                  continue
>
>              # Package requirement are an argument of the setup function
> --
> 2.13.6
>
