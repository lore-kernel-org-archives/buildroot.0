From: Ryan Coe <bluemrp9@gmail.com>
Date: Fri, 13 Dec 2019 19:52:41 -0800
Subject: [Buildroot] mariadb: inrorrect behavio of mariadb_config
In-Reply-To: <10576581576241151@sas2-e9d1d6a5422a.qloud-c.yandex.net>
References: <10576581576241151@sas2-e9d1d6a5422a.qloud-c.yandex.net>
Message-ID: <5d4966ed-8801-8bb8-6aca-c5e0232dfe7f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey,

On 12/13/19 4:45 AM, ????????? ??????? wrote:
> Hello, Ryan!
>
> inrorrect behavior observed by using mysql_config from mariadb package
>
> if mariadb_config exists in system we get out host root paths instead of required sysroot paths
>
> this is fixed by removing mariadb_config from sysroot
>
> could you please comment this ?

I found that mariadb_config returns the host paths regardless if MariaDB 
is installed on the host or not.? I have submitted a patch [1] to fix 
this.? This patch also removes mariadb_config from the target.


[1] http://patchwork.ozlabs.org/patch/1209658/

>
> -- 
> Regards,
> Alexey Lukyanchuk
> skif at skif-web.ru
>
