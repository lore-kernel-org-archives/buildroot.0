From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:25:28 +0200
Subject: [Buildroot] [PATCH] lua: fix install of lua.pc
In-Reply-To: <20170813133111.3959-1-francois.perrad@gadz.org>
References: <20170813133111.3959-1-francois.perrad@gadz.org>
Message-ID: <20170814222528.1ca21238@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Aug 2017 15:31:11 +0200, Francois Perrad wrote:
> `install` works even when the directory pkgconfig is not already created
> 
> see http://autobuild.buildroot.net/results/101/101c89e1d6aee942a0b1c4e4f3daf8ac2414a56c/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

This commit log doesn't explain why you're moving things to configure
commands. And in fact, I believe the original code in which we do the
SED at install time was more logical. So I've kept that, and just added
the missing "mkdir -p" first.

See:
https://git.buildroot.org/buildroot/commit/?id=25a2650086ad9fe0e22e2a2c3d4e64cae396fcf1

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
