From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 16:42:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/ipset: Fix compile error
In-Reply-To: <1413745147-12299-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413745147-12299-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141026164254.2f4f8591@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 20:59:07 +0200, Bernd Kuhls wrote:
> Error occured with an allyespackageconfig setup:
> 
> In file included from print.c:19:0:
> print.c: In function 'ipset_print_ip':
> ../include/libipset/data.h:150:1: error: inlining failed in call to 'ipset_data_test': call is unlikely and code size would grow [-Werror=inline]
>  ipset_data_test(const struct ipset_data *data, enum ipset_opt opt)
>  ^
> print.c:273:21: error: called from here [-Werror=inline]
>   if (ipset_data_test(data, cidropt)) {
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ipset/ipset.mk |    2 ++
>  1 file changed, 2 insertions(+)

To fix the same problem, I've applied a slightly different fix, that
simply removes -Werror altogether.

See
http://git.buildroot.net/buildroot/commit/?id=a923b44112aa3bfdb42b12cc1bd2712a263c1a0c.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
