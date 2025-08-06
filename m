Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F0FC87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 19:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14C13846DD;
	Wed,  6 Aug 2025 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlofpMuj2bMJ; Wed,  6 Aug 2025 19:51:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB29B8471C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB29B8471C;
	Wed,  6 Aug 2025 19:51:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22AC8D79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14EE241EB3
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8X5qoDxiuxnQ for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 19:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E7AF4215D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E7AF4215D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E7AF4215D
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:51:48 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 350812058; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 19:51:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ujkAq-00HNJD-2M;
 Wed, 06 Aug 2025 21:51:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250806193802.532017-1-thomas.perale@mind.be>
Date: Wed, 06 Aug 2025 21:51:44 +0200
In-Reply-To: <20250806193802.532017-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Wed, 6 Aug 2025 21:38:02 +0200")
Message-ID: <874iuki5yn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=iXritQQrklULGu2KsVoJcfFjgKUhpzEOwpGeSditJ8xRfnP1r09KHgZ8Xhm/RsDeP5zOQD8z0dqlv+ksAqyyn6H9WuEEUxWlUPV/hUKV6DGxhkz9anYE779sg8CnkeAZqblZD/YLPEJm+eosR8h1IFEMh1cyHwTFEFvZnPIwdYU4h8N6/6vIEodTTCwFysXqHvIsa/aAwut2vqIkcvwXxTKZcTr0kIP84/m1LnNDhqjoMLcb/vXNTSPxvn23GP+JIO+7R7xbURwOR/XHwL7J8cnkKKpfo/zfXcJ84CURiAyMJAyGQ4WFgE+6LFp/lJPJS22h+OCnkAb+CUibYGn+qA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=JZWh5b7+5NYp5CjTdhv5+QzGznoenAyyStbhqzibbAs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=iXritQQr
Subject: Re: [Buildroot] [PATCH] package/flatcc: add CPE identifier
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > The cpe:2.3:a:flatcc_project:flatcc:*:*:*:*:*:*:*:*
 > valid for this package.

 > See https://nvd.nist.gov/products/cpe/detail/AA7FC7B6-537C-4735-B615-689D3A91C994

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 > See https://nvd.nist.gov/vuln/detail/CVE-2021-33983

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
