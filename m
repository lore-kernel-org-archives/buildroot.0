From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 17:20:58 +0100
Subject: [Buildroot] Segmentation fault while trying to remote debug
 with GDB and GDBServer
In-Reply-To: <20140302171008.2014a1e0@skate>
References: <51ef4c3ec6f84eab802c23a14ecb48ae@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302070650.GE3874@tarshish>
 <24eee2c96f804b55ae7767734d5a4f6e@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302091205.GF3874@tarshish>
 <29f88dd2071c483bb7102687088ac6b3@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302122406.GJ3874@tarshish>
 <99f27349e290444ba06497af087cb0d8@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302171008.2014a1e0@skate>
Message-ID: <20140302172058.5d9a49e1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 2 Mar 2014 17:10:08 +0100, Thomas Petazzoni wrote:

> The Eclipse plugin does set the solib-path (see
> https://github.com/mbats/eclipse-buildroot-toolchain-plugin/blob/master/org.buildroot.cdt.toolchain/src/org/buildroot/cdt/toolchain/BuildrootLaunchConfigurationTabGroup.java#L70),
> but that is apparently insufficient for gdb to find the correct dynamic
> linker, especially when the host and target architectures are identical.
> 
> Since there is apparently no way in Eclipse to set a gdb sysroot, I
> believe the only solution is for the Eclipse plugin to generate a
> simple gdbinit file:
> 
> set sysroot /path/to/staging/directory
> 
> and then instruct Eclipse to use it.

Or now that I think of it, maybe Buildroot should itself generate this
gdbinit file. It may be useful even for users not using Eclipse.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
