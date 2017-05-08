From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 May 2017 23:29:20 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/ltp-testsuite: remove ldd
 commande test with static only build
In-Reply-To: <20170508211833.3462-1-romain.naour@gmail.com>
References: <20170508211833.3462-1-romain.naour@gmail.com>
Message-ID: <20170508232920.6d777844@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 May 2017 23:18:32 +0200, Romain Naour wrote:
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

Typo in commit title: s/commande/command. No need to respin for this.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
