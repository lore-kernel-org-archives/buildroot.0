From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Oct 2017 13:51:57 +0100
Subject: [Buildroot] [PATCH] argp-standalone: fix build with > GCC5.1
In-Reply-To: <20171031061834.27832-1-matthew.weber@rockwellcollins.com>
References: <20171031061834.27832-1-matthew.weber@rockwellcollins.com>
Message-ID: <20171031135157.41463df8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Oct 2017 01:18:34 -0500, Matt Weber wrote:
> The problem is the change of the default C standard from gnu89 to gnu11
> which changes the semantics of 'inline'. The issue is described in the
> Porting guide at https://gcc.gnu.org/gcc-5/porting_to.html. Adding the
> '-fgnu89-inline' option fixes the issue.
> 
> Similar issue:
> https://www.mail-archive.com/ptxdist at pengutronix.de/msg09746.html
> 
> Fixes:
> http://autobuild.buildroot.net/results/a9c/a9cedc54829b7bd2dd7ae6ff2bd6c6db242f1c35//
> 
> Tested via test-pkg with the following cfg
> BR2_PACKAGE_ARGP_STANDALONE=y
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Thanks for looking into this. A few questions though:

 - Why does this happen only on ARC ?

 - Why are we seeing this issue only now, while we have started to use
   gcc 5.x a long, long time ago ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
