Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D110C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA4DD8411F;
	Mon, 21 Mar 2022 16:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7mZtME8548B; Mon, 21 Mar 2022 16:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDA798412B;
	Mon, 21 Mar 2022 16:55:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94E251BF2B1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8129C828AF
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sp8d73Ls4fTe for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:54:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7ECB8284B
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:54:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CAA1784AE9; Mon, 21 Mar 2022 16:46:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:43:33 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 0b414e0fd9d161d605dec4508f891ad356997694
X-Git-Newrev: 543187098e61189d34444e53aefbad4c80efc227
X-Patchwork-Hint: ignore
Message-Id: <20220321164603.CAA1784AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/timescaledb: bump
 version to 2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=543187098e61189d34444e53aefbad4c80efc227
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Remove all PG13 upstream patches.

Release notes: https://github.com/timescale/timescaledb/releases/tag/2.1.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit db547e8b79a73d6766bec7523182ade58d79ad3e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Allow-building-against-PG13-source.patch  |  85 ----
 ...bilty-wrapper-functions-for-base64-encodi.patch |  73 ----
 .../0003-Add-missing-utils-acl.h-includes.patch    | 149 -------
 ...-Add-support-for-PG13-List-implementation.patch | 473 ---------------------
 ...005-Adjust-code-to-PG13-list-sort-changes.patch |  59 ---
 ...t-copy-code-to-PG13-addRTEtoQuery-changes.patch |  37 --
 ...-to-PG13-convert_tuples_by_name-signature.patch |  65 ---
 ...ust-code-to-PG13-tuple-conversion-changes.patch | 259 -----------
 ...just-hypertable-expansion-to-PG13-changes.patch |  88 ----
 ...just-decompress-code-to-Var-field-renames.patch |  41 --
 .../0011-Adjust-jsonb_utils-to-PG13-changes.patch  |  39 --
 ...ndle-AT_DropExpression-in-process_utility.patch |  48 ---
 .../0013-Adjust-copy-code-to-PG13-changes.patch    |  34 --
 ...de-to-PG13-command-completion-tag-changes.patch | 186 --------
 ...-copy-to-PG13-HEAP_INSERT_SKIP_WAL-change.patch |  51 ---
 ...ner-code-to-PG13-planner_hook-signature-c.patch |  58 ---
 ...17-Adjust-code-to-deparse_context-changes.patch |  34 --
 package/timescaledb/0018-Update-compat.h.patch     |  27 --
 ...19-Adjust-code-to-PG13-tuptoaster-changes.patch |  70 ---
 package/timescaledb/timescaledb.hash               |   2 +-
 package/timescaledb/timescaledb.mk                 |   2 +-
 21 files changed, 2 insertions(+), 1878 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
