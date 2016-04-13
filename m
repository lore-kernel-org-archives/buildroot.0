From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:14:02 +0200
Subject: [Buildroot] [PATCH v2] xdriver_x86-input-joystick: Install
 server config
In-Reply-To: <1460501496-2305-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460439467-29560-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460501496-2305-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20160413221402.45da5ffd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First of all, your patch, as taken from patchwork, had a mismatch
between the From: and the Signed-off-by. Indeed, the From uses ? in
your last name, while the Signed-off-by uses the regular i.

The problem is that patchwork has recorded that in the past you were
sending your e-mails with Garc?a, so even if nowadays you sent them
with Garcia, it keeps using Garc?a when doing "git pwam", leading to
this inconsistency. I wouldn't have noticed if there wasn't this silly
git hook checking for such things, which complained:

remote: Refusing to update refs/heads/master:
remote:     4470abb693967f6bcf0828f50f9a32562adb85af..65933ad61df36ac32b7a9405aa7f674cd76a4ac2
remote: 
remote: Missing Author's Signed-off-by tag
remote: 

Another comment is: when you send a v2, please include a changelog from
the previous version. Some more comments below.

On Tue, 12 Apr 2016 19:51:36 -0300, Ezequiel Garcia wrote:

> +define XDRIVER_XF86_INPUT_JOYSTICK_CONF
> +	$(INSTALL) -m 0644 -D \
> +		package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf \

You should have used $(XDRIVER_XF86_INPUT_JOYSTICK_PKGDIR) instead.

> +		$(TARGET_DIR)/usr/share/X11/xorg.conf.d/50-joystick.conf
> +

This empty line was useless.

> +endef
> +XDRIVER_XF86_INPUT_JOYSTICK_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_INPUT_JOYSTICK_CONF

I've fixed up those minor issues and applied. Please test what I've
committed to make sure I didn't introduce a typo.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
