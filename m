Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC06CA101F
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 15:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E0F24124F;
	Fri, 12 Sep 2025 15:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUei6SmzNrcx; Fri, 12 Sep 2025 15:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B61EE411E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B61EE411E3;
	Fri, 12 Sep 2025 15:28:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B1DB25B
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FF7E60A3F
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8uTCGpfMzNA for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 15:28:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 550C7610A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 550C7610A0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 550C7610A0
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:28:29 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2069901787; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Sep 2025 15:28:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ux5hG-001sBz-0f;
 Fri, 12 Sep 2025 17:28:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250911171334.593571-1-bernd@kuhls.net>
Date: Fri, 12 Sep 2025 17:28:22 +0200
In-Reply-To: <20250911171334.593571-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 11 Sep 2025 19:13:31 +0200")
Message-ID: <87v7ln4rmx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aGU1kK89WEM4D0gP1vR0r1yG1uox9aWOkMQHQitwpymE/wfw00Bk3uTYJUYB9Bbo/l8Ma5eXoLaRSChjLAbzdmFe760R/vIF8+akFKTxXdVJD9vp4kEfpwl2VlGSxfnQuenQdiX+MfTJYeof5MqK0Q2v+GFQ7qk7H5wVuhq79WxJvUUWqQZWHmz5gAyItes2Bpe12LN0U0C6GOt9jajb6hKkBpycHN/PdGAjRFMLqGq/lFAKf3QNArVBDWs0/pu/uTxuk6+ISSxPZMrdAuzCgo3w0UsVaGnnJzXcFMwlD2G6VOWRKfRAs/Reol4TQUV7FpFXmfQW1so0xKBV3dUuhg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=wuZB1RyodnNdsXU59cJKukRgGJxkA4oWZIMolxjoJqo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=aGU1kK89
Subject: Re: [Buildroot] [PATCH v2 1/3] package/kodi: Fix build with curl
 8.16.0
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

 > curl 8.16.0 bumped the enums to long, see
 > https://github.com/curl/curl/pull/18054

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > v2: added note in patch about patch origin (Baruch)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
