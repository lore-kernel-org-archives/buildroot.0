From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 08 Sep 2011 09:04:17 -0300
Subject: [Buildroot] [git commit] busybox: add 1.19.x branch and cleanup
In-Reply-To: <1315469814.4333.2.camel@sven>
References: <20110906195720.696858D447@busybox.osuosl.org>
 <1315469814.4333.2.camel@sven>
Message-ID: <97c88113d4b3aa33c7b4cb3db0e4a10b@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 08 Sep 2011 10:16:50 +0200, Sven Neumann wrote:

> I've updated buildroot from git today and changed the config to use
> busybox 1.19.2. Now compilation fails with the following error:
>
> In file included from miscutils/ubi_tools.c:63:
> 
> /home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:329:
> error: conflicting types for ?__packed?
> 
> /home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:313:
> error: previous declaration of ?__packed? was here
> 
> /home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:371:
> error: conflicting types for ?__packed?
> 
> /home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:313:
> error: previous declaration of ?__packed? was here
> 
> /home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:386:
> error: conflicting types for ?__packed?
> 
> /home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:313:
> error: previous declaration of ?__packed? was here
> 
> /home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:398:
> error: conflicting types for ?__packed?
> 
> /home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:313:
> error: previous declaration of ?__packed? was here
> 
> /home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:412:
> error: conflicting types for ?__packed?
> 
> /home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:313:
> error: previous declaration of ?__packed? was here
> make[2]: *** [miscutils/ubi_tools.o] Error 1
> make[1]: *** [miscutils] Error 2
>
>
> Sven

I'm assuming you're using a custom busybox config and that you've 
enabled UBI tools.
With that in mind it's a linux 3.0 headers issue already reported in 
the busybox ML.
Regards.
