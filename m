From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Sep 2018 23:22:17 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: fix static build with openssl
In-Reply-To: <c7ee69a4-ece1-2161-f0a4-d0bbb5dc14ad@micronovasrl.com>
References: <20180909085119.27976-1-fontaine.fabrice@gmail.com>
 <20180909141612.43915a59@windsurf.home>
 <CAPi7W81tAT9=LeVBT6gCR7a57S72ynpganrm4rSLq5viv4oUqw@mail.gmail.com>
 <20180909150919.546beda4@windsurf.home>
 <c7ee69a4-ece1-2161-f0a4-d0bbb5dc14ad@micronovasrl.com>
Message-ID: <20180917232217.456114cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Sep 2018 22:37:30 +0200, Giulio Benetti wrote:

> During this day I've submit a patch to net-snmp upstream,
> then they've corrected it.
> After they committed another patch.
> And now I'm waiting for Merge Request to be accepted to fix this bug.
> 
> It was a mixture of problem:
> - lack of -lssl in checking during configure(mainly DTLS support)
> - lack of -lz in checking during configure for a bunch of functions
> 
> I'm going to take over and send BR patch I've done in-reply-to this.

And they still don't want to use pkg-config instead of this mess of
checking transitive dependencies manually ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
