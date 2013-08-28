From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 13:18:59 +0200
Subject: [Buildroot] [PATCH] gcc-final: Drop obsolete code for handling
 lib64
In-Reply-To: <1377687378-19688-1-git-send-email-markos.chandras@imgtec.com>
References: <1377687378-19688-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <20130828131859.7bbd1fd6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Wed, 28 Aug 2013 11:56:18 +0100, Markos Chandras wrote:
> Since 5628776c4a4d29d0715633ea463b64cc19e19c5a
> "toolchain-external: fix lib64 symlinks"
> 
> lib64 is a symlink to lib so there is no reason to copy the libraries
> to lib64 anymore. This fixes multiple building problems
> for buildroot toolchains:
> 
> [...]
> mv: 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib64/libuClibc-0.9.33.2.so'
> and 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib/libuClibc-0.9.33.2.so'
> are the same file
> mv: 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib64/libutil-0.9.33.2.so'
> and 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib/libutil-0.9.33.2.so'
> are the same file
> mv: 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib64/libutil.so.0'
> and 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib/libutil.so.0'
> are the same file
> rmdir: failed to remove
> 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib64': Not a directory
> [...]
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks.
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
