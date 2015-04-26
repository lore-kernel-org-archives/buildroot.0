From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 11:37:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/ccache: add wrapper for
 internal toolchain
In-Reply-To: <1430040062-46308-2-git-send-email-kaszak@gmail.com>
References: <1430040062-46308-1-git-send-email-kaszak@gmail.com>
 <1430040062-46308-2-git-send-email-kaszak@gmail.com>
Message-ID: <20150426113742.182fa26b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Sun, 26 Apr 2015 11:21:02 +0200, Karoly Kasza wrote:
> This patch will make ccache to use mtime for compiler checks except for
> BR's internal toolchain, where using mtime would make ccache useless,
> because of the recompilations of the binaries. In this case we use
> a wrapper script and an md5 hash file with the BR .config options as
> suggested previously by Arnout.

Well, even for external toolchains using the mtime on the compiler in
$(HOST_DIR)/usr/bin will not work. Because the compiler in
$(HOST_DIR)/usr/bin is not actually the compiler, but a binary wrapper
built by Buildroot, for which the mtime will change at each build.

I must say I don't quite like the fact that the solution used here is
different between internal and external toolchain, but I haven't
thought too much of the problem.

How would ccache work with external toolchains?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
