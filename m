From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Mar 2012 00:55:22 +0100
Subject: [Buildroot] [PATCH 6/6] Add systemd unit for lighttpd
In-Reply-To: <b405dff28f234161c91302a003a361dd3e162a11.1332172636.git.maxime.ripard@free-electrons.com>
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
 <b405dff28f234161c91302a003a361dd3e162a11.1332172636.git.maxime.ripard@free-electrons.com>
Message-ID: <201203200055.22903.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 19 March 2012 16:59:40 Maxime Ripard wrote:
> +define LIGHTTPD_INSTALL_INIT_SYSTEMD
> +[ -f $(TARGET_DIR)/etc/systemd/system/lighttpd.service ] || \
> +       $(INSTALL) -D -m 755 package/lighttpd/lighttpd.service \
> +               $(TARGET_DIR)/etc/systemd/system/lighttpd.service
> +
> +mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +
> +ln -fs ../lighttpd.service \
> +       $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
> +endef

 This should be indented, no?

 Would it be useful to add this to generic package infrastructure?
I mean, if systemd is selected and pkgdir/pkgname.service exists,
install it and enable it in multi-user.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
