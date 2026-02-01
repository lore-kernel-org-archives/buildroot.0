Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F65FE6529D
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FB8E606A7;
	Sun,  1 Feb 2026 20:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DbnR_OlBz3su; Sun,  1 Feb 2026 20:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ABDB606BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978307;
	bh=9yW0E8grhOnY+asWKZ6RuWCVI/RCCEGJjt2aIFFMbos=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F8IKywgA7Sk7HVpaGjPObtUOA8yuTr5jdyj3YrBR5Gr+Uaylrp8/dVmJ5D4+yiMPf
	 ls62QCOt2gurm7fIkGYc/o4gRDGFYboU9+NgqwaHoNArRTTz+6Emfz/5lOo3woAVP/
	 OdefADW7w3K6SBZ/bblP033PXUveXNlAioMpcgQWZBOVtXz9K58g57ROhwAyKE4UCm
	 ZIbEtadSsEHUDe2I8JNXL+V76uJHL1Kd+egZoBEk4xSgFwQWDKFjsVJL7GDL6w9erx
	 Jq8AdUMBfij8OEnaGuAZhmFJwmAIlsYmi0SbejEcTi7jzRNTULfUOvdKpLzDVAdsCB
	 zYI8nHqd+B2Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ABDB606BA;
	Sun,  1 Feb 2026 20:38:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3EF223E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88ECA606A7
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5blPrKMyjcNq for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:38:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7767F60688
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7767F60688
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7767F60688
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:38:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -709974700; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 20:38:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmeCp-00000005k7e-1Zkm;
 Sun, 01 Feb 2026 21:38:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260201183923.3271804-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 1 Feb 2026 19:39:22 +0100")
References: <20260201183923.3271804-1-bernd@kuhls.net>
Date: Sun, 01 Feb 2026 21:38:03 +0100
Message-ID: <87ikcg9p3o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=bH8cqy6E0VuEAldmEpsNZnE1E/MxCXeIONMhGaO0jeNqivKhb7A93TqiRDpt2R3U/Yx2WzqefecGbA9YEAz9GDaaWo9Xc32ASxdnYSWtzeFLCQKB5+Jp/BbslaXnjDQFNRZOqptXohJ+DzKbJM3rLTwaPEZ0FKJBnOZRuP/YnWga6MqVsEdZXzNlWMQMaSeb8mYJctZb98+3qjYd+phksKkdz8f4AXSPp2rw1VI6tuTshBsi1G7HwSAfz89yWl8qBJM3grHqx7X7LRplq+f7ps/PMO6oPPQyGiRBOiYF/mQm+p1OhkN0URcOQ5iY8d6dF+eFpoOcydaabArGZOwzlw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=mvbMtCqNHwxxusACPm50zm2Y1vhN+6n3E4d3RH6t1L0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=bH8cqy6E
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 18}.x series
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

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
