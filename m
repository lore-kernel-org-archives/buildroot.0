From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 30 Oct 2013 10:53:39 +0100
Subject: [Buildroot] Github URL used to fetch packages
Message-ID: <CAGduivwP_AykQSnspeAWqSxxNbMRLwRja_h0BDLYRX3scmDCTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

Buildroot is currently using this method to get packages from Github:
http://buildroot.uclibc.org/downloads/manual/manual.html#github-download-url

As you may know, Github released a feature called "Release" which
basically, create a tag for you and associate that tag with a zip and
a tarball, example:
https://github.com/nandra/libiqrf/releases

This doesn't change much with the URL we use to grab the package.

Current : http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
Release: http://github.com/<user>/<package>/archive/$(FOO_VERSION)

With the second one, FOO_VERSION is the tag name (which can be
anything, it's a string, that's all the constraints on it).

Github supports both way so everything is great, nothing is broken.
But if they stop allowing the uses of our current way, we would have
to change one bit of the URL for ALL the packages. Which is a pain.

Github has already changed the way to fetch package in the past and
deprecated the old method, and this might happen over and over.

What about a way to standardize the way to grab package from github, like:
github://<user>/<package>/$(FOO_VERSION)

We could then expand the URL to whatever is the best way of fetching
the packages.

This would be a good way for Buildroot to prevent breakage would a
provider such as Github changes the way to fetch data.
