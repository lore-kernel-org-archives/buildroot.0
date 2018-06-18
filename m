From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jun 2018 20:44:38 +0200
Subject: [Buildroot] Rust test too long
In-Reply-To: <20180618183320.GA13225@itchy>
References: <20180610165740.1221b491@windsurf> <20180618183320.GA13225@itchy>
Message-ID: <20180618204438.7a481c7e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jun 2018 20:33:20 +0200, Eric Le Bihan wrote:

> > Is this expected that this test takes as much as 3 hours ? Is there
> > something we can do to reduce this ?  
> 
> What is the horsepower of the Gitlab instance?

I have no idea :-/

> When building rust from source, the longest part is building the LLVM
> backend.
> 
> On a 4-core i5-7500 CPU @ 3.40GHz, TestRust takes 60 minutes. But on a
> 4-core i3-4010U CPU @ 1.70GHz, it does takes nearly 3 hours...

OK, so it is not crazy that the Gitlab instances are not able to build
this. So, I'd say we need to:

 - In the short term, disable this test from the Gitlab testing. Do you
   think you could look into this ?

 - In the mid/long term, have our own Gitlab instances, that have more
   horsepower and no limit in the duration of jobs.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
