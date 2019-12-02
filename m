From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 2 Dec 2019 07:57:07 -0600
Subject: [Buildroot] [PATCH 1/1] package/openjdk: modify site from
 mirror to official repos
In-Reply-To: <3c9e68edd0b8700b3914ff63ff773ed0@tudorholton.com>
References: <20191127053945.3897-1-tudor@tudorholton.com>
 <fa31990d-0f91-0eec-4b63-9d0f235daab2@mind.be>
 <3c9e68edd0b8700b3914ff63ff773ed0@tudorholton.com>
Message-ID: <CANQCQpYkA+ZisfWXFLWtjfL3Xk6Mk4CZi6FBMFnkBP0ATqzKYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tudor,



On Mon, Dec 2, 2019 at 12:09 AM Tudor Holton <tudor@tudorholton.com> wrote:
>
> On 2019-12-02 01:18, Arnout Vandecappelle wrote:
> > On 27/11/2019 06:39, Tudor Holton wrote:

[snip]

> >> @@ -7,7 +7,10 @@
> >>  OPENJDK_VERSION_MAJOR = 12.0.2
> >>  OPENJDK_VERSION_MINOR = 10
> >>  OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
> >> -OPENJDK_SITE = $(call
> >> github,AdoptOpenJDK,openjdk-jdk12u,jdk-$(OPENJDK_VERSION))
> >> +OPENJDK_PROJECT = jdk-updates
> >> +OPENJDK_RELEASE = jdk12u
> >
> >  Is it relevant to create variables for these? Just use them directly
> > in the
> > _SITE, like we do for most other packages.
> >
> >
>
> This was inspired by a few other buildroot openjdk packages that have
> been floating around the internet.
>
> It's more a style choice, but also an understanding of the upstream
> repos layout:
>
> Since OpenJDK has multiple streams this may become needed later on.
> Things like aarch32 aren't in jdk-updates (yet).  Config.in may
> eventually be able to select the project and release, but I was trying
> to keep this all as close to the current version as possible.  Don't
> forget, also, that OpenJDK now has LTS releases, which I think would be
> preferable, but there will always be a demand for newer releases also.

If you could, please verify the openjdk run-tests test case still
passes after this site change.  From within your buildroot clone with
this patchset applied, run the following.

./support/testing/run-tests -d ./dl/ -k -o test_dir
tests.package.test_openjdk.TestOpenJdk

Regards,
Matt
