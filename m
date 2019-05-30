From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 May 2019 14:57:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix memory leak in
 systemd-journald
In-Reply-To: <1559061746-21387-1-git-send-email-jonah@petri.us> (Jonah Petri's
 message of "Tue, 28 May 2019 16:42:26 +0000")
References: <1559061746-21387-1-git-send-email-jonah@petri.us>
Message-ID: <87tvdc2j7w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jonah" == Jonah Petri <jonah@petri.us> writes:

 > Systemd-journald would leak memory when recording process info.  Add
 > patch files from upstream systemd.  Note that the patch from 2d5d2e0cc5
 > was taken as well in order to make the needed commit apply cleanly.
 > Bug report: https://github.com/systemd/systemd/issues/11502
 > Accepted patch: https://github.com/systemd/systemd/pull/11527

 > Signed-off-by: Jonah Petri <jonah@petri.us>
 > ---
 >  ...ss-util-limit-command-line-lengths-to-_SC.patch | 159 +++++++++++++++++++++
 >  ...l-don-t-use-overly-large-buffer-to-store-.patch |  70 +++++++++
 >  2 files changed, 229 insertions(+)
 >  create mode 100644 package/systemd/0020-basic-process-util-limit-command-line-lengths-to-_SC.patch
 >  create mode 100644 package/systemd/0021-process-util-don-t-use-overly-large-buffer-to-store-.patch

 > diff --git
 > a/package/systemd/0020-basic-process-util-limit-command-line-lengths-to-_SC.patch
 > b/package/systemd/0020-basic-process-util-limit-command-line-lengths-to-_SC.patch
 > new file mode 100644
 > index 0000000..fd2fce7
 > --- /dev/null
 > +++ b/package/systemd/0020-basic-process-util-limit-command-line-lengths-to-_SC.patch
 > @@ -0,0 +1,159 @@
 > +From 2d5d2e0cc5171c6795d2a485841474345d9e30ab Mon Sep 17 00:00:00 2001
 > +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
 > +Date: Wed, 5 Dec 2018 18:48:23 +0100
 > +Subject: [PATCH 1/2] basic/process-util: limit command line lengths to
 > + _SC_ARG_MAX

Please use git format-patch -N to drop the N/M part of [PATCH 1/2],
which doesn't make any sense here and don't forget to add your
signed-off-by to the patch as well (git format-patch -s) as pointed out
by utils/check-package:

Applying: package/systemd: fix memory leak in systemd-journald
package/systemd/0020-basic-process-util-limit-command-line-lengths-to-_SC.patch:4: generate your patches with 'git format-patch -N'
package/systemd/0020-basic-process-util-limit-command-line-lengths-to-_SC.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
package/systemd/0021-process-util-don-t-use-overly-large-buffer-to-store-.patch:4: generate your patches with 'git format-patch -N'
package/systemd/0021-process-util-don-t-use-overly-large-buffer-to-store-.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
229 lines processed
4 warnings generated

As you did provided your signed-off-by on the Buildroot patch itself I
have fixed up the numbering, added your s-o-b and added a reference to
the bugtracker and committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
