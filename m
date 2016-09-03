From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Sep 2016 20:36:13 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-09-02
In-Reply-To: <2181287.8UlWShMbI3@sagittea>
References: <20160903063033.788551028C6@stock.ovh.net>
 <2181287.8UlWShMbI3@sagittea>
Message-ID: <20160903203613.2a7f0a32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 03 Sep 2016 18:03:13 +0200, J?r?me Pouiller wrote:

> wget >= 1.13-1 is necessary to fix problem. I see three solutions:
>   1. Revert de76cb7da734dde2204a7ea9ff60e24cbe857ddb ("Use CDN
>      kernel.org mirror")
>   2. Use http instead if https
>   3. Check wget version in dependencies.sh

4. The problem is already solved, because the util-linux-2.28.1.tar.xz
   tarball is now on http://sources.buildroot.net/, and Buildroot
   automatically falls back to this address. Therefore, the build
   failure will no longer occur.

However, we could discuss whether it really makes sense to use https://
as the main download location when all downloads anyway fall back to
downloading from sources.buildroot.net over http://.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
