From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 19:00:33 +0200
Subject: [Buildroot] [PATCH 0/4] minicom: update to use latest git
 repository
In-Reply-To: <f8274299-4904-5968-9eb2-07d7b58bb0f3@micronovasrl.com>
References: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
 <20180801164754.72a97112@windsurf>
 <f8274299-4904-5968-9eb2-07d7b58bb0f3@micronovasrl.com>
Message-ID: <20180801190033.436cc1b2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Aug 2018 17:14:42 +0200, Giulio Benetti wrote:

> >> Giulio Benetti (4):
> >>    minicom: update package to use git repository.
> >>    minicom: add pre-configure hook to call autogen.sh
> >>    minicom: delete patches
> >>    minicom: delete hash file.  
> > 
> > All these patches should be just one, otherwise your series is not
> > bisectable.  
> 
> Ah ok, I thought it was easier break all patches.

It's not about being "easy". It's about separating logical changes, one
per patch.

Here the problem of your patch series is that if I apply just PATCH
1/4, minicom no longer builds, because it doesn't do the autoreconf
tweak, the patches won't apply, and the hash file doesn't match. This
is why I said your series is "not bisectable": it doesn't build/work
between each patch of the series.

In your situation, the change to use this different download location
for Minicom is the change, and as part of the change, it is necessary
to remove patches, tweak for autoreconf and delete the hash file. This
is all one change.

> So basically the commit log will be the cover letter, right?

Yes.

> And btw, is commit log of cover letter acceptable?

There is no "commit log" in the cover letter. The commit logs are in the
patches themselves. The cover letter contains some introduction text,
and is only necessary for patch series with multiple patches, for which
additional explanations about what the whole series is doing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
