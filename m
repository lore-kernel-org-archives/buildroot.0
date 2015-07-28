From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:10:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/cc-tool: fix gcc 5 issue
In-Reply-To: <1438098186-31099-1-git-send-email-joerg.krause@embedded.rocks>
References: <1438098186-31099-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150728231034.61147736@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue, 28 Jul 2015 17:43:06 +0200, J?rg Krause wrote:
> The version of boost.m4 initially included in cc-tool has an issue
> with gcc5 (one of its tests fails due to the first change described in [1]
> "Preprocessor issues").
> 
> This was fixed upstream (boost.m4 project) in Nov 2014 [2].
> 
> We add the latest commit [3] of upstream boost.m4 plus a patch from github PR
> [4] to add detection for gcc 5.1.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a4c/a4c057e0b1ab6a2ffd69b27f6f5a79f98eb040f6/
> 
> [1]
> https://gcc.gnu.org/gcc-5/porting_to.html
> 
> [2]
> https://github.com/tsuna/boost.m4/commit/32553aaf4d5090da19aa0ec33b936982c685009f
> 
> [3]
> https://github.com/tsuna/boost.m4/commit/d9ff75b6af66360d76f46f469a26ab18e24e1030
> 
> [4]
> https://github.com/rubenk/boost.m4/commit/b879eb85f112cf054643d2e7f9544c230299c0b2
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/cc-tool/0002-boost-m4.patch | 883 ++++++++++++++++++++++++++++++++++++
>  package/cc-tool/cc-tool.mk          |   3 +
>  2 files changed, 886 insertions(+)
>  create mode 100644 package/cc-tool/0002-boost-m4.patch

Applied, thanks. Did you submit the patch to upstream cc-tool?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
