From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 10:18:36 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/harfbuzz: fix build without
 cairo-svg
In-Reply-To: <20190624080843.jbxgstrn3erbelbz@sapphire.tkos.co.il> (Baruch
 Siach's message of "Mon, 24 Jun 2019 11:08:43 +0300")
References: <20190623190309.61714-1-james.hilliard1@gmail.com>
 <20190624061305.62a4e523@windsurf> <87zhm78ovv.fsf@dell.be.48ers.dk>
 <20190624065049.absi6hqkc73cskzt@sapphire.tkos.co.il>
 <CADvTj4qnHqzxQt7XRocMaaSL82j1gvBQ-VG3F1Gk9OLwcF6qgw@mail.gmail.com>
 <87v9wv8mpy.fsf@dell.be.48ers.dk>
 <20190624080843.jbxgstrn3erbelbz@sapphire.tkos.co.il>
Message-ID: <87r27j8kgz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Mon, Jun 24, 2019 at 09:30:01AM +0200, Peter Korsgaard wrote:
 >> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
 >> 
 >> >> > This confuses me. We recently changed harfbuzz to only enable cairo
 >> >> > support if cairo-svg is enabled, and now this patch adds an
 >> >> > unconditional include of <cairo.h>?
 >> >> 
 >> >> As I understand cairo has already been an optional dependency of harfbuzz, so
 >> >> the unconditional cairo.h include should not be a problem. This patch makes
 >> >> cairo-svg.h include depend on '!defined(HB_NO_COLOR) &&
 >> >> defined(CAIRO_HAS_SVG_SURFACE)'.
 >> > Yeah, that sounds right, more details here:
 >> > https://github.com/harfbuzz/harfbuzz/pull/1788
 >> 
 >> Sorry, I still don't get it.
 >> 
 >> test-ot-color.cc only gets built if cairo support is enabled:
 >> 
 >> if HAVE_FREETYPE
 >> if HAVE_CAIRO_FT
 >> noinst_PROGRAMS += test-ot-color
 >> 
 >> So with the two harfbuzz patches we only end up here if cairo +
 >> cairo-svg is enabled, so I don't see what this patch fixes.
 >> 
 >> Unless the intention is to drop commit ced273e4f1 (package/harfbuzz: fix
 >> build with cairo)?

 > Yes. Commit de8094925ee reverts commit ced273e4f1a0, and adds the patch.

Gaah, I really wonder how I missed that. Ok, it would have been great if
the commit message would have explained it, but oh well.

Sorry for the noise.

-- 
Bye, Peter Korsgaard
