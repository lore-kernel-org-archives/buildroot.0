From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Mar 2014 08:03:37 +0100
Subject: [Buildroot] Patchwork cleanup #7: triaging proposal
In-Reply-To: <CAAXf6LWP0FX4AAGP_ACZHgoxEAEwarpEdHchukxE+V=WJnXROg@mail.gmail.com>
References: <CAAXf6LWP0FX4AAGP_ACZHgoxEAEwarpEdHchukxE+V=WJnXROg@mail.gmail.com>
Message-ID: <53269E49.3060504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/14 08:48, Thomas De Schampheleire wrote:
> [v2] Standardisation of $(BUILD)/.root name
> http://patchwork.ozlabs.org/patch/265680/

 Vote B: Reject

 This patch moves $(BUILD_DIR)/.root to
$(STAMP_DIR)/skeleton-target-installed, but since the migration of
toolchains to the package infrastructure, the $(STAMP_DIR) is no longer
used (and in fact should be removed).

 While I'm not a big fan of $(BUILD_DIR)/.root, I don't think that moving
it to the now-unused $(STAMP_DIR) is a good idea.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
