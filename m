From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Oct 2018 15:16:41 +0200
Subject: [Buildroot] autobuilder sandbox
In-Reply-To: <CANQCQpa_R+UwyhmNZGeKyOtN2G3487r6-T8zaDayGufq7g2g3g@mail.gmail.com>
References: <CANQCQpa_R+UwyhmNZGeKyOtN2G3487r6-T8zaDayGufq7g2g3g@mail.gmail.com>
Message-ID: <20181022151641.198b2c3f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Oct 2018 04:23:08 -0500, Matthew Weber wrote:

> I was able to get a script using the bubblewrap project working.  It
> remaps the mounted filesystem environment read-only around the
> application/shell you call.   I was wondering what the best strategy
> would be to start introducing these type of build failures?

The best strategy is to *not* introduce build failures :-)

> Maybe the autobuilder support for an alternate repo and branch needs
> to be merged first?

Well supporting alternate repo/branch is about testing different
Buildroot versions, not about testing in different environments.

I think we don't need anything special: an autobuild instance running
in a sandbox can be considered as just another autobuild instance. Just
like some autobuild instance run with Debian, others with Fedora, with
varying versions of distributions and installed packages.

So you could have an autobuilder instance running inside a sandboxed
environment, and report results to autobuild.buildroot.org with a
clearly identified "submitter" content that allows to know it's a
sandboxed instance.

To run this, I guess you have two options:

 - Run the entire autobuild-run stuff in a sandbox.

 - Modify autobuild-run so that it can optionally run just the build
   inside a sandbox.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
