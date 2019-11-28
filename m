From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Nov 2019 18:40:06 +0100
Subject: [Buildroot] Unable to build full gdb with gdbserver with
 upstream/arc-2019.09* GDB
In-Reply-To: <DM6PR12MB287609C6C03C58A29C3E0C5FD9470@DM6PR12MB2876.namprd12.prod.outlook.com>
References: <DM6PR12MB287609C6C03C58A29C3E0C5FD9470@DM6PR12MB2876.namprd12.prod.outlook.com>
Message-ID: <20191128184006.68788813@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Evgeniy,

On Thu, 28 Nov 2019 12:18:58 +0000
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> With recent update of ARC toolchain to arc-2019.09-eng/rc1 versions GDB package builds started to fail in autobuilder:
> http://autobuild.buildroot.net/results/bc5/bc52d0012944e15dee30a6e00a92f23c87d0dfda//
> http://autobuild.buildroot.net/?reason=gdb-arc-2019.09-rc1-gdb
> The build fails only if both options BR2_PACKAGE_GDB_SERVER and BR2_PACKAGE_GDB_DEBUGGER are enabled.
> 
> This error is related to this commit in binutils-gdb master branch:
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=73cc72729a184f00bf6fc4d74684a8516ba6b683.
> The error appears in ARC case because arc-2019.09 GDB is based on binutils-gdb master branch revision "20190916" and includes this commit.
> 
> More information about this bug can be found there:
> https://sourceware.org/bugzilla/show_bug.cgi?id=24729
> https://sourceware.org/bugzilla/show_bug.cgi?id=25171
> https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/issues/30
> 
> Should we temporally disable simultaneous usage of BR2_PACKAGE_GDB_SERVER and BR2_PACKAGE_GDB_DEBUGGER options for ARC?

Yes: since for now this is considered a bug and not how gdb should
normally behave, I think it's fine for now to simply prevent from
building both full gdb and gdbserver just on ARC. We'll see later if
the problem has not been fixed how to handle it in a more generic way.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
