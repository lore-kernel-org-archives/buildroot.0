From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Nov 2013 08:10:07 +0100
Subject: [Buildroot] Github URL used to fetch packages
In-Reply-To: <CAGduivwP_AykQSnspeAWqSxxNbMRLwRja_h0BDLYRX3scmDCTQ@mail.gmail.com>
References: <CAGduivwP_AykQSnspeAWqSxxNbMRLwRja_h0BDLYRX3scmDCTQ@mail.gmail.com>
Message-ID: <5277484F.4070402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/10/13 10:53, Maxime Hadjinlian wrote:
> Hi everyone,
>
> Buildroot is currently using this method to get packages from Github:
> http://buildroot.uclibc.org/downloads/manual/manual.html#github-download-url
>
> As you may know, Github released a feature called "Release" which
> basically, create a tag for you and associate that tag with a zip and
> a tarball, example:
> https://github.com/nandra/libiqrf/releases
>
> This doesn't change much with the URL we use to grab the package.
>
> Current : http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
> Release: http://github.com/<user>/<package>/archive/$(FOO_VERSION)
>
> With the second one, FOO_VERSION is the tag name (which can be
> anything, it's a string, that's all the constraints on it).
>
> Github supports both way so everything is great, nothing is broken.
> But if they stop allowing the uses of our current way, we would have
> to change one bit of the URL for ALL the packages. Which is a pain.
>
> Github has already changed the way to fetch package in the past and
> deprecated the old method, and this might happen over and over.
>
> What about a way to standardize the way to grab package from github, like:
> github://<user>/<package>/$(FOO_VERSION)
>
> We could then expand the URL to whatever is the best way of fetching
> the packages.
>
> This would be a good way for Buildroot to prevent breakage would a
> provider such as Github changes the way to fetch data.

  I like the idea. We would typically do this with some auxiliary 
variables instead of a new download method, but maybe the download method 
isn't such a bad idea. It would add even more complexity to the horrible 
pkg-download.mk, though...

  Bottom line: the idea is good, but let's see if the implementation can 
be acceptable.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
