From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Aug 2017 20:31:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/monolite: bump to version
 1050001000
In-Reply-To: <CA+TH9V=Bzj42mksn4cyGzupuDhGRoBG1HGFgKrsGX4pSL5J15Q@mail.gmail.com>
References: <1502439245-18039-1-git-send-email-angelo.compagnucci@gmail.com>
 <44cbe2b5-2d53-9c66-15a3-5e3fbfa3b219@mind.be>
 <CA+TH9VkzS19L_bWGBaRaaVSRqkuuHRPXHoq-uCfm8ePaS9oN+g@mail.gmail.com>
 <ccd40fe9-af68-42db-3b5c-8ac2d8ecdce2@mind.be>
 <CA+TH9V=Bzj42mksn4cyGzupuDhGRoBG1HGFgKrsGX4pSL5J15Q@mail.gmail.com>
Message-ID: <20170811203134.4bcad015@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Aug 2017 17:07:18 +0200, Angelo Compagnucci wrote:

> >> Sorry for the noise, but this is not how the things worked in the
> >> past. I was suggested several times in the past to send a patch for
> >> each modification/package.  
> >
> >  Yes, but only if they indeed work separately. Don't worry, I'll squash while
> > applying.  
> 
> I searched the history for the mono package just to be sure and such a
> way of squashing commits for separate packages was never been done.
> I'm a bit puzzled ...

Yes, I used to apply them separately. Theoretically, if the bumps are
really both needed for the whole thing to work, Arnout is right that
both bumps should be done in the same patch.

I simply don't apply an absolutely strict rule of "everything should be
bisectable" in Buildroot, so I'm a bit more relaxed than Arnout on
this. I'm not saying Arnout isn't right, just that it wasn't something
that I thought was important enough.

> Right now I'm working updating sysdig and it requires som bumps to
> other packages, should I send a squashed patch?!

No, because the patch series is bisectable: if we apply only PATCH 1/3,
it works. If we apply patches 1/3 and 2/3, it works. And if we apply
1/3, 2/3 and 3/3, it works.

The question is not whether patches are independent, but whether the
patch series is bisectable. I.e what happens if you apply only M
patches on the total of N patches in the series.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
