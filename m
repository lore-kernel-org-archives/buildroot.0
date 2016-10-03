From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 3 Oct 2016 09:38:58 +0000
Subject: [Buildroot] [PATCH] binutils: disable warning flags to prevent
 build failures
In-Reply-To: <20160819230601.144b35f9@free-electrons.com>
References: <1471624161-30283-1-git-send-email-vzakhar@synopsys.com>
 <20160819230601.144b35f9@free-electrons.com>
Message-ID: <1475487538.4210.7.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I submitted a patch to binutils that fixes the issue:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=c5da193232ea0452f714dffee0d417d965590476

So the workaround, proposed in the patch above, should be reverted after update to the upcoming binutils version.

Thanks.

On Fri, 2016-08-19 at 23:06 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 19 Aug 2016 19:29:21 +0300, Vlad Zakharov wrote:
> > 
> > binutils-arc-2016.09-eng008 build fails sometimes.
> > 
> > This happens due to the following issue:
> > 
> > binutils configure script has CC variable that stores compiler for
> > target and CC_FOR_BUILD variable that stores compiler for host.
> > 
> > WARN_FLAGS are verified by the script to be compatible only with CC
> > compiler but not with CC_FOR_BUILD compiler. Despite this WARN_FLAGS
> > are passed to both CC and CC_FOR_BUILD compilers. This leads to
> > unevident errors when cross-compiling. More information you can find
> > in the binutils mailing list:
> > https://sourceware.org/ml/binutils/2016-08/msg00117.html
> > 
> > We are going to write a patch for bunutils that fixes the initial
> > issue. Current patch contains temporary workaround. It should be
> > deleted after real fix.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/004/00455b6a8324920ad843d90ce0413451522691a8//
> > 
> > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> > ---
> > ?package/binutils/binutils.mk | 1 +
> > ?1 file changed, 1 insertion(+)
> 
> Applied to master, thanks.
> 
> Thomas
-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
