From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 23:48:31 +0200
Subject: [Buildroot] [PATCH v3 5/6] zstd: add libzstd support
In-Reply-To: <20180416193953.19924-5-ps.report@gmx.net>
References: <20180416193953.19924-1-ps.report@gmx.net>
 <20180416193953.19924-5-ps.report@gmx.net>
Message-ID: <20180425234831.0c8c6ce4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Apr 2018 21:39:52 +0200, Peter Seiderer wrote:
> Add patch to split libzstd install target into pc, static, shared
> and includes target. Call only the needed ones for the buildroot
> staging/target install steps (respect the static/shared configuration).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v2 -> v3:
>   - split libray install targets for static/shared
>     (suggested by Yann E. MORIN)

Applied to master after implementing the suggestion from Yann:

    [Thomas: as suggested by Yann E. Morin, refactor the build/install
    commands to use only one invocation, with intermediate ZSTD_BUILD_LIBS
    and ZSTD_INSTALL_LIBS variables, defined depending on whether
    static/shared/static+shared is selected.]

Also, did you submit the patch upstream ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
