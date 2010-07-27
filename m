From: Peter Huewe <PeterHuewe@gmx.de>
Date: Wed, 28 Jul 2010 00:20:05 +0200
Subject: [Buildroot] Configuring host-lzo fails
In-Reply-To: <20100727235653.0d2215eb@surf>
References: <201007272333.09640.PeterHuewe@gmx.de>
	<20100727235653.0d2215eb@surf>
Message-ID: <201007280020.05811.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, 
> I was also able to reproduce the issue. 
good - makes it easier to track down ;)

> Thanks. As I could reproduce, I've started to investigate the problem.
> I've summarized my findings at
> http://free-electrons.com/~thomas/pub/autoconf-issue.txt, but I don't
> have a clear solution yet.
> 
> As a temporary fix, you can probably try something like :
> 
> HOST_LZO_CONF_OPT = --target=$(GNU_HOST_NAME)
> 
> in package/lzo/lzo.mk.
> 

I tried your temporary and it works - however I made following observation.
0)  rm -rf /buildroot/output/build/host-lzo-2.03/  buildroot/output/build/host-config.cache
1) Add HOST_LZO_CONF_OPT = --target=$(GNU_HOST_NAME) to package/lzo/lzo.mk
2) make
--> host lzo builds fine

3) rm -rf /buildroot/output/build/host-lzo-2.03/  buildroot/output/build/host-config.cache
4) remove HOST_LZO_CONF_OPT = --target=$(GNU_HOST_NAME) from package/lzo/lzo.mk
5) make
--> host lzo builds perfectly fine too!

Any Ideas? 
Since I've removed the cache, we don't have a cached value here.


Thanks,
Peter


btw.: the german umlaut in my name (?) is usually converted to ue, strange german language thing ;)
