From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Apr 2015 22:57:22 +0200
Subject: [Buildroot] [PATCH] python: Allow pyo only and variants
In-Reply-To: <20150426190620.4647bb75@free-electrons.com>
References: <1430065819-12745-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20150426190620.4647bb75@free-electrons.com>
Message-ID: <553FF432.107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/26/15 19:06, Thomas Petazzoni wrote:
> I'm sure we can do something smarter here.
> 
> # arg1: extension of files to remove
> define PYTHON_FINALIZE_REMOVE_HELPER
> 	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.$(1)' -print0 | xargs -0 rm -f
> endef
> 
> ifeq ($(BR2_PACKAGE_PYTHON_REMOVE_PY),y)
> 	$(call PYTHON_FINALIZE_REMOVE_HELPER,py)
> endif
> 
> ifeq ($(BR2_PACKAGE_PYTHON_REMOVE_PYC),y)
> 	$(call PYTHON_FINALIZE_REMOVE_HELPER,pyc)
> endif
> 
> ifeq ($(BR2_PACKAGE_PYTHON_REMOVE_PYO),y)
> 	$(call PYTHON_FINALIZE_REMOVE_HELPER,pyo)
> endif
> 
> BR2_PACKAGE_PYTHON_REMOVE_* being hidden Config.in options.

 Or make these options the public ones instead of having the huge choice.

 Requires legacy handling of course.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
