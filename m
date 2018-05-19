From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 14:17:39 +0200
Subject: [Buildroot] [PATCH] gdb: actually disable gdbserver if
 BR2_PACKAGE_GDB_SERVER is unset
In-Reply-To: <20180515133442.16607-1-anssi.hannula@bitwise.fi>
References: <20180515133442.16607-1-anssi.hannula@bitwise.fi>
Message-ID: <20180519141739.5aed5f2a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 May 2018 16:34:42 +0300, Anssi Hannula wrote:
> The gdb configure script is given --enable-gdbserver when
> BR2_PACKAGE_GDB_SERVER is set, but it is not given --disable-gdbserver
> when BR2_PACKAGE_GDB_SERVER is unset.
> 
> gdb gdb/configure.ac defaults to enabling gdbserver in "native"
> (host=target) cases, which is always the case when buildroot builds a
> gdb which runs on the target hardware. The gdbserver will overwrite
> BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY gdbserver, if any.
> 
> Fix that by passing --disable-gdbserver when BR2_PACKAGE_GDB_SERVER is
> unset.
> 
> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
> ---
>  package/gdb/gdb.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Good catch. Applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
