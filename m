From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Sep 2018 10:03:50 +0200
Subject: [Buildroot] [PATCH] synergy: change upstream location to fix
 download issues
In-Reply-To: <1262e995-3152-4014-dad5-770f2e83a4ac@mind.be>
References: <20180902204505.30928-1-thomas.petazzoni@bootlin.com>
 <871sab3v4l.fsf@dell.be.48ers.dk>
 <20180903102655.6f7f8df4@windsurf>
 <1262e995-3152-4014-dad5-770f2e83a4ac@mind.be>
Message-ID: <20180904100350.15acb6fc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Sep 2018 00:25:27 +0200, Arnout Vandecappelle wrote:

> > My idea was to have it on master and next, but indeed I did not think
> > about 2018.02.x/2018.05.x being broken :-/  
> 
>  Wait, how are these broken? Quoting the commit message:
> 
>    On master as of 811734ef9044bbdfc067da76358153061fae2031, we use
>    v1.8.8, which fails to download from github.com, so we fallback to
>    sources.buildroot.net, which has the tarball.

synergy is using version 1.8.8 since commit
caa16c13e0fef18ae1142f502ee39d2af8f5172e, which was merged in 2017.05.

> >> Looking at the synergy git history, a hack could be to bump the version
> >> to the commit just after v1.8.8 together with changing the URL so we end
> >> up with a new tarball name:
> >>
> >> commit ec56ac4485ef8e3cf986107b8456949b5aec3527
> >> Author: Andrew Nelless <andrew@symless.com>
> >> Date:   Fri Mar 3 14:51:23 2017 +0000
> >>
> >>     Fix version number in Changelog  
> > 
> > Or perhaps we simply don't fix it in master, and only in next ? The big
> > downside I see with not fixing in master is that people who look at
> > their build log will see the upstream download fail due to the hash
> > mismatch, and the fallback to sources.buildroot.net.  
> 
>  It's not a hash mismatch, it's a 404. So in my book, that's fine.

True. But if people fix to use the new upstream, then the hash becomes
different. But perhaps that's OK.

So all in all, you're saying that we should keep it as-is in
master/2018.02.x/2018.05.x, and simply change in next ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
