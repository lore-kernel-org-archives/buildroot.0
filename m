From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 23:00:53 +0100
Subject: [Buildroot] [PATCH] infra/pkg-generic: ensure absolute paths in
 config-script fixups
In-Reply-To: <20181128204404.12402-1-yann.morin.1998@free.fr>
References: <20181128204404.12402-1-yann.morin.1998@free.fr>
Message-ID: <20181129230053.7eae7905@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Nov 2018 21:44:04 +0100, Yann E. MORIN wrote:
> In case a config script is called from a relative path, the $(dirnale
> $0) would return a relative path too.
> 
> Those paths are usually parts of includes or libraries search
> directories, and the packagfes buildsystems may chdir() anywhere, and
> thus the relative path will no longer be valid. For example:
> 
>   $ ./host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/net-snmp-config --cflags
>   [...] -I./host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../.././bin/../powerpc-buildroot-linux-uclibc/sysroot/usr/include/libnl3 [...]
> 
> Canonicalise the path to be sure we use absolute paths.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-generic.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
