From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 6 Mar 2015 10:56:08 +0100
Subject: [Buildroot] [PATCH v3] lmbench: fix build with libtirpc
In-Reply-To: <0997c42f827ac8a01c0465654e89995c70d5f5a5.1425634986.git.baruch@tkos.co.il>
References: <0997c42f827ac8a01c0465654e89995c70d5f5a5.1425634986.git.baruch@tkos.co.il>
Message-ID: <CAHkwnC9OjVj8wc=MrX-BWLKivcpLnXtxOD5H6ev0OEveBweyDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 6, 2015 at 10:43 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> When linking with an external libtirpc, -ltirpc must come after lmbench.a in
> the linker command line. Use LDLIBS for that.

Maybe just add a note about the removing of TARGET_LDFLAGS, e.g.:

Also remove TARGET_LDFLAGS because.....

> Fixes:
> http://autobuild.buildroot.net/results/89e/89ee35561d3a49f38e9a747ed78a5846be4764c8/
> http://autobuild.buildroot.net/results/409/4097b1c2585db2de517a8741174c02177aabee00/
>
> and more.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

With the above note  added:
Reviewed-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Tested-by: Fabio Porcedda <fabio.porcedda@gmail.com>
[test: Fix the build failure with the following "defconfig":
BR2_STATIC_LIBS=y
BR2_PACKAGE_LMBENCH=y]

Thanks
-- 
Fabio Porcedda
