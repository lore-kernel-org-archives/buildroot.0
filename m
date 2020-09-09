From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Sep 2020 08:54:16 +0200
Subject: [Buildroot] [go] backport go-module patch series to 2020.08.x?
In-Reply-To: <CA+h8R2rS323vadTNps=byzPQngRV3r-iQVK5ejy8-jD7E6wWdw@mail.gmail.com>
References: <CA+h8R2rS323vadTNps=byzPQngRV3r-iQVK5ejy8-jD7E6wWdw@mail.gmail.com>
Message-ID: <20200909085416.5d908423@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Tue, 8 Sep 2020 22:29:33 -0700
Christian Stewart <christian@paral.in> wrote:

> I noticed that, unless I'm seeing this wrong, the go-module patch
> series is not included in 2020.08.x -
> 
> I'd recommend including it, was there some reason not to?

Yes, we looked at it too late compared to the 2020.08 release cycle.
Our release process is explained at
https://buildroot.org/downloads/manual/manual.html#RELENG, which states:

  Each release cycle consist of two months of development on the master
  branch and one month stabilization before the release is made. During
  this phase no new features are added to master, only bugfixes.

  The stabilization phase starts with tagging -rc1, and every week
  until the release, another release candidate is tagged.

  To handle new features and version bumps during the stabilization
  phase, a next branch may be created for these features. Once the
  current release has been made, the next branch is merged into master
  and the development cycle for the next release continues there.

So, the Go changes were merged in the "next" branch that existed after
2020.08-rc1 was released. This "next" branch was merged back into
master after 2020.08 final was released, so these changes will be in
2020.11. There is a point where we need to stop making changes to a
release branch to prepare it for final release.

These Go changes are now in master, so they will be in 2020.11, and in
the next LTS 2021.02. What would be nice is to finalize the support for
non-vendored Go projects, and have it ready and merged for 2021.02.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
