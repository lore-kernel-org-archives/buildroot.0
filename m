Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB3CCCF9E9
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 18:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 876E0408A7;
	Sat, 25 Oct 2025 18:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9tj4GydV3Dv; Sat, 25 Oct 2025 18:32:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0B0540861
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0B0540861;
	Sat, 25 Oct 2025 18:32:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EADEE976
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 18:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC9364009A;
 Sat, 25 Oct 2025 18:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjDBc1pjkqCR; Sat, 25 Oct 2025 18:32:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.184.2.64;
 helo=mx1a.swcp.com; envelope-from=hudson@swcp.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 892644004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 892644004D
Received: from mx1a.swcp.com (mx1a.swcp.com [216.184.2.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 892644004D
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 18:32:16 +0000 (UTC)
Received: from ame3.swcp.com (ame3.swcp.com [216.184.2.120])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 59PIWFgm002477
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 12:32:15 -0600
Received-SPF: pass (ame3.swcp.com: domain of hudson@swcp.com designates
 216.184.2.83 as permitted sender) receiver=ame3.swcp.com;
 client-ip=216.184.2.83; helo=hachi.swcp.com; envelope-from=hudson@swcp.com;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
DKIM-Filter: OpenDKIM Filter v2.10.3 ame3.swcp.com 59PIWD9Q045476
Received: from hachi.swcp.com (hachi.swcp.com [216.184.2.83])
 by ame3.swcp.com (8.17.2/8.17.1) with ESMTPS id 59PIWD9Q045476
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 12:32:13 -0600 (MDT)
 (envelope-from hudson@swcp.com)
Received: from hachi.swcp.com (localhost [127.0.0.1])
 by hachi.swcp.com (8.17.1.9/8.17.1.9/Debian-2+deb12u2) with ESMTP id
 59PIWC853611758
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 12:32:12 -0600
Received: (from hudson@localhost)
 by hachi.swcp.com (8.17.1.9/8.17.1.9/Submit) id 59PIWBID3611757
 for buildroot@buildroot.org; Sat, 25 Oct 2025 12:32:11 -0600
Date: Sat, 25 Oct 2025 12:32:11 -0600
To: buildroot@buildroot.org
Message-ID: <aP0Xq3WctC6mB2fF@hachi.swcp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OcMPUIl--F-9@trmm.net>
X-Scanned-By: MIMEDefang 2.86
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.4
 (ame3.swcp.com [216.184.2.127]); Sat, 25 Oct 2025 12:32:13 -0600 (MDT)
X-Virus-Scanned: clamav-milter 1.2.1 at ame3
X-Virus-Status: Clean
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=trmm.net
Subject: Re: [Buildroot] package/mosquitto patch problem with gmake < 4.3
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
From: Trammell Hudson via buildroot <buildroot@buildroot.org>
Reply-To: Trammell Hudson <hudson@trmm.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It looks like the -lanl test was solved in the upstream mosquitto without
including any headers, so their upcoming 2.1.0 version does not cause
the problem with older gmake:

https://github.com/eclipse-mosquitto/mosquitto/commit/9be6f9a409585b579efa4002c7a5da26ae6a996a#diff-02ffa64880a3e0c0e7d284d6e86512af1c93edff5c9fb91d2112a54a1f5bd8d4

Does that seem like a reasonable test or would it make sense to use the
workaround proposed by the gnu make change notes?

--- mosquitto-2.0.22/config.mk.orig	2025-10-25 18:10:31.443956868 +0000
+++ mosquitto-2.0.22/config.mk	2025-10-25 18:10:57.115884412 +0000
@@ -318,8 +318,12 @@
 endif
 
 ifeq ($(WITH_ADNS),yes)
-	BROKER_LDADD:=$(BROKER_LDADD) -lanl
 	BROKER_CPPFLAGS:=$(BROKER_CPPFLAGS) -DWITH_ADNS
+	HASH := \#
+	NEED_LIBANL := $(shell printf '$(HASH)include <stdlib.h>\n$(HASH)include <netdb.h>\nint main(){return getaddrinfo_a(0, NULL, 0, NULL);}'| $(CC) -D_GNU_SOURCE -o /dev/null -x c - 2>/dev/null || echo YES)
+	ifeq ($(NEED_LIBANL),YES)
+		BROKER_LDADD:=$(BROKER_LDADD) -lanl
+	endif
 endif
 
 ifeq ($(WITH_CONTROL),yes)

I also did a quick grep through the various makefiles and config.mk in the
other packages and do not see any problematic uses of # in make functions.
busybox explicitly handles it by defining C:=\# in Makefile.flags to avoid
older gmake problems.

-- 
Trammell
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
