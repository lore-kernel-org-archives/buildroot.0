From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 22 Nov 2012 15:36:32 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-11-21
In-Reply-To: <20121122073420.55E8652C105@lolut.humanoidz.org>
References: <20121122073420.55E8652C105@lolut.humanoidz.org>
Message-ID: <CAG2jQ8jjcCxwiAnWPgF85UuQcHeSbvNfxmt7fCzMVBX2jzPAJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 22, 2012 at 7:34 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
>
> Status         : NOK
> Failure reason : webkit-1.2.7
> Architecture   : arm
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-11-21 21:08:57
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=e1ebae700ace80ded99e1a977e28375dc4f7255d
> End of log     : http://autobuild.buildroot.net/results/747fb6239b37cc958a5b35e5d6f843b016fab344/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/747fb6239b37cc958a5b35e5d6f843b016fab344/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/747fb6239b37cc958a5b35e5d6f843b016fab344/config
> Defconfig      : http://autobuild.buildroot.net/results/747fb6239b37cc958a5b35e5d6f843b016fab344/defconfig
>

I had a brief look on this problem. This seems to be caused by
bison-2.6 like the upstream bug suggests[1]. Back-porting the patch[2]
to 1.2.7 is not trivial so I guess the easiest (and maybe safest)
thing to do is to bump this package to the latest release.

[1]https://bugs.webkit.org/show_bug.cgi?id=92264
[2]http://trac.webkit.org/changeset/124099

-- 
Regards,
Markos
