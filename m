From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 May 2014 18:30:38 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-23
In-Reply-To: <5380ACB2.2070402@lucaceresoli.net>
References: <20140524063008.5FEFE101555@stock.ovh.net>
 <5380ACB2.2070402@lucaceresoli.net>
Message-ID: <20140524183038.47d6866b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Sat, 24 May 2014 16:29:06 +0200, Luca Ceresoli wrote:

> Static linking issue, seen also on ppc and since at least in 0.3.4 in
> January 2013.
> 
> Patch sent right now to disable audiofile with static linking:
> http://patchwork.ozlabs.org/patch/352113/

No, I don't think disabling audiofile is the right fix here. The fix is
*probably* to revert back to use -static instead of --static, so that
libtool is informed that we want to do static linking.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
