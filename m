From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 31 Dec 2016 11:39:11 +0000
Subject: [Buildroot] [Bug 9531] NPM fails to build embedded modules
In-Reply-To: <bug-9531-163@https.bugs.busybox.net/>
References: <bug-9531-163@https.bugs.busybox.net/>
Message-ID: <bug-9531-163-wi1r7UixsO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9531

--- Comment #7 from bilge at scriptfusion.com ---
It seems this issue has been extensively documented at
https://github.com/mapbox/node-sqlite3/issues/612 over the past 9 months. The
solution, when building as root, is simply to specify the --unsafe-perm option
to NPM. I include a patch, below.

+++ package/nodejs/nodejs.mk
@@ -160,7 +160,7 @@
        # If you're having trouble with module installation, adding -d to the
        # npm install call below and setting npm_config_rollback=false can both
        # help in diagnosing the problem.
-       $(NPM) install -g $(NODEJS_MODULES_LIST)
+       $(NPM) install -g --unsafe-perm $(NODEJS_MODULES_LIST)
 endef
 endif

-- 
You are receiving this mail because:
You are on the CC list for the bug.
