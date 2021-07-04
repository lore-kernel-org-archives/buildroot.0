From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 22:04:51 +0200
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: search LICENSE.MD
In-Reply-To: <20210704193859.3406196-1-fontaine.fabrice@gmail.com>
References: <20210704193859.3406196-1-fontaine.fabrice@gmail.com>
Message-ID: <20210704200451.GL2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-07-04 21:38 +0200, Fabrice Fontaine spake thusly:
> Some packages such as python-idna has a LICENSE.md file:
> https://github.com/kjd/idna/blob/master/LICENSE.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Note that the python-idna we have still lists LICENSE.rst. Maybe a
version bump is in the works? ;-)

Regards,
Yann E. MORIN.

> ---
>  utils/scanpypi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 47c7c00c60..8327fc3fc5 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -495,8 +495,8 @@ class BuildrootPackage():
>          """
>          lines = []
>  
> -        filenames = ['LICENCE', 'LICENSE', 'LICENSE.RST', 'LICENSE.TXT',
> -                     'COPYING', 'COPYING.TXT']
> +        filenames = ['LICENCE', 'LICENSE', 'LICENSE.MD', 'LICENSE.RST',
> +                     'LICENSE.TXT', 'COPYING', 'COPYING.TXT']
>          self.license_files = list(find_file_upper_case(filenames, self.tmp_extract))
>  
>          lines.append(self.__get_license_names(self.license_files))
> -- 
> 2.30.2
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
