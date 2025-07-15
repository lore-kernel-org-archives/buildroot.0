Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622C3C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C8E361210;
	Thu, 17 Jul 2025 20:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvf2yRC-9D72; Thu, 17 Jul 2025 20:33:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2243460E07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2243460E07;
	Thu, 17 Jul 2025 20:33:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07B50A59
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B014241140
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKpjKaWn4qy9 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E6EA41151
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E6EA41151
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C96286673; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 22:58:42 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 65a8824c260979384eeae32f93e53593e0ef71c3
X-Git-Newrev: e99cfb81cb83ea74959a129532e6f78a21654282
X-Patchwork-Hint: ignore
Message-Id: <20250717203256.6C96286673@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libxml2: add
 patch for CVE-2025-49794 & CVE-2025-49796
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e99cfb81cb83ea74959a129532e6f78a21654282
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This patch fixes CVE-2025-49794 [1] and CVE-2025-49796 [2] by
backporting the commit from [3] to libxml2 2.13.

[1] https://nvd.nist.gov/vuln/detail/cve-2025-49794
[2] https://nvd.nist.gov/vuln/detail/cve-2025-49796
[3] https://gitlab.gnome.org/GNOME/libxml2/-/commit/71e1e8af5ee46dad1b57bb96cfbf1c3ad21fbd7b

Signed-off-by: Tim Soubry <tim.soubry@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0df4585100358976434238cc64825cfbc505fc02)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...Fix-memory-safety-issues-in-xmlSchematron.patch | 186 +++++++++++++++++++++
 package/libxml2/libxml2.mk                         |   3 +
 2 files changed, 189 insertions(+)

