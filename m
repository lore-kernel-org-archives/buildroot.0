From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 15:38:37 +0100
Subject: [Buildroot] [PATCH v2 15/17] openal: add missing
 BR2_TOOLCHAIN_HAS_SYNC_4 dependency
In-Reply-To: <56AC9EC3.9030706@dawncrow.de>
References: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453934861-26364-16-git-send-email-thomas.petazzoni@free-electrons.com>
 <56ABB0C2.9070203@dawncrow.de>
 <20160130000635.018f59fa@free-electrons.com>
 <56AC9EC3.9030706@dawncrow.de>
Message-ID: <20160203153837.29beb118@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jan 2016 12:30:11 +0100, Andr? Hentschel wrote:

> > Hum, you are right indeed. I will look into this again, but if it's a
> > dependency on __atomic functions, then it should depend on gcc >= 4.7
> > *and* link with libatomic.
> 
> I looked a bit closer and openal has its own checks for availability of sync/atomic functions...
> So the dependecy is something like (gcc >= 4.7 || has_sync_4)
> Not sure how to make it link to libatomic without patching...

I sent a new version of the patch, which hopefully resolves the
problem. See the V3 of my atomic patch series.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
