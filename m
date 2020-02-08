From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Feb 2020 19:55:44 +0100
Subject: [Buildroot] [PATCH] package/luarocks: fix buildroot addon vs
 3.3.x
In-Reply-To: <20200208142706.6097-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sat, 8 Feb 2020 15:27:06 +0100")
References: <20200208142706.6097-1-francois.perrad@gadz.org>
Message-ID: <87eev4vrgv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > an internal API change introduced by version 3.3.0 causes the following failure:
 > ```
 > Error: LuaRocks 3.3.1 bug (please report at https://github.com/luarocks/luarocks/issues).
 > Arch.: linux-x86_64
 > .../user/build/qarm/host/share/lua/5.3/luarocks/queries.lua:55: assertion failed!
 > stack traceback:
 > 	[C]: in function 'assert'
 > 	.../user/build/qarm/host/share/lua/5.3/luarocks/queries.lua:55: in function 'luarocks.queries.new'
 > 	...m/host/share/lua/5.3/luarocks/cmd/external/buildroot.lua:322: in function 'luarocks.cmd.external.buildroot.command'
 > 	(...tail calls...)
 > 	[C]: in function 'xpcall'
 > 	/home/user/build/qarm/host/share/lua/5.3/luarocks/cmd.lua:620: in function 'luarocks.cmd.run_command'
 > 	/home/user/build/qarm/host/bin/luarocks:38: in main chunk
 > 	[C]: in ?
 > ```

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
