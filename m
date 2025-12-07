Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9B5D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 20:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D54760E36;
	Sun,  7 Dec 2025 20:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qS8_2weLG9Ct; Sun,  7 Dec 2025 20:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE09E60BFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765140544;
	bh=GesNYCODo0q+lSGzp48l86lmv45zGk9m2DSCTxZhaNo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LFYZd5ItygkfbnekdHPtNlP8raJo+Fu4ZZsyA2aBNKqmEyGjhWMjozRdiTyxB+kao
	 FTTVBc0I73Sp0u98kiJEnnw8s6Ax30jIc3we1QwAwPNcJgfgL2HhpUyucLevux8uL4
	 2kwKrNrv8Lm70a2RdJ/YUyaYLRFkWLDo1uYFO6P7hraLLHr1HOaNt7hUteGdptNRVi
	 CvUev6v6lQFTbbfHAqPD/NJ9lAd+iD167t2sRHf52nxuKdvKTeueBflEKldX4Qkpbn
	 CQ+FxxFIShOQImKlloLxEVzlME7Czh/C1TW/b5mSjfX52zEZwb8YVV3GdbEICNacev
	 QzZel3foPJXcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE09E60BFC;
	Sun,  7 Dec 2025 20:49:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72F50E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 20:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7102D406F6
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 20:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tc9TsOs4vF2A for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 20:49:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57F7840756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F7840756
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57F7840756
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 20:49:02 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1717273034; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 07 Dec 2025 20:48:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vSLgd-00000004n25-38Lh;
 Sun, 07 Dec 2025 21:48:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251206085122.437825-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 6 Dec 2025 09:51:22 +0100")
References: <20251206085122.437825-1-bernd@kuhls.net>
Date: Sun, 07 Dec 2025 21:48:55 +0100
Message-ID: <87ecp681c8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=UJgjtQNAkTkwraO+Zgb9+i3IYd8Go4KzL6C5eELHMhAryvj6Z+vNX1HvR2+ehjeG6eH+39y4bAUH2mkzXwARdqAHWJv/Cu+mnk/ba5gPnIYo1WJNjsDJflDxvyi3D33aecnSS9hJZcjT5qt8uihZiENLZk4mNRIjbHYK5fU8Da0F5IQnwkzfXbGyco0Xg7CjYUAEtrggV6dJPj+zCmBhBLL1hC+/aiU+6meAwS7fITbxZd1lgryfZcftaJDL9VZY8t08AT9yxhV9iut1mqYmmcIbX/CVaYOUPCde6cMgwrKHRTr4IIotax9UFAnAJSLtZxjhhTxLddDFT9DEMAFLZg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=locdG2jXJfbCHfluKRUF8H5BaZCzTMEBAZVrWYEGj60=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=UJgjtQNA
Subject: Re: [Buildroot] [PATCH 1/1] package/racehound: switch project site
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Previous repo is unavailable, switch to fork.
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
