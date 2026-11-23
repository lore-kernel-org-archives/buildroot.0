Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9749D606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mOaxZbjU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=cmbGXeC4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CD3A80C35;
	Mon, 23 Nov 2026 08:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id diCZ8EV80oJd; Mon, 23 Nov 2026 08:52:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4937780D7B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795423963;
	b=gXh9DyIHHoPn5Ly+il1nrqgQ/FR2oZio2/96mFwh776Y8vfReoMk+n0+a5VokplKqiF7
	 KPS0G+fMvhVOevxaMWJt46OQFtmpMCt6gQjTaLDibAbHq5BMAm6LKdfvQ3sQqA0LJDENg
	 D1VCEiNJPlX7P7Ea2iC89rpWtCQ2/izHqC9cRF3dbq9ciEk6tAWbW5vyPDYL9axrVZ78V
	 BXBdkgDSCLU51d6vGz+mVyYMo2LfkKS1ai8V9pZDV44H+EahwFQG+36pO0cpcNmAwHbgP
	 ldqjRdHdmbzysocx0R0fr/xj1gpjn8VnBKYDrx7h6+CDIuPEL8YAbu6WAx87P54wgow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795423963;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vviUD3voD+yJFG0B5DrJIsgjjrH3DaGA6QWjMd5wMgo=;
	b=e0R68xYYZlLnb8Vqw7P/TqT7oKTzrnQpzY1eQZnOc/hNaSwQesKCVf0eOt/8KBIPM77a
	 E448XFt3nhrpnOMTpYdsiDKFDqnlXS7q2qvxOjkTSFrxoC7Wrr9K/IrHlQTDetpxu7ceq
	 Nvqo/TREcghcXyXfNZyp6540yw1RJx5Krw+cEojnYdB4tCjBJU7/61dWtM9BCeAnpPIF/
	 vnF0JkF9bNzPyxp4+ecQKSkEDIj7IdFh+ULKjrW7K2bUcMsOpyvF0fk6e/k/EYi7bkrqf
	 q4S42/5OW1Bcwk/8K1ajya6ZUbL2274L6hkkGbo2Z6TFxTcEj36tWLx8jkVMe/bqGgg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795423963;
	bh=vviUD3voD+yJFG0B5DrJIsgjjrH3DaGA6QWjMd5wMgo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mOaxZbjU+kcoe0bzi5+NBprzb2zKaAmaoEt0agSPIsNQhKyT+Y85mTRyKyeAi0ucL
	 q2UG3EM/l6mHBUG/wk/ZthFzLPym6wS8aKWIdI3Ow29FdR1Lsia9I2OtREbgEQWcKg
	 YE6vsuaY4lRuB765B1jNpRlzvbF/qSCgf0KsgeMev6eFL7g5ExGd1KIhlIgxfYtOWy
	 /rV0My1fYGAV3leqy5gNUgTg+7eJIy/49U2ez+k/8oXskagwzlIc9hpUEgwlPpOPvk
	 fQnNOsuaSHNJmjts0hy4e0mluFYBh8DQA03daEkaF+cqqzNrlbkMJG51Yh6TL/OPP3
	 Ut8QLGDGBCd+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4937780D7B;
	Mon, 23 Nov 2026 08:52:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 377A3260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 08:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D0C840600
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 08:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XMnCuh9QnIO for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 08:52:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0B6A3405E5
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=cmbGXeC4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B6A3405E5
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 08:52:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=cmbGXeC4+xugBNtgkmwspDj5dQQcOmliRUQtWl+Z2JmNkuFqV7QZTru4w7TqH9H8oyEMwXj60/su5mnXGLzDXMd6Ez9fhukIPHqkotnWn4PdyzglwkCRqjYM7XgsqQ0iof/nIo5Dt06hZ4dRXmEEIgnDMwrTbfp3S3QaQrYxOLAM3/uPpU05EsNNZxDjJaEgIfSny36RaOm/B305f1eStVMVcAvYVpn11V2C+3NrSiXRZ44PS88eW6Z8LqQrUNWHbqKvfQ6mWr0DPP7bHRpSKrcJ8I0qxQKkrAYErAuvr3hMK90F9dqTQCzKDQznELotjxM61ElYvK7rVU4vNjk4yA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=LFiWWLFERj0bbL9ZaQMv1KkZyw7kCQ9IJcsZHBQyYkg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1176211618; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 23 Nov 2026 08:52:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xVPmr-000000073Zo-1T0v;
 Mon, 23 Nov 2026 09:52:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
Cc: <buildroot@buildroot.org>, Titouan Christophe <titouan.christophe@mind.be>
In-Reply-To: <5a00524b30da45d1ab4945dc32fd43f413d52900.1795422881.git.yann.morin@orange.com>
 (yann morin's message of "Mon, 23 Nov 2026 09:34:41 +0100")
References: <5a00524b30da45d1ab4945dc32fd43f413d52900.1795422881.git.yann.morin@orange.com>
Date: Mon, 23 Nov 2026 09:52:33 +0100
Message-ID: <87fqwslyjy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/mosquitto: bump version to 2.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>>   <yann.morin@orange.com> writes:

Hi Yann,

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Drop patches, all applied upstream, and backport two fixes.

 > We need to revert an upstream commit (patch 3), because of an issue with
 > cJSON, that we already tried to fix in e57c73bd5a67 (package/cjson: add
 > a patch to allow cross-compilation with sysroot) but that was reverted
 > in 1634ee6d161e (Revert "...").

This should be marked as a security bump given the security fixes in
2.1.3:

https://mosquitto.org/blog/2026/11/version-2-1-3-released/

 > There are indeed cJSON upstream issues [0] or PR [1] [2] on that topic,
 > so the fix is most probably not in mosquitto, hence the revert has not
 > been sent to mosquitto upstream.

OK, annoying. It would still be good to add a bit more description in
the patch and you need to signed-off-by / add an Upstream: tag as
pointed out by check-package:

package/mosquitto/0003-Revert-cmake-Use-cjson-provided-find-package.patch:0: missing Signed-off-by in the header (https://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
package/mosquitto/0003-Revert-cmake-Use-cjson-provided-find-package.patch:0: missing Upstream in the header (https://nightly.buildroot.org/#_additional_patch_documentation)

Care to fix that and resend?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
