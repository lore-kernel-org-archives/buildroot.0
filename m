From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:16:07 +0200
Subject: [Buildroot] [git commit] gst1-plugins-base: remove legacy
	freetype handling
In-Reply-To: <20170406204348.7CAA97FCED@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 6 Apr 2017 22:43:40 +0200")
References: <20170406204348.7CAA97FCED@busybox.osuosl.org>
Message-ID: <8760htzkeg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=80e2a5465880965b93d3647ca96f4af5f55252c4
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > In 2010 commit 32d319e6f "gst-plugins-base: ensure <stdint.h> is used"
 > introduced a typo (missing backslash) that made the code ineffective.

 > In 2013 commit f8e7fdcd3 "gst1-plugins-base: add gstreamer1 base
 > plugins" copied the code.

 > It can be confirmed by looking at the output of:
 > $ make printvars | grep '^GST1_PLUGINS_BASE_CONF_ENV\|^FT2_CONFIG'
 > FT2_CONFIG=/bin/false ac_cv_header_stdint_t="stdint.h"
 > GST1_PLUGINS_BASE_CONF_ENV=

 > Direct use of freetype was dropped in version 1.7.2 by upstream [1], so
 > remove the code instead of fixing it.

 > Found using [2]:
 > check-package --include-only Indent $(find * -type f)
 > and manually removed.

 > [1] https://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=183610c035dd6955c9b3540b940aec50474af031
 > [2] http://patchwork.ozlabs.org/patch/729669/

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
