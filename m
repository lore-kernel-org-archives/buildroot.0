From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Jun 2018 21:35:10 +0200
Subject: [Buildroot] [PATCH 1/2] modem-manager: fix build with musl
In-Reply-To: <b3e5a3337202ba9221963ab01400497985202ef2.1529035334.git.baruch@tkos.co.il>
References: <b3e5a3337202ba9221963ab01400497985202ef2.1529035334.git.baruch@tkos.co.il>
Message-ID: <20180615213510.1b8605bf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jun 2018 07:02:13 +0300, Baruch Siach wrote:
> modem-manager version 1.8.0 introduced use of canonicalize_file_name(),
> which is a GNU extension that musl does not implement. Add a patch
> switching to POSIX standard realpath().
> 
> Fixes:
> http://autobuild.buildroot.net/results/9f6/9f6859f1854d94d3caba7b5c24d9ca6a14622042/
> 
> Cc: Aleksander Morgado <aleksander@aleksander.es>
> Cc: Carlos Santos <casantos@datacom.com.br>
> Cc: Petr Vorel <petr.vorel@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...erneldevice-fix-build-with-musl-libc.patch | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 package/modem-manager/0001-kerneldevice-fix-build-with-musl-libc.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
