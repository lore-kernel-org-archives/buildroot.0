From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:09:40 +0200
Subject: [Buildroot] [PATCH v2] dropbear: Do not build static binary
In-Reply-To: <20180507122844.30867-1-stefan.sorensen@spectralink.com>
References: <20180507122844.30867-1-stefan.sorensen@spectralink.com>
Message-ID: <20180508150940.4316d0c6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 May 2018 14:28:43 +0200, Stefan S?rensen wrote:
> Dropbear 2018.76 now uses the --enable-static option to indicate that a static
> binary should be built. This will incorrectly pick up the generic buildroot
> option intended for building static libraries, causing an unwanted static
> binary build with BR2_SHARED_STATIC_LIBS.
> 
> Fix by appending an --disable-static configure flag, overriding the buildroot
> default.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
> Changes v1->v2:
>  * Keep the --enable-static when BR2_STATIC_LIBS=y

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
