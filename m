Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682C2EB64DD
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 12:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB99740BAD;
	Wed,  5 Jul 2023 12:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB99740BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpXQljPO-Chd; Wed,  5 Jul 2023 12:18:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE78240BD3;
	Wed,  5 Jul 2023 12:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE78240BD3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 557881BF28E
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 12:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 391DA80BBC
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 12:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 391DA80BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fTQdxOkZdUNq for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 12:18:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A22F80BB4
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A22F80BB4
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 12:18:29 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 14:11:19 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jul 2023 14:11:19 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 14:11:16 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Wed, 05 Jul 2023 14:11:14 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.01,182,1684792800"; d="scan'208";a="10788011"
To: <buildroot@buildroot.org>
Date: Wed, 5 Jul 2023 14:11:12 +0200
Message-ID: <433cc34919bd96a053d76c68711c418ca8f2f69b.1688559056.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688559056.git.yann.morin@orange.com>
References: <cover.1688559056.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1688559512; x=1720095512;
 h=to:cc:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:from;
 bh=FErzszcILUhGd7NR5+6sAqw03wcyRvv6W8tp0d2wbHQ=;
 b=OVemqOZYMX5p0rVAktV3zopAcMXj1XKX5amKiD0tzFj2uwzfd3AG6Jjb
 6Nt2pzM2B47UWD3D3jOG140I5r9AZSYA+bVnOlNhuBgH9xir00V/xR8Pr
 nV+l3Np5+kWeKB7J2Vz9PWIwhBLycJgmaCo7oL88zAwrIbCIGHcPFrihD
 b396t12mbNK2jaQ9wsYUYU4WZH0TZaZmC155IR7Io5rZPZln3b/3YT+Kq
 CO7BcHNpyxWr4i5wkjueNuuPuNAdYREro7izsjx66eQQmNfqCC+8QwWfO
 /h7mC0i8qdgIXiLUoqwhzPJ2S9JnyG6y4mQkVstwZwaiUNmWdQmpgkJzv
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=OVemqOZY
Subject: [Buildroot] [PATCH 1/3] support/download: fix shellcheck errors in
 svn backend
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
Cc: yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bizarrely enough, the unquoted expansion of ${quiet} does not trigger
any warning from shellcheck, so we do not add any exception for it.

${SVN} can contain more than one item, but we don't care about splitting
on spaces when we just print it for debug, so we can just quote it
rather than add an exception.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 support/download/svn | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/download/svn b/support/download/svn
index b23b7773d3..d9325b7478 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -20,6 +20,7 @@ set -e
 # Environment:
 #   SVN      : the svn command to call
 
+# shellcheck disable=SC1090 # Only provides mk_tar_gz()
 . "${0%/*}/helpers"
 
 quiet=
@@ -41,12 +42,13 @@ shift $((OPTIND-1)) # Get rid of our options
 # being expanded a second time (in case there are spaces in them)
 _svn() {
     if [ -z "${quiet}" ]; then
-        printf '%s ' ${SVN} "${@}"; printf '\n'
+        printf '%s ' "${SVN}" "${@}"; printf '\n'
     fi
     _plain_svn "$@"
 }
 # Note: please keep command below aligned with what is printed above
 _plain_svn() {
+    # shellcheck disable=SC2086 # We want word-splitting for SVN
     eval ${SVN} "${@}"
 }
 
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
