Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D5ACCD19A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 22:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C7160BC2;
	Sun, 16 Nov 2025 22:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmHZGxrhBH5j; Sun, 16 Nov 2025 22:08:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80C9D60BA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80C9D60BA7;
	Sun, 16 Nov 2025 22:08:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8452D5
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 22:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD656408B2
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 22:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNWSr-XFL-1Z for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 22:08:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D41240659
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D41240659
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D41240659
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 22:08:30 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 445207283; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 16 Nov 2025 22:08:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vKkux-000000015cz-1GbX;
 Sun, 16 Nov 2025 23:08:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org,  Tudor Holton <buildroot@tudorholton.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20251114140519.541039-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Fri, 14 Nov 2025 15:05:19 +0100")
References: <20251114140519.541039-1-thomas@devoogdt.com>
Date: Sun, 16 Nov 2025 23:08:19 +0100
Message-ID: <87346dd418.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=K8QMBltMNoQY1cLYGAKWCAV24edTRB6wmpX6H0fH3bGMfWHFv06rj6U8ynAeMKaS0WDF4FvoLnDF4iMZmBMGA5J3LBoPKJZePEX5JOSZxozW2c3VOEQ6QkX1T9mD5OCIB9jizJOPdd7lHGHZJ+6KAMZH+VfHdI0rYqmmybU6YFWSQdtLDd/jkEyn16G4nXv/t6I/7ZS3krTqrXMz571S+0abwTkpRf8VFcJfFY6K/RsmDGhw6fAUD7JqfuGIdLgFjS2JPwDJ7OP7zpCCkHQ8XnG9HwMvlSqn0gWU+p4L8iZFdPpn4Ne9wycmSJw5x4x896s0/ALEeH++e8oNTq2Kwg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=GP7Hn/wxd4N+TW6/RmXxfjwHdhOuWy653P1Hdudl3Pc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=K8QMBltM
Subject: Re: [Buildroot] [PATCH] package/openjdk{,
 -bin}: fix wrong version reporting
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

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 > Before:

 > $ java --version
 > openjdk 17 2024-07-16
 > OpenJDK Runtime Environment (build 17+17)
 > OpenJDK 64-Bit Server VM (build 17+17, mixed mode)

 > After:

 > $ java --version
 > openjdk 17.0.12 2024-07-16
 > OpenJDK Runtime Environment (build 17.0.12+7)
 > OpenJDK 64-Bit Server VM (build 17.0.12+7, mixed mode)

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
