From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Jan 2018 09:36:57 +0100
Subject: [Buildroot] [PATCH] kvm-unit-test: revert use of RDSEED and
 RDRAND
In-Reply-To: <CANQCQpaEF6aZKx8FWFNsctjvugx=zsM_Fc0c7ODDtvknLYOQVQ@mail.gmail.com>
References: <20171207043631.9312-1-matthew.weber@rockwellcollins.com>
 <20171214094459.4b383336@windsurf.png.is.keysight.com>
 <CANQCQpaDCyJLRZRk5mwun3sGy1Ex7WVZO5E35YZM02m-Synv-g@mail.gmail.com>
 <20171218084954.54776e85@windsurf>
 <20180103232707.1e834d98@windsurf.lan>
 <CANQCQpaEF6aZKx8FWFNsctjvugx=zsM_Fc0c7ODDtvknLYOQVQ@mail.gmail.com>
Message-ID: <20180104093657.40b45c55@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Jan 2018 16:42:34 -0600, Matthew Weber wrote:

> Yeah, I've done the research but was still looking at how.  Here's
> where I was at below.......
> 
> I'd default to disable because we don't have any way to tell what the
> end processor is for execution of what we build.  Worst case we could
> use the cpu type and enable a new configure option to turn this
> feature on/off.  I can suggest that to the mailing list and maybe
> they'd be ok with it defaulting to on.

Well, gcc/binutils will barf out with an error if the selected
processor variant (via mcpu) doesn't support the instruction.

Of course, if you specify a bogus mcpu flag that doesn't match your
target CPU, then it won't run. But well, passing a bogus mcpu is
already going to generate code that won't run: if you build for core-i7
and run on your old i486, the code won't run.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
