From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Oct 2014 15:21:56 +0200
Subject: [Buildroot] [PATCH] New attempt to move $BUILD_DIR/.root
In-Reply-To: <20141012125455.4025c179@free-electrons.com>
References: <1396366401-6534-1-git-send-email-jezz@sysmic.org>
 <20141012125455.4025c179@free-electrons.com>
Message-ID: <543A8074.207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/10/14 12:54, Thomas Petazzoni wrote:
> Of course, all target packages should have this new 'skeleton' package
> in their dependencies.

 Actually for the first patch I think it is better to replace

$(TARGET_DIR): $(BUILD_DIR)/.root

with

$(TARGET_DIR): rootfs-dirs


 Moving this to the pkg-generic infrastructure is better done in a follow-up
patch. IMHO.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
