From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Dec 2016 18:19:11 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-ZQqAdHeQn0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #9 from bilge at scriptfusion.com ---
Here is a Buildroot patch I wrote.

+++ x/deps/npm/bin/npm-cli.js
@@ -1,4 +1,4 @@
-#!/usr/bin/env node
+#!/usr/bin/node
 ;(function () { // wrapper in case we're in module_context mode
   // windows: running "npm blah" in this folder will invoke WSH, not node.
   /*global WScript*/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
