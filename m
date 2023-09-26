Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49390E7D24C
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 08:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 035AF817FD;
	Tue, 26 Sep 2023 08:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 035AF817FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0DV4pq7R-zP; Tue, 26 Sep 2023 08:06:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33F87817E4;
	Tue, 26 Sep 2023 08:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33F87817E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7734A1BF33A
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 08:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51B45417BE
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 08:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51B45417BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vI0w24FQ2P_M for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 08:06:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B397417C1
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 08:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B397417C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42D8387842; Tue, 26 Sep 2023 08:06:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 09:55:16 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 335dbb595ab027b3a46a4fd764e93c1dc9d31e56
X-Git-Newrev: 175260e1e7ba60d4a427d3bf52a0fb342011d530
X-Patchwork-Hint: ignore
Message-Id: <20230926080604.42D8387842@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] docs/manual: add section
 to explain how to give credits to a sponsor
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=175260e1e7ba60d4a427d3bf52a0fb342011d530
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Sometimes it happens that a Company or a Physical Person sponsors the
creation and/or the upstreaming process of a patch, but at the moment
there is no way to give credits to it. In Linux they prepend '+sponsor'
to the e-mail of the contributor in both authorship and commit log tag as
discussed here[0]. So let's describe in the manual how to do that as a
standard.

[0]: https://lore.kernel.org/linux-doc/20230817220957.41582-1-giulio.benetti@benettiengineering.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998@free.fr:
  - reword to reference sub-addressing and the RFC
  - move to the "submitting patches" section, that already deals with
    SoB tags
  - differentiate between Your/Their names
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit de349df08c653a822166f94dbe01295a5a3cfa6e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 94f1c64496..15fe36aef0 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -247,6 +247,23 @@ which have the upstream license), and that you are allowed to do so.
 See http://developercertificate.org/[the Developer Certificate of
 Origin] for details.
 
+To give credits to who sponsored the creation of a patch or the process of
+upstreaming it, you may use
+https://datatracker.ietf.org/doc/html/rfc5233[email subaddressing] for
+your git identity (i.e. what is used as commit author and email +From:+
+field, as well as your Signed-off-by tag); add suffix to the local part,
+separated from it by a plus `+` sign. E.g.:
+
+* for a company which sponsored the submitted work, use the company name
+  as the detail (suffix) part:
++
+`Your-Name Your-Surname <your-name.your-surname+companyname@mail.com>`
+
+* for an individual who sponsored who sponsored the submitted work, use
+  their name and surname:
++
+`Your-Name Your-Surname <your-name.your-surname+their-name.their-surname@mail.com>`
+
 When adding new packages, you should submit every package in a
 separate patch. This patch should have the update to
 +package/Config.in+, the package +Config.in+ file, the +.mk+ file, the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
