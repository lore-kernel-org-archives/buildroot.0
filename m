From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Jun 2019 09:14:03 +0200
Subject: [Buildroot] [PATCH v5 1/4] autobuild-run: move creation of
 result directory to run_instance()
In-Reply-To: <20190617200609.4276a61a@windsurf>
References: <20190617093456.6110-1-itsatharva@gmail.com>
 <20190617200609.4276a61a@windsurf>
Message-ID: <20190618091403.582cd799@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Atharva,

On Mon, 17 Jun 2019 20:06:09 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I have applied the series to buildroot-test, thanks!

So, the first results in the autobuilders with this applied have
appeared:

  http://autobuild.buildroot.net/results/0f3/0f35347a0d4b29fa7b657f42eb3d4d176ad75410/
  http://autobuild.buildroot.net/results/128/128675664dbce8f35e5a710e85791708263a92f8/

I see two problems:

 - The output in build-end.log does not show any indication that the
   overall build failure is caused by the build being non-reproducible.
   What build-end.log shows is just a "make legal-info" that ends up
   successfully, which is very confusing since the build status is
   "failure", but the log doesn't show any sort of failure.

   I think the check_reproducibility() function should at least show
   something in the build log.

 - The reason of the failures, visible at
   http://autobuild.buildroot.net/?submitter=Thomas+Petazzoni+(Bootlin+server)&status=NOK
   are just "unknown". We really want to have a better "reason". I
   guess the easiest here would be to move the calculation of the
   "reason" into autobuild-run instead of having it server-side, as
   Arnout has suggested in a separate discussion yesterday.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
