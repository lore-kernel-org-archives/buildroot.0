From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 19 Nov 2016 23:00:00 -0200
Subject: [Buildroot] [PATCH] core/br2-external: restore compatibility
	with old distros
References: <1479552746-21355-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5830f590ac62e_72b63f84f64d5e6c560f3@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, Nov 19, 2016 at 08:52 AM, Yann E. MORIN wrote:

> Currently, the br2-external script uses bash-4's associative arrays.
> 
> However, some oldish enterprise-class distros like RHEL5 still use
> bash-3.1 which lacks associative arrays.
> 
> We restore compatibility with those oldish distros using 'eval' to
> emulate associative arrays, as suggested by Arnout.
> 
> Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Simple tests using CentOS 5, bash 3.2.25:
1. make defconfig (in-tree build configuration);
2. created 2 small br2-external with a package and a defconfig each and
   successfully configured out-of-tree build with multiple br2-external
   using both defconfigs and downloaded the sources of both packages.]

Regards,
Ricardo
