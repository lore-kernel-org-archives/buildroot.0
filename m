Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E82C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 12:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F3FC40B31;
	Thu, 17 Mar 2022 12:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n8nSdAyPS7YH; Thu, 17 Mar 2022 12:10:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1B9640136;
	Thu, 17 Mar 2022 12:10:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 656351C113E
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FAA54046D
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIClhfW1LgRj for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 12:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 503A84046A
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 12:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BC14084370; Thu, 17 Mar 2022 12:01:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 08:48:15 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: f22eb3abec86226135141c31374e8a19c7bdb2b1
X-Git-Newrev: cdfaeebab3b89ca22352ec1706c44c35adf85ff9
X-Patchwork-Hint: ignore
Message-Id: <20220317120131.BC14084370@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] docs: fix links to
 AsciiDoc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6916937774142289601=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6916937774142289601==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cdfaeebab3b89ca22352ec1706c44c35adf85ff9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Links were aimed at the methods.co.nz domain, which is now returning
404s. The current situation of AsciiDoc is unclear to me: the Fedora
package points to this website, they own asciidoc.org, Wikipedia points
to this project as well but their Git repo's README includes the
following paragraph:

> AsciiDoc.py is a legacy processor for this syntax, handling an older
> rendition of AsciiDoc. As such, this will not properly handle the
> current AsciiDoc specification. It is suggested that unless you
> specifically require the AsciiDoc.py toolchain, you should find a
> processor that handles the modern AsciiDoc syntax.

https://github.com/asciidoc-py/asciidoc-py/blob/10.1.3/README.md

"AsciiDoc specification" pointing towards:
https://projects.eclipse.org/projects/asciidoc.asciidoc-lang

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit efcb7eeabc22df47ca09e69c99f73e9183ed6cf3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/conf/asciidoc-text.conf  | 2 +-
 docs/manual/writing-rules.txt | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/conf/asciidoc-text.conf b/docs/conf/asciidoc-text.conf
index 470bdecfc2..bb614b9d85 100644
--- a/docs/conf/asciidoc-text.conf
+++ b/docs/conf/asciidoc-text.conf
@@ -1,5 +1,5 @@
 # Refer to following asciidoc documentation:
-#     http://www.methods.co.nz/asciidoc/userguide.html
+#     https://asciidoc-py.github.io/userguide.html
 # In particular sections "Macros" and "Attribute References"
 #
 # For hyperlinks, show 'link text [URL]' (if link text provided) or 'URL'
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 7e2b5f909c..e01e3f02a1 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -201,10 +201,10 @@ https://github.com/pengutronix/genimage/blob/master/README.rst[].
 === The documentation
 
 The documentation uses the
-http://www.methods.co.nz/asciidoc/[asciidoc] format.
+https://asciidoc-py.github.io/[asciidoc] format.
 
 For further details about the asciidoc syntax, refer to
-http://www.methods.co.nz/asciidoc/userguide.html[].
+https://asciidoc-py.github.io/userguide.html[].
 
 === Support scripts
 

--===============6916937774142289601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6916937774142289601==--
