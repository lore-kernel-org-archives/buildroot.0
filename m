From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 09:50:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: gdb+expat build fix
In-Reply-To: <1434405319-7368-1-git-send-email-rdkehn@yahoo.com>
References: <1434405319-7368-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <20150621095009.48f68c11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doug Kehn,

On Mon, 15 Jun 2015 16:55:19 -0500, Doug Kehn wrote:
> Commit 23413b51b2308225584b65c2fcd800ca8f7c56af added --with-expat
> configure option and expat dependency when BR2_PACKAGE_EXPAT is
> configured.  When cross-compiling, gdb configure fails because the host
> system libexpat is referenced.
> 
> Configuring gdb with
> 	--with-libexpat-prefix=$(STAGING_DIR)/usr
> fixes the reference and allows gdb to build successfully.
> 
> Tested with arm-buildroot-linux-gnueabihf toolchain.
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> ---
>  package/gdb/gdb.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
