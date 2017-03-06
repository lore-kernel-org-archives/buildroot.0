From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 09:17:35 +0100
Subject: [Buildroot] [PATCH 1/1] fwup: requires dynamic library support
In-Reply-To: <1488786298-5737-1-git-send-email-niziak@spox.org>
References: <1488786298-5737-1-git-send-email-niziak@spox.org>
Message-ID: <20170306091735.0971c426@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Mar 2017 08:44:58 +0100, Wojciech Nizinski wrote:
> Fixes:
> http://autobuild.buildroot.net/results/7f1/7f127655ffeb45b8f49616a1ed16bb184d9d7abf/
> Signed-off-by: Wojciech Nizinski <niziak@spox.org>

Well, in fact, it doesn't need dynamic library support, it's just that
libintl uses pthread functions, but the link command doesn't include
-lpthread.

This will only happen with the ARC external toolchain, because it uses
a uClibc version that predates the merging of all libraries into
libc.so in the uClibc-ng project.

Therefore, I'm not really thrilled by the solution that consists in
disabling fwup. I think I'd prefer to temporarily disable
BR2_STATIC_LIBS with this toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
