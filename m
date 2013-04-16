From: Lars Dunemark <ladu@hms.se>
Date: Tue, 16 Apr 2013 19:02:22 +0000
Subject: [Buildroot] Problem with external toolchain sysroot and eclipse
In-Reply-To: <BF980CD5635D994FA25831A4A9C113BF132BF1CE39@THHS2E12BE9X.hostedservice2.net>
References: <6119D107D82B0940B389FAED3F2DDE66158823C4@Ansuz.hms.se>
 <20130416093325.57cfc00e@skate>
 <6119D107D82B0940B389FAED3F2DDE6615882483@Ansuz.hms.se>
 <BF980CD5635D994FA25831A4A9C113BF132BF1CE39@THHS2E12BE9X.hostedservice2.net>
Message-ID: <6119D107D82B0940B389FAED3F2DDE6615882794@Ansuz.hms.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Greg Beresford,

Thanks for your replay, I have tested your patch and it solves my problem.
Is there anything more that needs to be done with this patch before it can be integrated into master?

> It looks like making the external toolchain wrapper relocatable has broken it for
> use outside of buildroot. If you add the wrapper directory to your path and
> invoke the wrapper as arm-linux-gcc (for example), execution will enter the
> 'else' on line 76 of ext-toolchain-wrapper.c. This sets basename to arm-linux-
> gcc, which is fine, but it also sets absbasedir to whatever $(pwd)/../.. resolves to
> which then gets used when calculating the sysroot directory, resulting in gcc not
> having the real sysroot in its search paths.
> 
> The above all works fine if the wrapper is invoked with an absolute path. (I've
> not tried with a relative path with slashes in.)
> 
> I've got a patch with a fix which calculates absbasedir from /proc/self/exe. (I
> don't know of any other way of reliably getting the path to the current
> executable.) My C is rusty though, so it might need to be fixed up before it's
> applied. Also, I don't know if there was there a reason for avoiding the
> basename and dirname functions from libgen.h. I've not sent a properly git
> formatted patch before, (and I can't send email from my development
> machine), so it'll be a day or so before I can put a properly formatted patch
> together, or you can just pull it from the badly formatted patch in this email:
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/54942
> 
Best regards
Lars Dunemark
