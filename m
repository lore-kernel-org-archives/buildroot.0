From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Feb 2014 21:02:44 +0100
Subject: [Buildroot] [PATCH] vlc: needs dependency on host-lua if Lua is
	selected
In-Reply-To: <a785bb569d9872bd7cc8.1392575562@argentina> (Thomas De
 Schampheleire's message of "Sun, 16 Feb 2014 19:32:42 +0100")
References: <a785bb569d9872bd7cc8.1392575562@argentina>
Message-ID: <87r472j063.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > If Lua support is requested in VLC, its configure script tries to find the
 > luac byte compiler, which fails if host-lua is not yet built.

 > This can be easily reproduced by setting a minimal config with vlc and Lua
 > enabled, and running: 'make clean toolchain vlc'. Final output is:

 > checking for LUA... no
 > configure: WARNING: Package lua5.2 was not found in the pkg-config search path.
 > Perhaps you should add the directory containing `lua5.2.pc'
 > to the PKG_CONFIG_PATH environment variable
 > No package 'lua5.2' found, trying lua 5.1 instead
 > checking for LUA... no
 > configure: WARNING: Package lua5.1 was not found in the pkg-config search path.
 > Perhaps you should add the directory containing `lua5.1.pc'
 > to the PKG_CONFIG_PATH environment variable
 > No package 'lua5.1' found, trying lua >= 5.1 instead
 > checking for LUA... yes
 > checking for luac... no
 > configure: error: Could not find the LUA byte compiler.
 > make: *** [<buildroot>/output/build/vlc-2.1.2/.stamp_configured] Error 1

 > Fix this problem by setting host-lua as a dependency to vlc.

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
