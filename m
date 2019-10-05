From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:33:41 +0200
Subject: [Buildroot] [PATCH v1] package/icu: fix double conversion
 compile for microblaze
In-Reply-To: <20191003145806.22848-1-ps.report@gmx.net>
References: <20191003145806.22848-1-ps.report@gmx.net>
Message-ID: <20191005233341.2a661368@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Oct 2019 16:58:06 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes [1]:
> 
>   In file included from double-conversion.h:42:0,
>                    from number_decimalquantity.cpp:19:
>   double-conversion-utils.h:120:2: error: #error Target architecture was not detected as supported by Double-Conversion.
>    #error Target architecture was not detected as supported by Double-Conversion.
> 
> Apply the same fix as previously for qt5base ([2], already sent upstream [3],
> but seems to be lost while merging [4]).
> 
> [1] http://autobuild.buildroot.net/results/24005bc54cbc742decee221fb09bca19ee70502c
> [2] https://git.buildroot.net/buildroot/commit/?id=530668ddb709cf27aa6694e00f44cf58af858b0b
> [3] https://github.com/google/double-conversion/issues/73
> [4] https://github.com/google/double-conversion/commit/768a445f0c28311bf88685bf0bb990505c12fd4c
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...ble-conversion-enable-for-microblaze.patch | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/icu/0007-double-conversion-enable-for-microblaze.patch

Applied to master, thanks. Could you get back to upstream so that this
microblaze support gets added ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