diff --git a/package/libxml2/0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch b/package/libxml2/0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
new file mode 100644
index 0000000000..1aadf4d3bc
--- /dev/null
+++ b/package/libxml2/0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
@@ -0,0 +1,186 @@
+From a89ed49b681fb4299120154ce0d6ca38e9abe482 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Fri, 4 Jul 2025 14:28:26 +0200
+Subject: [PATCH] schematron: Fix memory safety issues in
+ xmlSchematronReportOutput
+
+Fix use-after-free (CVE-2025-49794) and type confusion (CVE-2025-49796)
+in xmlSchematronReportOutput.
+
+Fixes #931.
+Fixes #933.
+
+Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/71e1e8af5ee46dad1b57bb96cfbf1c3ad21fbd7b
+CVE: CVE-2025-49794 CVE-2025-49796
+Signed-off-by: Tim Soubry <tim.soubry@mind.be>
+---
+ result/schematron/cve-2025-49794_0.err |  2 ++
+ result/schematron/cve-2025-49796_0.err |  2 ++
+ schematron.c                           | 49 ++++++++++++++------------
+ test/schematron/cve-2025-49794.sct     | 10 ++++++
+ test/schematron/cve-2025-49794_0.xml   |  6 ++++
+ test/schematron/cve-2025-49796.sct     |  9 +++++
+ test/schematron/cve-2025-49796_0.xml   |  3 ++
+ 7 files changed, 58 insertions(+), 23 deletions(-)
+ create mode 100644 result/schematron/cve-2025-49794_0.err
+ create mode 100644 result/schematron/cve-2025-49796_0.err
+ create mode 100644 test/schematron/cve-2025-49794.sct
+ create mode 100644 test/schematron/cve-2025-49794_0.xml
+ create mode 100644 test/schematron/cve-2025-49796.sct
+ create mode 100644 test/schematron/cve-2025-49796_0.xml
+
+diff --git a/result/schematron/cve-2025-49794_0.err b/result/schematron/cve-2025-49794_0.err
+new file mode 100644
+index 00000000..57752310
+--- /dev/null
++++ b/result/schematron/cve-2025-49794_0.err
+@@ -0,0 +1,2 @@
++./test/schematron/cve-2025-49794_0.xml:2: element boo0: schematron error : /librar0/boo0 line 2:  
++./test/schematron/cve-2025-49794_0.xml fails to validate
+diff --git a/result/schematron/cve-2025-49796_0.err b/result/schematron/cve-2025-49796_0.err
+new file mode 100644
+index 00000000..bf875ee0
+--- /dev/null
++++ b/result/schematron/cve-2025-49796_0.err
+@@ -0,0 +1,2 @@
++./test/schematron/cve-2025-49796_0.xml:2: element boo0: schematron error : /librar0/boo0 line 2:  
++./test/schematron/cve-2025-49796_0.xml fails to validate
+diff --git a/schematron.c b/schematron.c
+index 1de25deb..426300c8 100644
+--- a/schematron.c
++++ b/schematron.c
+@@ -1414,27 +1414,15 @@ exit:
+  *                                                                      *
+  ************************************************************************/
+ 
+-static xmlNodePtr
++static xmlXPathObjectPtr
+ xmlSchematronGetNode(xmlSchematronValidCtxtPtr ctxt,
+                      xmlNodePtr cur, const xmlChar *xpath) {
+-    xmlNodePtr node = NULL;
+-    xmlXPathObjectPtr ret;
+-
+     if ((ctxt == NULL) || (cur == NULL) || (xpath == NULL))
+         return(NULL);
+ 
+     ctxt->xctxt->doc = cur->doc;
+     ctxt->xctxt->node = cur;
+-    ret = xmlXPathEval(xpath, ctxt->xctxt);
+-    if (ret == NULL)
+-        return(NULL);
+-
+-    if ((ret->type == XPATH_NODESET) &&
+-        (ret->nodesetval != NULL) && (ret->nodesetval->nodeNr > 0))
+-        node = ret->nodesetval->nodeTab[0];
+-
+-    xmlXPathFreeObject(ret);
+-    return(node);
++    return(xmlXPathEval(xpath, ctxt->xctxt));
+ }
+ 
+ /**
+@@ -1480,25 +1468,40 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr ctxt,
+             (child->type == XML_CDATA_SECTION_NODE))
+             ret = xmlStrcat(ret, child->content);
+         else if (IS_SCHEMATRON(child, "name")) {
++            xmlXPathObject *obj = NULL;
+             xmlChar *path;
+ 
+             path = xmlGetNoNsProp(child, BAD_CAST "path");
+ 
+             node = cur;
+             if (path != NULL) {
+-                node = xmlSchematronGetNode(ctxt, cur, path);
+-                if (node == NULL)
+-                    node = cur;
++                obj = xmlSchematronGetNode(ctxt, cur, path);
++                if ((obj != NULL) &&
++                    (obj->type == XPATH_NODESET) &&
++                    (obj->nodesetval != NULL) &&
++                    (obj->nodesetval->nodeNr > 0))
++                    node = obj->nodesetval->nodeTab[0];
+                 xmlFree(path);
+             }
+ 
+-            if ((node->ns == NULL) || (node->ns->prefix == NULL))
+-                ret = xmlStrcat(ret, node->name);
+-            else {
+-                ret = xmlStrcat(ret, node->ns->prefix);
+-                ret = xmlStrcat(ret, BAD_CAST ":");
+-                ret = xmlStrcat(ret, node->name);
++            switch (node->type) {
++                case XML_ELEMENT_NODE:
++                case XML_ATTRIBUTE_NODE:
++                    if ((node->ns == NULL) || (node->ns->prefix == NULL))
++                        ret = xmlStrcat(ret, node->name);
++                    else {
++                        ret = xmlStrcat(ret, node->ns->prefix);
++                        ret = xmlStrcat(ret, BAD_CAST ":");
++                        ret = xmlStrcat(ret, node->name);
++                    }
++                    break;
++
++                /* TODO: handle other node types */
++                default:
++                    break;
+             }
++
++            xmlXPathFreeObject(obj);
+         } else if (IS_SCHEMATRON(child, "value-of")) {
+             xmlChar *select;
+             xmlXPathObjectPtr eval;
+diff --git a/test/schematron/cve-2025-49794.sct b/test/schematron/cve-2025-49794.sct
+new file mode 100644
+index 00000000..7fc9ee3d
+--- /dev/null
++++ b/test/schematron/cve-2025-49794.sct
+@@ -0,0 +1,10 @@
++<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
++    <sch:pattern id="">
++        <sch:rule context="boo0">
++            <sch:report test="not(0)">
++                <sch:name path="&#9;e|namespace::*|e"/>
++            </sch:report>
++            <sch:report test="0"></sch:report>
++        </sch:rule>
++    </sch:pattern>
++</sch:schema>
+diff --git a/test/schematron/cve-2025-49794_0.xml b/test/schematron/cve-2025-49794_0.xml
+new file mode 100644
+index 00000000..debc64ba
+--- /dev/null
++++ b/test/schematron/cve-2025-49794_0.xml
+@@ -0,0 +1,6 @@
++<librar0>
++    <boo0 t="">
++        <author></author>
++    </boo0>
++    <ins></ins>
++</librar0>
+diff --git a/test/schematron/cve-2025-49796.sct b/test/schematron/cve-2025-49796.sct
+new file mode 100644
+index 00000000..e9702d75
+--- /dev/null
++++ b/test/schematron/cve-2025-49796.sct
+@@ -0,0 +1,9 @@
++<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
++    <sch:pattern id="">
++        <sch:rule context="boo0">
++            <sch:report test="not(0)">
++                <sch:name path="/"/>
++            </sch:report>
++        </sch:rule>
++    </sch:pattern>
++</sch:schema>
+diff --git a/test/schematron/cve-2025-49796_0.xml b/test/schematron/cve-2025-49796_0.xml
+new file mode 100644
+index 00000000..be33c4ec
+--- /dev/null
++++ b/test/schematron/cve-2025-49796_0.xml
+@@ -0,0 +1,3 @@
++<librar0>
++    <boo0/>
++</librar0>
+-- 
+2.39.5
+
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index f8651e726b..a4373a691a 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -18,6 +18,9 @@ LIBXML2_CONFIG_SCRIPTS = xml2-config
 #0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
 LIBXML2_IGNORE_CVES += CVE-2025-6021
 
+#0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
+LIBXML2_IGNORE_CVES += CVE-2025-49794 CVE-2025-49796
+
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
 LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
