From: David Kosir <david.kosir@bylapis.com>
Date: Mon, 26 Oct 2015 22:56:34 +0100
Subject: [Buildroot] Recommended way of working on project
Message-ID: <CAOcYpt0a2g1t9euFaFJGwifAQen-mf8yeXP8Xh5A=RUYgPtXgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I need advice from someone who already did real-life projects with buildroot.

I've started a buildroot project and I'm wondering what is the best
way of managing it.
I will mostly use open-source packages that are already part of the
buildroot, but I will need to update versions and change specific
build options on many of them. Also, I will add few custom
scripts/programs.

I was thinking what is the best way of handling it. I've read
recommendations here [1]
I see two recommended ways and third non-recommended but often approach:

1) Use company-specific configuration and packages, don't interfere
with buildroot files.
2) Use BR2_EXTERNAL and don't touch buildroot (probably use it as git
submodule).
3) Fork buildroot and change whatever you like. Fetch new changes
now-and-then, if possible to merge easily.

I know that 1) and 2) are recommended but I've already stumbled upon
problem keeps growing and repeating:

- I need to use XY package but I need newer version
- I create new XY-custom package in my <company>/<board> or BR2_EXTERNAL path
- XY package is dependency for few other packages so I need to create
them as *-custom package
- I end up with 10 custom packages in two days and I expect to have 10
more next days.

As my final product will basically be using all my custom packages +
few basic buildroot packages, is there and good reason not to go with
approach no 3) ?
I see it often online, when people just fork buildroot and continue
working on some stable tag, rarely even bothering on merging from
mainline as their image works and there is no need to touch it.

While 1) and 2) look like "right" way of doing it (as they give easy
buildroot merging) it feels like running parallel "mini-buildroot"
copying mainline packages and doing minor changes to them.

When time comes to fetch new changes, in 1) and 2) I will need to
looks for changes manually as I've copied old packages and in 3) I
will have to do manual merge examining conflicts.

What are your real life project experiences, what is the best way?

Thanks
David

[1] http://buildroot.uclibc.org/downloads/manual/manual.html#customize
