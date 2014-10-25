From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 10:55:32 +0200
Subject: [Buildroot] [PATCHv3] spidev_test: new package
In-Reply-To: <1414169770-18234-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414169770-18234-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141025105532.26c151dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 24 Oct 2014 13:56:10 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                  |  1 +
>  package/spidev_test/Config.in      | 17 +++++++++++++++++
>  package/spidev_test/spidev_test.mk | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 50 insertions(+)
>  create mode 100644 package/spidev_test/Config.in
>  create mode 100644 package/spidev_test/spidev_test.mk

Applied, after doing a small change, see below.

> +# Downloaded file is C source
> +SPIDEV_TEST_EXTRACT_CMDS =
> +
> +define SPIDEV_TEST_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) -x c \
> +		-o $(@D)/spidev_test $(BR2_DL_DIR)/$(SPIDEV_TEST_SOURCE)
> +endef

I've chosen to actually implement SPIDEV_TEST_EXTRACT_CMDS by copying
the source file from $(BR2_DL_DIR) to $(@D). This allows to have
patches applied on spidev_test, or to do some manual tweaks (for
testing) in the build directory and rebuild the package. Consequently,
I've dropped the "-x c" option since the file is now copied with a .c
extension.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
