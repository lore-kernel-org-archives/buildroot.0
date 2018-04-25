From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 23:06:43 +0200
Subject: [Buildroot] EXTRA_DOWNLOADS broken when SITE_METHOD = git
In-Reply-To: <5ae0ec96133d8_66723ff59b414878241cd@ultri4.mail>
References: <20180425212739.6f0fafbd@windsurf>
 <5ae0ec96133d8_66723ff59b414878241cd@ultri4.mail>
Message-ID: <20180425230643.39b21596@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Apr 2018 18:01:10 -0300, Ricardo Martincoski wrote:

> I am currently refreshing my series with test cases for the git download infra.

Excellent! We will have to extend it to cover other download methods.
For example, the CVS backend got broken as a result of the recent
download infra changes.

> I think I can reuse the fixtures added by the series (static repo, br2-external)
> in order to add a test case for EXTRA_DOWNLOADS with SITE_METHOD = git.
> 
> A simple solution probably will add one or few files to
> http://autobuild.buildroot.net/artefacts/
> to be used by the test case.

That can easily be done. I have no idea how scalable and future proof
this "artefacts" location is going to be, but we can start by using
that, and move to a better solution in the future if needed.

> Another way is to add a http server to the docker image to serve files added to
> support/testing to be used by the test case.

This also works. Seems a bit more complicated, no ?

> Yet another solution would be to build and run an image with a http server. The
> files to be served would be added to support/testing and copied to the image.

I did not understand this solution.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
