From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Jan 2019 17:14:21 +0100
Subject: [Buildroot] [PATCH] package/pkgconf: fix behavior of pkg-config
 --version
In-Reply-To: <20190102154817.GJ23435@scaer>
References: <20181227141523.18796-1-thomas.petazzoni@bootlin.com>
 <20190102154817.GJ23435@scaer>
Message-ID: <20190102171421.38edb87b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Jan 2019 16:48:17 +0100, Yann E. MORIN wrote:

> > This misbehavior of pkg-config has been reported upstream at
> > https://git.dereferenced.org/pkgconf/pkgconf/issues/19, but until it
> > gets fixed, we work around the issue by patching pkg-config so that it
> > ignores --static in the count of arguments when doing its
> > --version/--modversion dance.  
> 
> Why don't we simply revert the upstream commit that changed the
> behaviour?

Could be an option yes. I was hoping that the patch I was proposing
could potentially be accepted upstream, while I believe a simple revert
would not.

But I haven't heard back from upstream in
https://git.dereferenced.org/pkgconf/pkgconf/issues/19, so I'm not sure
what they think about the whole issue. Perhaps a revert is good enough
for now, and we can adjust it later depending on upstream feedback.

I'll send a new version doing a revert of this "feature".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
