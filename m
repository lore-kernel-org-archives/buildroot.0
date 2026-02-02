Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86622E73148
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 09:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34B71406CE;
	Mon,  2 Feb 2026 09:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UO4YNVb_nR0G; Mon,  2 Feb 2026 09:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DC224076C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770022894;
	bh=E2qyIXkxFJID1gW0S8hop2upCLGVxD8KxD5oIHnglMg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gPelUqYfZ+9hF3LQy7DnTM/pHIQMirGVVBw7u4TOTf4yEMRbfW1+IpIohPXkjAGaa
	 7SLME0nppLwJViS9vK0Qf+6hGVLk+1qP7N4rHG04K44BhFnSvmMOOMKckRpzUfXj9n
	 IIJLa9BGI+GvLMNyDogWrZKL9kWxNwxZOAdBFLJbsy2FUmkVHTryaXtP6IcQCH4Ma6
	 4HWZuU4eF7lf4pi3aRJhWIP2Y4be53rTAyBd2sZJ8WTk5vBM2RsQcfzx7z9XuzsjBG
	 UANiteNQnzLkxJ43L4tvZ8kHzzHplDFpNE8PJsDJr1mzpnKu9TYFfDomtKiStkFFlr
	 A/+ZS6NEvQQHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DC224076C;
	Mon,  2 Feb 2026 09:01:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AA8A23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DEC3811C6
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vivCiOyVBOua for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 09:01:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68CC5811C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68CC5811C9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68CC5811C9
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:01:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 120946209; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 09:01:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmpoC-00000005pkd-01YB;
 Mon, 02 Feb 2026 10:01:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260122185254.1054937-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 22 Jan 2026 19:52:54 +0100")
References: <20260122185254.1054937-1-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 10:01:23 +0100
Message-ID: <874inz7c4c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Fv1nroZ9IP3ucotRlLA66lekAKbC+OAcRt+hur7bkXaw66/UfWXQj3jZEIIartXiYh2UiP6/D8ptSLog5Ef2s2ubtSNglxdh1pLPkNnGC5c2VaU1mTuLvN5IRhlnvZzazBFQeKL0sS7RsQBc1fdA/yULRs36grIRKd8EQKk2btSOomoEvcHLtE28ADmlml0WnWkvmAV7HOaamX4TunepsrrD7msvujeUBc/vcwK7CWo64+Iw+cqScpqTUuyKcQe0n/3PadumQF3UbeE7WPKTGfXN6Ba1pOP7W+0lNNPoN9xLHxm+808IRfpVPzwrMi5PpHjbcbeCLGN6mvcLV8uDrA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=qn33L4XP79i85LpzbLW7lLuGImVUF2bUX+ZNOrY3Oc4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Fv1nroZ9
Subject: Re: [Buildroot] [PATCH 1/1] package/uftp: needs libopenssl,
 not libressl
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

 > Buildroot commit bumped libressl from version 3.8.4 to 3.9.2.
 > Libressl 3.9.0 contains a breaking change:
 > https://github.com/libressl/portable/releases/tag/v3.9.0
 > "EVP_add_{cipher,digest}() were removed."

 > Upstream was notified by Yegor but did not add any fixes:
 > https://sourceforge.net/p/uftp-multicast/discussion/general/thread/c02c950dff/
 > so we force the usage of libopenssl to fix a build error:

 > encrypt_openssl.c: In function 'crypto_init':
 > encrypt_openssl.c:77:5: error: implicit declaration of function
 >  'EVP_add_cipher'; did you mean 'EVP_Cipher'?
 >  [-Wimplicit-function-declaration]
 >    77 |     EVP_add_cipher(EVP_aes_128_ccm());

 > first caught by the autobuilders on 2024-08-09:
 > https://autobuild.buildroot.net/results/7da/7dadc662e0a6642e40831a93b788e959498d8923/

 > Fixes:
 > https://autobuild.buildroot.net/results/a74/a74526181dfc90aff7f56457c430c1aa1d006e54/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Another option would be to change the conditional in the .mk file to
use:

ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)

But OK, this is fine as well - Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
