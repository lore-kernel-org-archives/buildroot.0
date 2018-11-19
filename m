From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:24:14 +0100
Subject: [Buildroot] [PATCH 1/2] package/luv: add patch to fix build
 issue with luvi
In-Reply-To: <20181115192846.18380-1-joerg.krause@embedded.rocks>
References: <20181115192846.18380-1-joerg.krause@embedded.rocks>
Message-ID: <20181119222414.487973bb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Nov 2018 20:28:45 +0100, J?rg Krause wrote:
> Add a patch to fix a build issue with luvi after bumping luv from
> version 1.9.1 to 1.22.0.
> 
> The problem is that luv now uses lua-compat-5.3 instead of defining the
> Lua 5.3 API itself. Unfortunately, luv.h now includes compat-5.3.h in the
> header file, which causes the build issue with luvi, as luvi does not
> find this local header file. Note, that luv ships lua-compat-5.3 as a
> dependency.
> 
> Therefore, the patch includes compat-5.3.h in the source file luv.c, so
> it isn't exposed to external programs.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2244cd30986aff29b763fb7183f6fc27a82bd7fa
> http://autobuild.buildroot.net/results/01938f7f018dc69d564c22489933647b1daf62f3
> http://autobuild.buildroot.net/results/8217e863c2776d299cb90b90f1a2ed8233ec82ba
> .. and many more
> 
> Note, that fixing this issue reveals another issue in luvi, which is
> fixed by the follow up patch.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...lude-compat-5.3.h-in-luv-header-file.patch | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 package/luv/0001-Do-not-include-compat-5.3.h-in-luv-header-file.patch

Series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
