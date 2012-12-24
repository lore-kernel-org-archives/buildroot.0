From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Dec 2012 14:15:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: new package
In-Reply-To: <97b2cc572615e7c760fb8f351510b67ccb02a0e4.1356343037.git.yann.morin.1998@free.fr>
References: <cover.1356343037.git.yann.morin.1998@free.fr>
 <97b2cc572615e7c760fb8f351510b67ccb02a0e4.1356343037.git.yann.morin.1998@free.fr>
Message-ID: <201212241415.12471.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All, Maxime,

On Monday 24 December 2012 Yann E. MORIN wrote:
[--SNIP--]
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> new file mode 100644
> index 0000000..d2fe97a
> --- /dev/null
> +++ b/package/tvheadend/tvheadend.mk
> @@ -0,0 +1,76 @@
[--SNIP--]
> +define TVHEADEND_INSTALL_SYSV_STARTUP_FILES
> +	$(INSTALL) -D package/tvheadend/tvheadend.default $(TARGET_DIR)/etc/default/tvheadend
> +	$(INSTALL) -D package/tvheadend/tvheadend.init    $(TARGET_DIR)/etc/init.d/S99tvheadend
> +endef
> +TVHEADEND_INSTALL_INIT_SYSV          = TVHEADEND_INSTALL_SYSV_STARTUP_FILES

I just forgot to rebuild after this change. It's broken, of course.
I've now fixed it and pushed the new package. Sorry for the confusion.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
