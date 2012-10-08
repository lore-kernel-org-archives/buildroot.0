From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 08 Oct 2012 09:32:26 +0200
Subject: [Buildroot] [PATCH v3] sylpheed: Fix includedir
In-Reply-To: <1349649599-12615-1-git-send-email-gvaxon@gmail.com>
References: <1349649599-12615-1-git-send-email-gvaxon@gmail.com>
Message-ID: <5072818A.8030800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/10/12 00:39, Valentine Barshak wrote:
> The sylpheed headers are installed to $(DESTDIR)$(includedir),
> while DESTDIR is $(TARGET_DIR) and includedir is set to
> $(STAGING_DIR)/usr/include in the SYLPHEED_CONF_OPT.
> Thus, the full staging directory path is created in the
> target root filesystem, which is wrong.
>
> The includedir was set to staging include because sylpheed
> incorrectly adds includedir to its include path, and does
> not cross-compile with the default includedir set to
> /usr/include.
>
> This removes includedir setting and also removes it from
> include paths in Makefiles to prevent using host headers
> from /usr/include. The same approach is used in the OE.
>
> Signed-off-by: Valentine Barshak<gvaxon@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  (untested)


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
