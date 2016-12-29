From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Dec 2016 10:59:05 +0000
Subject: [Buildroot] [Bug 9531] New: NPM fails to build embedded modules
Message-ID: <bug-9531-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9531

            Bug ID: 9531
           Summary: NPM fails to build embedded modules
           Product: buildroot
           Version: 2016.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: bilge at scriptfusion.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

In this example I try to build ghost at 0.11.3. Its first dependency is
sqlite3 at 3.1.8, which fails immediately. I was able to build Ghost 0.5.10 two
years ago, which also had the sqlite dependency, and have run my blog on it
ever since (https://github.com/Docker-nano/Ghost). It should be possible to
make it work again.

> sqlite3 at 3.1.8 install /root/buildroot-2016.11/output/target/usr/lib/node_modules/ghost/node_modules/sqlite3
> node-pre-gyp install --fallback-to-build

sh: 1: node-pre-gyp: Permission denied
npm info lifecycle sqlite3 at 3.1.8~install: Failed to exec install script
/root/buildroot-2016.11/output/target/usr/lib
`-- (empty)

npm ERR! Linux 3.13.0-68-generic
npm ERR! argv "/root/buildroot-2016.11/output/host/usr/bin/node"
"/root/buildroot-2016.11/output/host/usr/bin/npm" "install" "-d" "-g"
"--build-from-source" "ghost at 0.11.3"
npm ERR! node v6.7.0
npm ERR! npm  v3.10.3
npm ERR! file sh
npm ERR! code ELIFECYCLE
npm ERR! errno ENOENT
npm ERR! syscall spawn

npm ERR! sqlite3 at 3.1.8 install: `node-pre-gyp install --fallback-to-build`
npm ERR! spawn ENOENT
npm ERR!
npm ERR! Failed at the sqlite3 at 3.1.8 install script 'node-pre-gyp install
--fallback-to-build'.
npm ERR! Make sure you have the latest version of node.js and npm installed.
npm ERR! If you do, this is most likely a problem with the sqlite3 package,
npm ERR! not with npm itself.
npm ERR! Tell the author that this fails on your system:
npm ERR!     node-pre-gyp install --fallback-to-build
npm ERR! You can get information on how to open an issue for this project with:
npm ERR!     npm bugs sqlite3
npm ERR! Or if that isn't available, you can get their info via:
npm ERR!     npm owner ls sqlite3
npm ERR! There is likely additional logging output above.

npm ERR! Please include the following file with any support request:
npm ERR!     /root/buildroot-2016.11/npm-debug.log
npm ERR! code 1
package/pkg-generic.mk:297: recipe for target
'/root/buildroot-2016.11/output/build/nodejs-6.7.0/.stamp_target_installed'
failed
make: ***
[/root/buildroot-2016.11/output/build/nodejs-6.7.0/.stamp_target_installed]
Error 1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
