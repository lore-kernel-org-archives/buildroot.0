Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C497C8303C
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 20:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3E7B849CB;
	Tue,  1 Jul 2025 20:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWrZSLXRY8bC; Tue,  1 Jul 2025 20:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A55780F89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A55780F89;
	Tue,  1 Jul 2025 20:50:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89CDB196
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AD13611D2
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okdCynJw7VLv for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 20:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 11692611F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11692611F3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11692611F3
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:50:47 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -58853084; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Jul 2025 20:50:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uWhwA-007I2O-1y;
 Tue, 01 Jul 2025 22:50:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250701161508.1622502-1-peter@korsgaard.com>
 <2dd8987fe43ff772e6e99eb04aca8e29@free.fr>
Date: Tue, 01 Jul 2025 22:50:42 +0200
In-Reply-To: <2dd8987fe43ff772e6e99eb04aca8e29@free.fr> (Julien Olivain's
 message of "Tue, 01 Jul 2025 22:41:55 +0200")
Message-ID: <87plejeiu5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=GCmBIGirOaNFVsI21gGu9JViMBDqiVdquLbW0gn5Gm1pKACYpcaelckAQAxjEdo2Qw99szITnj5tcec5ejCAzHdaT9T0jtsyL/dBaZdOFQVjeZVlLIAYCTgNKdhv4g6Xz6lXkYbvCWaDhHiBhCH23MW/GFR6nhF4FsGwJvD2aEDIpK0vvEhwCybmosWZ36q5/M5ChMy0OIPBONp6trEAmVGEtPDOXVLKrbRuuCBHQelXzSbjbjPd5tXqn24rp0W4WVC0NDpETgJEDEMwaiWFYmpkhN4gWTir5rFgWCQH+sBc3r4fUl1Xcw4RpBdknfrYFoVrNCsesKsRD0akJ9lG6w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=AQ9cuYx+9zWlO4lojjXx501GSlVPzRuAMtmJTSS8iTM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=GCmBIGir
Subject: Re: [Buildroot] [PATCH] package/jose: security bump to version 14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > On 01/07/2025 18:15, Peter Korsgaard wrote:
 >> Jose-13 fixed the following security issue:
 >> - CVE-2023-50967: latchset jose through version 11 allows attackers
 >> to cause
 >> a denial of service (CPU consumption) via a large p2c (aka PBES2
 >> Count)
 >> value.
 >> https://github.com/latchset/jose/issues/151
 >> In addition, jose-14 worked around another DoS issue related to
 >> decompression:
 >> https://github.com/latchset/jose/pull/157
 >> Drop now upstreamed patches:
 >> - 0001-lib-hsh.c-rename-hsh-local-variable.patch: Upstream as of
 >> https://github.com/latchset/jose/commit/3d5b287243f87ce0243b23abd690d86c41fc499c
 >> - 0002-man-add-option-to-skip-building-man-pages.patch: Upstream
 >> after
 >> getting reworked to use -Ddocs=disabled as of
 >> https://github.com/latchset/jose/commit/786b426df018edf30a53e2d82155df20d13047c1
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Applied to master, thanks.

 > For info, I also removed the .checkpackageignore patch entries.

Ups, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
