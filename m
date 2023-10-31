Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27831C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 10:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC5FD83595;
	Tue, 31 Oct 2023 10:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC5FD83595
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kdzycxn1LJYp; Tue, 31 Oct 2023 10:22:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB5A180E38;
	Tue, 31 Oct 2023 10:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB5A180E38
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42A831BF321
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 10:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BF776129F
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 10:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF776129F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_8HhabrNmyl for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 10:22:23 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01A966129E
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 10:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01A966129E
Received: from unknown (HELO opfedv3rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 11:22:21 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 Oct 2023 11:22:19 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 11:22:17 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 31 Oct 2023 11:22:17 +0100
X-IronPort-AV: E=Sophos;i="6.03,265,1694728800"; d="scan'208";a="59898079"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 31 Oct 2023 11:22:16 +0100
Message-ID: <68133ee58ba7da20be579110a95d6413a49c4049.1698747732.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698747732.git.yann.morin@orange.com>
References: <cover.1698747732.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX405.corporate.adroot.infra.ftgroup
 (10.115.27.14) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1698747744; x=1730283744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4bxrRWUAr4chrb88IJaHcVa84Y5PmD+i4FHIQndV1IE=;
 b=K/NjJd6HzR9D+igncE+4RJiuz+xWxjhKpPRk2UBnNNte/ZcHgqGiSds4
 l9hP+YUb6zD58OcRha+0MJBsHIKzfoH6eqILvkajbZQKsgaTg+e52QaA1
 uIIhHmA5AFAZ3R8ZCgQTeEbpYhYFxpNnif9RRAiRMEYKNOuqrzKLVekGO
 r40mqd/B8Q4v39umOKEubWE7NnZai55Kn/xCy9mlmKn6qQJ1kAZGXZBf5
 Imt7FOpZvi/2ACSNPzDJ06TBtuViRmgwue1qFIluS1T8WrNP2nGOGCPBU
 ZANEN4kNs+9jdHE9/oAsRj/Oh0DI99vNfPUibd4Zsk9qKy+V3O3t1W5Kd
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=K/NjJd6H
Subject: [Buildroot] [PATCH 1/2] utils/docker: use host's network setup
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
Cc: yann.morin@orange.com,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Our utils/docker-run wrapper is needed to provide a reproducible build
environment: tools, variables, etc... but is not meant for isolation. As
such, we do not care what the network configuration is used.

In some settings (e.g. enterprise networks), it is often the case that a
VPN is in use, especially in those wonderful times of widespread remote
work.

Letting Docker decide on the network setup, will most usually lead to it
creating a private network that is NATed onto the principal network
interface, leading to non-functional network in the container when a VPN
is in use.

As such, always use the host network configuration, and do not let
Docker create a private network for the container.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
---
 utils/docker-run | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/docker-run b/utils/docker-run
index 848e9b3840..464cbf691f 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -21,6 +21,7 @@ declare -a docker_opts=(
     --user "$(id -u):$(id -g)"
     --workdir "$(pwd)"
     --security-opt label=disable
+    --network host
 )
 
 declare -a mountpoints=(
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
