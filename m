From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 23:36:18 +0200
Subject: [Buildroot] [PATCH] pppd: Move netinet/in.h above linux header
 includes
In-Reply-To: <CAFOMc=TTG9Z4iO0m5K+-Sao=fsk45MayfqmfvqM2O60SrWXMXQ@mail.gmail.com>
References: <1476997957-27184-1-git-send-email-Stefan.Nickl@gmail.com>
 <20161020232339.54683f92@free-electrons.com>
 <CAFOMc=TTG9Z4iO0m5K+-Sao=fsk45MayfqmfvqM2O60SrWXMXQ@mail.gmail.com>
Message-ID: <20161020233618.6e38528b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the Buildroot list in Cc.

On Thu, 20 Oct 2016 23:31:57 +0200, Stefan Nickl wrote:

> > Thanks for your contribution! However, exactly 15 minutes before you
> > sent this patch, I committed a change for the same problem:
> > https://git.buildroot.org/buildroot/commit/?id=
> > 035567b2793f3649e2ddc6cd34b75dd643f47d73.
> >  
> 
> Going all-in on kernel headers is also a way to deal with the issue, but I
> think one should try to move towards libc headers.

Agreed, using libc headers would be nicer. But pppd is already a big
mess in terms of mixing libc and kernel headers, so this little fix was
good enough for the job.

> Anyway, no hard feelings here, I'm curious how it will hold up across
> various build permutations.

Yes, we'll see what it gives.

As you've said in another thread, the pppd project is more-or-less dead
upstream, so someone really needs to revive this project and provide a
better upstream.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
