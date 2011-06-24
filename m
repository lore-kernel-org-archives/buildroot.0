From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 24 Jun 2011 14:26:50 +0200
Subject: [Buildroot] Cross-compiling Cyrus in Buildroot
Message-ID: <4E04828A.6030908@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Cyrus and Buildroot developers,

I'm working to add cyrus-sasl and cyrus-imapd (http://www.cyrusimap.org/)
to buildroot (http://www.buildroot.net/) for use on embedded systems.

On my road I hit various problems with the cross-build process:
configuration, compilation and installation.
I could work around some, but not really fix them as they should.

I would like to share my findings with both communities, with the goal of
clearly identifying the issues and fixing them in the proper way, thus
contributing an improvement to both projects: two new packages for Buildroot
and improvements and/or fixes for Cyrus (both -sasl and -imapd).

I'll start a new thread for each issue, and keep in copy both mailing lists.
Please reply-to-all in order to keep the discussion alive in both places.

Here's a list of the issues I found:
  - cyrus-sasl: apparent CFLAGS mismatch on saslauthd;
  - cyrus-sasl: makemd5 is wrongly cross-compiled;
  - cyrus-sasl: installs files with "arm-linux-" prefix
  - cyrus-imapd: imtest does not cross-compile correctly;
  - cyrus-imapd: static binaries are huge, cannot build them shared;
  - cyrus-imapd: choose binaries to (build and) install;
  - others might follow as I go on with my work.

Before starting, a general question to Cyrus developers.
So far I've been working with the most recent released packages: cyrus-sasl
2.1.24rc1 and cyrus-imapd 2.4.9, but I see the cyrus-imapd git 
repository has
a master branch that diverges dramatically from the 2.4.x branch:

   $ git diff --shortstat  cyrus-imapd-2.4 master --
    229 files changed, 20358 insertions(+), 8177 deletions(-)

Do you think I should start working on the master branch?
Is it stable/usable? Is it similar to the 2.4.x branch in terms of usage and
administration? Has the build system been improved in the master branch
(especially with respect to the issues I'm facing)?

Thanks,
Luca
