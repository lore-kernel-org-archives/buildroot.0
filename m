From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:15:26 +0100
Subject: [Buildroot] [PATCH 2/2] libpjsip: fix optional dependency on
 libsrtp
In-Reply-To: <1457387805-4084-2-git-send-email-luca@lucaceresoli.net>
References: <1457387805-4084-1-git-send-email-luca@lucaceresoli.net>
 <1457387805-4084-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160308211526.6a639ffb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Mon,  7 Mar 2016 22:56:45 +0100, Luca Ceresoli wrote:

> +ifeq ($(BR2_PACKAGE_LIBSRTP),y)
> +LIBPJSIP_DEPENDENCIES += libsrtp
> +LIBPJSIP_CONF_OPTS += --with-external-srtp=$(STAGING_DIR)/usr
> +endif

The --with-external-srtp seems to imply that there is also an
"internal/bundled" srtp.

If pjsip indeed needs srtp unconditionally, then we should always
depend on it and use the external libsrtp rather than the bundled one.

Can you confirm how libsrtp is used by pjsip?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
