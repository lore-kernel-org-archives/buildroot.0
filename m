From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Mar 2014 08:43:15 +0100
Subject: [Buildroot] [PATCH 1/1] libubox: fix build with lua option
In-Reply-To: <1395891678-11327-1-git-send-email-hadrien.boutteville@gmail.com>
 (Hadrien Boutteville's message of "Thu, 27 Mar 2014 04:41:18 +0100")
References: <1395891678-11327-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <8738i4hyss.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hadrien" == Hadrien Boutteville <hadrien.boutteville@gmail.com> writes:

 > Fixes
 > http://autobuild.buildroot.org/results/fc6/fc64896ca5c3b05dfe4b5c5e7d25fc4b6c9976ad/
 > and a bunch of similar failures.

 > When Lua package is selected, libubox sets an option to build with Lua
 > binding. Unfortunately, if LUAPATH is not passed libubox seeks it on
 > the host instead of staging due to hard coded pkg-config commands in
 > its CMake file. As a result Lua is not found and the build fails.
 > Fix it by passing LUAPATH in LIBUBOX_CONF_OPT.

 > Similarly, libubox seeks LUA_CFLAGS with the host's pkg-config for the
 > same reason. To prevent potential errors, fix it by passing LUA_CFLAGS
 > in LIBUBOX_CONF_OPT.

 > Finally, libubox fails to build with Lua 5.2 because it uses functions
 > removed from this version.
 > Fix it by activating the option only with Lua 5.1.

 > Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
