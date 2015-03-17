From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Mar 2015 20:52:03 +0100
Subject: [Buildroot] [PATCH v3 3/8] postgresql: enable bfin compile
Message-ID: <trinity-557da2b4-73c3-45a5-ad2a-8d47aa198916-1426621923742@3capp-gmx-bs26>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, Mar 16, 2015 at 11:07:25PM +0100, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Tue, 10 Mar 2015 20:59:39 +0100, Peter Seiderer wrote:
> > - overwrite platform support with linux template
> > - disable spinlock support
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> postgresql uses fork(), which is not available on Blackfin:
> http://autobuild.buildroot.org/results/c9c/c9c93156fe64e89f35627aa592c47d8c5181ed7d/build-end.log.
> 

Will provide a patch for postgresql to check for fork/BR2_USE_MMU, is there any special string
for the comment besides 'needs threads'?

> So what was the point of enabling postgresql on Blackfin ?

No special point, had the build environment still from [1] around...

In retrospect (in case bfin is disabled because of fork) the patch subject should
have been something different...

Regards,
Peter

[1] http://git.buildroot.net/buildroot/commit/?id=fc2e91d5bd32047055a611ed0d62f050bc90377c

> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
