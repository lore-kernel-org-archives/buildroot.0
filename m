From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 11:00:02 +0200
Subject: [Buildroot] [PATCH v2] toolchain: add gdb wrapper that
 automatically passes the gdbinit file
In-Reply-To: <1461952987-20954-1-git-send-email-patrickdepinguin@gmail.com>
References: <1461952987-20954-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20161016110002.2749fbfc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 20:03:07 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Buildroot already provided a gdbinit file to set the right sysroot, but
> required users to pass this file explicitly when invoking gdb.
> 
> Make the process a bit more user-friendly by creating a gdb wrapper that
> passes the gdbinit file to the real gdb program.
> 
> The code needs to take into account several cases (internal toolchain,
> external toolchain, ...) because the name and type of the real gdb program
> differs.
> 
> The documentation is updated to reflect this change.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
> v2:
> - use "$@" instead of $@ in shell wrapper
> - update release in manual to match 2016.05

After discussing at the Buildroot meeting, we decided to reject this
patch. Indeed, we believe this additional wrapper is not really needed,
and hides some more magic which we prefer to keep visible to the user.

What we could do is to make it a bit easier for users to find the
gdbinit file by having a "staging" symlink pointing to the sysroot,
installed in the host directory. This way, even if your toolchain is
installed in /opt/br-baz/, you can do:

/opt/br-baz/usr/bin/<blah>-gdb -x /opt/br-baz/usr/staging/usr/share/buildroot/gdbinit

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
