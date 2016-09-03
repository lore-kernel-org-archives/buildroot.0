From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sat, 03 Sep 2016 18:03:13 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-09-02
In-Reply-To: <20160903063033.788551028C6@stock.ovh.net>
References: <20160903063033.788551028C6@stock.ovh.net>
Message-ID: <2181287.8UlWShMbI3@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 03 September 2016 08:30:33 Thomas Petazzoni wrote:
[...]
> mips64el |              util-linux-2.28.1 | NOK |
> http://autobuild.buildroot.net/results/e45931629ee3f5dc45de6940a2c0983435f77e00 
>      sh4 |              util-linux-2.28.1 | NOK |
> http://autobuild.buildroot.net/results/b3649dedd048515844675cd48b84bab74eb897f8 
>   x86_64 |              util-linux-2.28.1 | NOK |
> http://autobuild.buildroot.net/results/26b3a4de1fb8b366727299ff5de7d59b3e521c23

wget do not accept certificate from cdn.kernel.org. It seems to be
related to :
   https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=409938

wget >= 1.13-1 is necessary to fix problem. I see three solutions:
  1. Revert de76cb7da734dde2204a7ea9ff60e24cbe857ddb ("Use CDN
     kernel.org mirror")
  2. Use http instead if https
  3. Check wget version in dependencies.sh

Any opinion?

BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
