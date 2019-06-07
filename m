From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Jun 2019 10:33:38 +0200
Subject: [Buildroot] [PATCH v2 2/3] autobuild-run: initial
 implementation of do_reproducible_build()
In-Reply-To: <20190607064657.3571-2-itsatharva@gmail.com>
References: <20190607064657.3571-1-itsatharva@gmail.com>
 <20190607064657.3571-2-itsatharva@gmail.com>
Message-ID: <20190607103338.0431cf9e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Jun 2019 12:16:56 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> This new function will call do_build() twice to produce two builds
> and then check their reproducibility
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

So, if I read the implementation correctly, in this first step, we
build twice in the same output path, i.e the only variation between the
first and the second build is the time at which the build takes place.

We discussed on IRC that we could easily also change the output path
(i.e build location) between the first and second build. But perhaps
this is something that is planned to do in a second step, and you want
to make progress with a simpler initial solution ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
