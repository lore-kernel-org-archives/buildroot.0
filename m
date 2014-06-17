From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 17 Jun 2014 15:46:43 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-06-16
In-Reply-To: <20140617063016.0CF6C1010D3@stock.ovh.net>
References: <20140617063016.0CF6C1010D3@stock.ovh.net>
Message-ID: <CAMo8Bf+7XJ+X5fLihmj5hrZZJzGtOkX1niEUgkQGLys+pUFrJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 17, 2014 at 10:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>     xtensa |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/5feca450d70a8de48fa2463e55c9e84db5d755b0/

Doesn't look xtensa-specific, couldn't reproduce it, but looks like
it's missing something like this:

svgtiny: create BUILDDIR before $(BUILDDIR)/src_colors.c

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
--- libsvgtiny-12121/src/Makefile.orig  2014-06-17 15:30:21.765311434 +0400
+++ libsvgtiny-12121/src/Makefile       2014-06-17 15:29:56.569909931 +0400
@@ -3,7 +3,7 @@

 SOURCES := $(SOURCES) $(BUILDDIR)/src_colors.c

-$(BUILDDIR)/src_colors.c: src/colors.gperf
+$(BUILDDIR)/src_colors.c: src/colors.gperf $(BUILDDIR)/stamp
        $(VQ)$(ECHO) "   GPERF: $<"
        $(Q)gperf --output-file=$@.tmp $<
 # Hack for GCC 4.2 compatibility (gperf 3.0.4 solves this properly)


-- 
Thanks.
-- Max
