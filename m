From: Michael Wei <mwei@cs.ucsd.edu>
Date: Sun, 23 Nov 2014 12:39:37 -0800
Subject: [Buildroot] [PATCH 0/1] (node.js) fix npm CC, other npm tweaks
Message-ID: <1416775178-13738-1-git-send-email-mwei@cs.ucsd.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason, node modules with native code (compiled using tools
like gyp) were not being cross compiled properly without the
--target_arch switch.

In addition, the version of npm that is provided with the version of
node uses is old, and has some bugs like race conditions in dependency
resolution which can break builds, so this patch also updates the 
host npm before install.

Finally, node modules are now installed globally. This allows modules
to install things such as command line utilities.

Michael Wei (1):
  Fix npm module cross compilation, use up-to-date npm and install
    modules globally

 package/nodejs/nodejs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.9.1
