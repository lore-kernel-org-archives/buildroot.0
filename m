From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 22:10:43 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: apply modesettings
	patch for 1.18.3 only
Message-ID: <20160605201515.8D7AB801F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb6bd531c97734b7be2ec24670771dc10aef1791
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We currently have two choices for the server's version (1.18.3, and 1.14.7)
but the following patch will only apply for versions >= 1.17.2.

If 1.14.7 is selected the build will fail with the following error:

Applying 0001-modesettings-needs-dri2.patch using patch:
patching file configure.ac
Hunk #1 FAILED at 2036

So move this patch to an appropriate version folder in the package's
directory. It should be good enough until this package provides more
versions >= 1.17.2.

Signed-off-by: Stanislas Bach <sbach@0g.re>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xserver_xorg-server/{ => 1.18.3}/0001-modesettings-needs-dri2.patch   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.18.3/0001-modesettings-needs-dri2.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.18.3/0001-modesettings-needs-dri2.patch
