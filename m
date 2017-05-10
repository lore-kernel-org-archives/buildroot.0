From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:36:14 +0200
Subject: [Buildroot] [PATCH v3 1/3] package/ltp-testsuite: remove ldd
 command test with static only build
In-Reply-To: <20170509205929.8394-1-romain.naour@gmail.com>
References: <20170509205929.8394-1-romain.naour@gmail.com>
Message-ID: <20170510233614.3f3e2f1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 May 2017 22:59:27 +0200, Romain Naour wrote:
> ldd command build system try to build a shared library unconditionally:
> 
> arc-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -matomic -Os -static \
> 	-I[...]/sysroot/usr/include/tirpc   -g -O2 -fno-strict-aliasing -pipe \
> 	-Wall -W -Wold-style-definition -shared -o lddfile1.obj.so lddfile1.o
> 
> Fixes:
> http://autobuild.buildroot.net/results/2ec/2eccf9f517ab15d8d459b06195423fdfe3fba9fa
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/ltp-testsuite/ltp-testsuite.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
