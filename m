From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 May 2020 10:11:13 +0200
Subject: [Buildroot] [PATCH] package/ne10: correct cpu feature comment
 dependency
In-Reply-To: <77367b20073754b0d2f7e9bfd7e0ecab44922ef8.1588452826.git.baruch@tkos.co.il>
References: <77367b20073754b0d2f7e9bfd7e0ecab44922ef8.1588452826.git.baruch@tkos.co.il>
Message-ID: <20200503081113.GW15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2020-05-02 23:53 +0300, Baruch Siach spake thusly:
> Commit e845f9364c2b8 ("ne10: bump to v1.2.1") removed arm arch
> dependency from the comment. This comment is only relevant to arm.
> Restore the arm arch dependency.

Thanks for noticing. I've even taken a step further, and dropped the
comment altogether. Indeed, this is an arch-related restriction, and
there is nothign a user can do about that in Buildroot if the target has
no NEON unit.

Applied to master with an extended commit log exlpaining why the comment
is dropped.

Thanks!

Regards,
Yann E. MORIN.

> Cc: Cody Guldner <cody.guldner@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/ne10/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ne10/Config.in b/package/ne10/Config.in
> index 68cb7f4cb389..0e5a595dbed2 100644
> --- a/package/ne10/Config.in
> +++ b/package/ne10/Config.in
> @@ -17,4 +17,5 @@ config BR2_PACKAGE_NE10
>  	  http://projectne10.github.io/Ne10/
>  
>  comment "ne10 needs a toolchain w/ neon"
> +	depends on BR2_arm
>  	depends on !BR2_PACKAGE_NE10_ARCH_SUPPORTS
> -- 
> 2.26.2
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
