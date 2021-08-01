Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D18C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:38:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 771AF61058
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 771AF61058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FFDC40163;
	Sun,  1 Aug 2021 09:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FH2HoHBRbBLS; Sun,  1 Aug 2021 09:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CC8440172;
	Sun,  1 Aug 2021 09:38:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89AFC1BF8B4
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8676F83ACF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65eCRyXyHPZX for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 09:38:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 242D7836A5
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 09:38:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 39F168A395; Sun,  1 Aug 2021 09:38:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 11:36:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 581687e34b067c8dac06335dbae640a23b9e505c
X-Git-Newrev: 3d61b037392b1972d54cc73abd9498d564c7b89e
X-Patchwork-Hint: ignore
Message-Id: <20210801093845.39F168A395@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rabbitmq-server: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=3d61b037392b1972d54cc73abd9498d564c7b89e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for rabbitmq-server is added by the services/rabbitmq module in
the SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rabbitmq-server/rabbitmq-server.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index c5d3190de9..33c3359429 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -34,6 +34,7 @@ RABBITMQ_SERVER_LICENSE_FILES = \
 	LICENSE-rabbitmq_aws
 RABBITMQ_SERVER_CPE_ID_VENDOR = pivotal_software
 RABBITMQ_SERVER_CPE_ID_PRODUCT = rabbitmq
+RABBITMQ_SERVER_SELINUX_MODULES = rabbitmq
 
 RABBITMQ_SERVER_DEPENDENCIES = host-elixir host-libxslt host-zip erlang libxslt
 RABBITMQ_SERVER_TARGET_BINS = rabbitmq-plugins rabbitmq-server rabbitmqctl rabbitmq-env rabbitmq-defaults
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
