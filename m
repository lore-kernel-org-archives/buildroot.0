From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Aug 2016 23:32:23 +0200
Subject: [Buildroot] [PATCH] package/luajit: disable for mips{32,64}r6
In-Reply-To: <20160831185356.26861-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Wed, 31 Aug 2016 20:53:56 +0200")
References: <20160831185356.26861-1-joerg.krause@embedded.rocks>
Message-ID: <87eg54y68o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > LuaJIT does not have support for MIPS Release 6 [1]. If LuaJIT is
 > invoked with the option `-b -a mips` to save the bytecode for the MIPS
 > architecture it generates object files with the MIPS32 Release 1
 > instruction set.

 > GCC added support for MIPS32R6 in version 5. However, object files for MIPS32R1
 > cannot be linked with object for MIPS32R6.

 > That's why building the package luvi fails for MIPS32R6, where object files
 > created with GCC are linked with object files created with LuaJIT with
 > the following linker error:

 > ```
 > linking mips:isa32 module with previous mips:isa32r6 modules
 > ```

 > Disable LuaJIT for MIPS32 and MIPS64 R6 to fix the build issue with the
 > luvi package.

 > Fixes:
 > http://autobuild.buildroot.net/results/e01/e017671c33314e5bf2d7fc4920f6c0e64a132383/
 > http://autobuild.buildroot.net/results/35f/35f558453c45a27367e80e9b8cbe3bd2dccbfd54/
 > http://autobuild.buildroot.net/results/8e0/8e001112b1678f9fb1c198c84184cd6f5fc3d004/

 > [1] http://www.freelists.org/post/luajit/Support-for-MIPS32r6,1

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
