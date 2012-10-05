From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 06 Oct 2012 01:26:58 +0200
Subject: [Buildroot] [PATCH] sylpheed: Fix includedir
In-Reply-To: <1349457934-6208-1-git-send-email-gvaxon@gmail.com>
References: <1349457934-6208-1-git-send-email-gvaxon@gmail.com>
Message-ID: <506F6CC2.6050007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/10/12 19:25, Valentine Barshak wrote:
> The sylpheed headers are installed to the target directory,
> creating full staging directory path in the target rootfs,
> which is wrong.
> This happens because the headers are installed to
> $(DESTDIR)$(includedir), while DESTDIR is set to
> $(TARGET_DIR) and includedir is $(STAGING_DIR)/usr/include.
>
> Remove $(DESTDIR) from the include paths in the Makefile
> to have sylpheed install its headers to staging include
> directory instead.

  Actually, includedir should be /usr/include instead of
$(STAGING_DIR)/usr/include.  Peter set it to $(STAGING_DIR)/usr/include
because sylpheed incorrectly adds includedir to its include path.
So maybe it's better to patch src/Makefile and remove the
--includedir=... from sylpheed.mk.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
