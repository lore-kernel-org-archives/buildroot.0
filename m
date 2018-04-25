From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 25 Apr 2018 18:01:10 -0300
Subject: [Buildroot] EXTRA_DOWNLOADS broken when SITE_METHOD = git
References: <20180425212739.6f0fafbd@windsurf>
Message-ID: <5ae0ec96133d8_66723ff59b414878241cd@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Apr 25, 2018 at 04:27 PM, Thomas Petazzoni wrote:

> I think this illustrates (once again) that we desperately need some
> tests for the download infrastructure. I'm adding Ricardo in Cc, who
> already started working on such topic.

I am currently refreshing my series with test cases for the git download infra.

I think I can reuse the fixtures added by the series (static repo, br2-external)
in order to add a test case for EXTRA_DOWNLOADS with SITE_METHOD = git.

A simple solution probably will add one or few files to
http://autobuild.buildroot.net/artefacts/
to be used by the test case.

Another way is to add a http server to the docker image to serve files added to
support/testing to be used by the test case.

Yet another solution would be to build and run an image with a http server. The
files to be served would be added to support/testing and copied to the image.

I will try to include a RFC for the first solution at the end of the series, if
no one speaks against it (or in favor of other solution).

Regards,
Ricardo
