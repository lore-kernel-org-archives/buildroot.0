From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 14:17:38 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: detect external glibc in
	symlinked /lib
In-Reply-To: <20170903120835.16190-1-camh@xdna.net>
References: <20170903120835.16190-1-camh@xdna.net>
Message-ID: <20170903141738.20c0d621@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This generally looks ok, to me, except one paragraph of explanation,
see below.

On Sun,  3 Sep 2017 22:08:35 +1000, Cam Hutchison wrote:
> check_glibc checks for a valid glibc in an external toolchain, but
> assumes that the files indicating the presence of glibc (ld-linux*.so.*,
> ld.so.* or ld64.so.*) are in a top-level directory of the sysroot.
> 
> When building a toolchain with buildroot and a merged /usr, /lib is
> a symlink to usr/lib. This is copied from the target to the staging
> directory, and then to the sysroot, and the ultimate location of the
> required files is in /usr/lib in the sysroot.

I don't understand this sentence. Nothing gets copied from target to
staging, and staging *is* the sysroot, so there's no copy. Could you
explain what you wanted to say here, we can perhaps find a better
phrasing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
