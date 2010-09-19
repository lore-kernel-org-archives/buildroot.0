From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 19 Sep 2010 21:54:07 +0200
Subject: [Buildroot] [PATCH 0/2] Add crosstool-NG toolchain backend
Message-ID: <1284926049-9882-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds support to use crosstool-NG as a backend to generate
the toolchain used by buildroot.

  [PATCH 1/2] host tools: create the host sed in $(O)/host/
  [PATCH 2/2] toolchain: add new toolchain backend: crosstool-NG

Changes since v0 (last status report):
- use lower-case in new file names (Thomas on IRC)
- do not rebuild the toolchain if related options did not changed

The first patch fixes the location of the host sed, so it does not get
removed by crosstool-NG when building the toolchain. This is needed
because crostool-NG wipes-out the toolchain installation directory before
building the toolchain. In the end, the host-sed will probably entirely
go away, but this is not the subject of the series, and can come later.

The second patch adds the crosstool-NG backend proper.  The idea idea to
treat the toolchain as if it was an external toolchain, except that it
is not pre-built.

I've tried to split the second patch into smaller chunks, but I was not
sure it would make sense to do so, as it is a self-contained change.
It is a huge hunk, but the core of it is located in a single hunk, that
adds the toolchain build.

Although the implementation is fully functional, some work remains that
is not really essential to building the toolchain. Most notably, sanity
checks are not yet performed on the configuration, and some target-related
options are not yet passed down from the buildroot configuration to the
corresponding crosstool-NG options.

As has been looked over in the previous status report, here is the
left-over work that remains to be done:

- use latest stable release of crostool-NG: 1.8.1
- switch to generic package infrastructure, if possible
- push more options down to crosstool-NG
- sanity-check the toolchain configuration
- warn the user when he/she made changes in crosstool-NG's config
  that confilct with options from buildroot
- stress-test...

Thanks for your attention! I am open for any comment on this series. :-)

Regards,
Yann E. MORIN.
