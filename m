From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Mar 2020 15:50:39 +0000
Subject: [Buildroot] [Bug 12681] Mongodb fails to build from sources
In-Reply-To: <bug-12681-163@https.bugs.busybox.net/>
References: <bug-12681-163@https.bugs.busybox.net/>
Message-ID: <bug-12681-163-JPkO5ofnxR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12681

--- Comment #2 from Vincent Fazio <vfazio@xes-inc.com> ---
The libyaml-cpp issue should be fixed at some point when a release is cut
including
https://github.com/jbeder/yaml-cpp/commit/52a1378e48e15d42a0b755af7146394c6eff998c

It should inherit the BUILD_SHARED_LIBS values defined in pkg-cmake.

Until a new version is cut, we could either hack libyaml-cpp.mk or patch
CMakeLists.txt


I haven't root-caused the mongodb issue. If it worked in 2019.05 but doesn't
now, that seems to imply the jump from 4.0.6 to 4.0.12 caused the break.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
