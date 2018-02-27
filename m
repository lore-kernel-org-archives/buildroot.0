From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 22:18:15 +0100
Subject: [Buildroot] [PATCH 2/2] apache init script
In-Reply-To: <20180227115022.8802-1-chrismcc@gmail.com>
References: <20180227115022.8802-1-chrismcc@gmail.com>
Message-ID: <20180227221815.21afde38@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution!

The commit title should be something like:

	apache: install an sysv init script

On Tue, 27 Feb 2018 03:50:22 -0800, Christopher McCrory wrote:
> This patches and installs the included init script.  The script mostly works, but could use a little more editing.

The commit log should be wrapped to 72 characters.

>  package/apache/0003-init-script.patch | 56 +++++++++++++++++++++++++++++++++++
>  package/apache/apache.mk              |  6 ++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 package/apache/0003-init-script.patch
> 
> diff --git a/package/apache/0003-init-script.patch b/package/apache/0003-init-script.patch
> new file mode 100644
> index 0000000000..1d7a6a022a
> --- /dev/null
> +++ b/package/apache/0003-init-script.patch

All patches should have a description and a Signed-off-by line.

What does the complete init script looks like after your patch ? Is it
worth re-using the init script provided by Apache, as opposed to
providing a simple one in package/apache/S<xy>apache  ?

> +define APACHE_INSTALL_INIT_SCRIPT

Just call this variable:

APACHE_INSTALL_INIT_SYSV

This way, no need to add it to APACHE_POST_INSTALL_TARGET_HOOKS, and
the script will not be installed if the Buildroot configuration uses
systemd instead of busybox init or sysvinit.

> +	$(INSTALL) -D -m 0755 $(@D)/build/rpm/httpd.init \
> +	 $(TARGET_DIR)/etc/init.d/S85httpd

Second line should be intended with two tabs.

> +endef
> +APACHE_POST_INSTALL_TARGET_HOOKS += APACHE_INSTALL_INIT_SCRIPT

So this line can go away.

Could you take into account those comments and submit an updated
version ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
