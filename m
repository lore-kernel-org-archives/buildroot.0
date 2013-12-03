From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2013 12:19:53 +0100
Subject: [Buildroot] [git commit] docs/manual: limit the depth of the TOC in
	the HTML output
Message-ID: <20131203112057.27B999B8F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09dea8e8fb92c3b65d303cca14966e24e022e62b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current TOC level is set to 4, which does not mean 'a 4-level deep TOC',
but really means 'a TOC deep to the 4th level', with the first level being
level 0, which means we have:

    12. Appendix
        12.1. Makedev syntax documentation
        12.2. Makeuser syntax documentation
        12.3. Partition table layout description syntax
            12.3.1. The global section
                Properties for the global section

Which a bit too much. And yet, the fifth level is not shown, since we
don't have any! :-/

Limit the depth of the TOC to three levels, which is just enough to be
usefull, yet not cluttered by low-level titles.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index aeafd10..0926566 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -72,8 +72,8 @@ endef
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 ################################################################################
 define GENDOC
-$(call GENDOC_INNER,$(1),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 4")
-$(call GENDOC_INNER,$(1),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 4")
+$(call GENDOC_INNER,$(1),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
+$(call GENDOC_INNER,$(1),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
 $(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
 $(call GENDOC_INNER,$(1),text,text,text,text)
 $(call GENDOC_INNER,$(1),epub,epub,epub,ePUB)
