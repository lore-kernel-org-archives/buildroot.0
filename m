From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Aug 2010 06:21:51 +0000 (UTC)
Subject: [Buildroot] [Bug 2353] [lua] fix build with 2010.08-rc1
In-Reply-To: <bug-2353-163@https.bugs.busybox.net/>
References: <bug-2353-163@https.bugs.busybox.net/>
Message-ID: <20100822062151.585AB88F5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2353

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Thanks Fran?ois for this patch. Your patch contained three things :

 *) Remove -DLUA_USE_DLOPEN from LUA_MYCFLAGS when LUA_SHARED_LIBRARY is
enabled, and add -DLUA_USE_DLOPEN to LUA_MYCFLAGS when readline support is
requested. Could you explain the rationale for this change ?

 *) A fix to make sure that the value of MYCFLAGS actually gets passed to Lua.
This is correct, and I've committed it, in a slightly different form, see
http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?id=8199f9f94bab74e27b0eed1a52ed1125e3af62e8

 *) A fix to make the clean in the src/ subdirectory. But I've just tested, the
main Lua Makefile already goes into the src/ subdirectory when doing "make
clean" at the root directory of Lua sources. So "make lua-clean" in Buildroot
already works fine. Which problem are you fixing here ?

Again, thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
