From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jan 2016 16:35:19 +0100
Subject: [Buildroot] [git commit] support/scripts/size-stats: fix copy/paste
	error in ArgumentParser
Message-ID: <20160113153749.0C60682749@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a059055c5241ff69bd3b2f32088d03bf2a0f611e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A copy/paste error in the ArgumentParser() constructor call disclosed
the fact that the author of the script has shamefully based his work
on the existing graph-build-time script. This commit fixes this
mistake, therefore hiding in a better way how size-stats was
vampirized from graph-build-time.

Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/size-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 54685f6..81d96ca 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -191,7 +191,7 @@ def gen_packages_csv(pkgsizes, outputf):
         for (pkg, size) in pkgsizes.items():
             wr.writerow([pkg, size, "%.1f" % (float(size) / total * 100)])
 
-parser = argparse.ArgumentParser(description='Draw build time graphs')
+parser = argparse.ArgumentParser(description='Draw size statistics graphs')
 
 parser.add_argument("--builddir", '-i', metavar="BUILDDIR", required=True,
                     help="Buildroot output directory")
