Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113E9E9537A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABCBA40B1F;
	Wed,  4 Feb 2026 10:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZFybT9wUnjXR; Wed,  4 Feb 2026 10:55:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BABB0406CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770202529;
	bh=CNCIW75whezdJThKvR57MCPKlnJoEejpRAl+4g6Q7cg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mPzTszGfqGXvziGyIPsGJSmd90+A0eN1O/EXF5SYRNLO6FwBUXprlPdCh4r2mvUpw
	 W21gMVYEcCs2Xm4PpnS/TVRfRd0UlFUx8S49dqdbD9tfm/sy5DhEuxdIeIEJMWF6qc
	 XiAL+Pfn/J/tFxxhhrYq0np+jfj0BKaDE4MArc/F6LOCbrt8JnxbH3yJqtHyP1lnxz
	 Mh9gPw+eoDHgUnk1ZaTa4MDxhxI4gD5sfPeyxqx9cK7mZoqmDquLNBN3VEeTUzC62F
	 qr262Y8P1bA7yIoR6n0/KRAF9oJ2S5hJasMuw0lB0EY9UK2fxtRWisn++NGD/g4nQQ
	 vIzx0ig87qhxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BABB0406CD;
	Wed,  4 Feb 2026 10:55:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C056AF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE09460A9D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwiSqCRnxqZ5 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:55:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C29960A9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C29960A9C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C29960A9C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:55:26 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2105954640; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Feb 2026 10:55:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnaXT-00000009ZDR-0h6U;
 Wed, 04 Feb 2026 11:55:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260204073238.472889-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 4 Feb 2026 08:32:38 +0100")
References: <20260204073238.472889-1-bernd@kuhls.net>
Date: Wed, 04 Feb 2026 11:55:15 +0100
Message-ID: <874inwhj70.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=W09tyiXDLzoTmnDWPeM8kn0PQ54b6C25wg+lv2Y4bnKRNrdY2fwJOMGVKxKtSvdXq4k7/OHbXknfnEgjkUhvgj4n6GuI8/JfvfcDK/MC1OFQZL65brEkOtZdJDybd5vHUMgtuYiOaGEJ5UEtTl8EtU/bVLX5sKiAHJW44jUNdtCNc8x+qQBkwd45r+lFkfBSoYKadjtZrfVX0dgMPW0PIaFacyzpCnHH1RFhk8uM8HsQpSnTWW0wMfIg5PznJipid60iw4G8y8MRkbFHtY1OacHNQ5k2LAhBXoJ6BpDe3pqLNpi9wETEcZqywFtPAFzZVOeDltRTYXKdPYr7Cm3AeQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=yHX1g+Q5iJ0ANK36zlNnX3mSQFreCBV1RzmekkFFZwE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=W09tyiXD
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: fix powerpc64 build
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

 > Buildroot commit f710640be5869bb3716e254916ae614f79002f2f bumped the
 > package to version 3.6.0 that includes upstream commit
 > https://github.com/openssl/openssl/commit/8f24a148e6f112045cf110c3e3f4e2415d9c11fe
 > which causes build errors on powerpc64.

 > The upstream commit was also backported to older libopenssl branches:
 > https://github.com/openssl/openssl/pull/28990#issuecomment-3675219918
 > but its first appearance on the buildroot master branch was with said
 > bump to 3.6.0.

 > This patch adds an upstream patch to fix the problem.

 > Fixes:
 > https://autobuild.buildroot.net/results/b28/b286ad40f2240a85b9cd0dc44e089d1d6babd3ea/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
