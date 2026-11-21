Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05911606A32A
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 10:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=U6+GXvja;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=Txj+HB0/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B69D36069D;
	Sat, 21 Nov 2026 10:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hUCmR61vVOz; Sat, 21 Nov 2026 10:31:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E676A6065A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795257070;
	b=Dffn9tMlGnijgO+Q4sx9Vg9eFoXzjjAG2Wd/z+qcSQ2UBd+skWkGHLFXaqInl8fY56Nx
	 wT2DfB83FkUXdjmtskaQzcFdNJ5Xo/AtnqZXDTDVbkiduseWvxR1K5GtKA6vffA5Y+Ruq
	 Gz8bqkY4/NC7kEQyaRVMWsPWojhacOVCbpOhKu6UerMlHunWYWS/mD3t4dL7fzPLFSZjs
	 Zg1zz8cleAqLTgqZ8YzAVf8AUUrTNUSn9dmz3zke6eLKMBTpgQICsE4wqWat2BbdfKck/
	 uVoo/AU20EMI2NEmZPgW38VEBq/vqCG/FTg6FizX0643LTZiPEVFC+tLSWLcySncktQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795257070;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ia3Alf9VbBVyIJv1VAsUCr/FSreFZACkWO7JKt97Mw4=;
	b=ZoZ+GNeVcNtCC9OIsjkFtOvwtM4gMErOgBCFCfH+4T3EUbeqYO9wYBklQyp5QYAbNrEu
	 HturJn07rrVkh9AIrf2twlpRNC1vWgto60RiwK6ztUZ6jF5vRfA0bi/gHKKB76wKcE4av
	 9ixQTwPTOTVR37Rdln9tRWfK8Eoyg2PGxWnMsJURic/YBWvNgcmQQcLyAycyO9L37ANOG
	 IChrdB8YIRAJBwq7Fr3exDBsSWcEpgQSToRlBvHJABqU8BOMlKvdFiZchsKlaICEE3Q9V
	 RmLC39eaTpsHGFMTVS2PAb2KzTkfwc5qOEvJnOIfl5FyTnOVSCl0TWifb19+j06V/HQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795257070;
	bh=ia3Alf9VbBVyIJv1VAsUCr/FSreFZACkWO7JKt97Mw4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U6+GXvjaOn3+PUNEArm4m1oEXIexfU1lmruOKdbwSL+g9WwTfibE0d/VV1ffjbHgL
	 bHg1q7CkyOxMXluwR1/KYa+skytUFPWBM5YSu+Ua9SqG7YCPPfhRT2i3+jaM2c6bgM
	 rGhiXSIzC6LqWg0FjRFOVwXXdLGHzitqfpmqcAdkMBU8kVIfCDduX/8rqz8sZPYEvx
	 UV98juGsRcsOCcVMvOIGfm8RXDsk0gMDgagA4UYtTmVOV76316kHcmT0pK5FJJ66b7
	 /s8mk2S38spTUYnqrfIGm+hiQnVc3IEhFN9zjS9S+YGxZj/G7OGsJ0FOac93hPHkmX
	 c1mVocywD0b8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E676A6065A;
	Sat, 21 Nov 2026 10:31:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32C229C1
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15D5F4006F
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6ILpCYjbjoT for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 10:31:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7684840012
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Txj+HB0/
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7684840012
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:31:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Txj+HB0/SWqY9QVOGr0KKHWxT3iT/INh3d3KZl0VcMBV/ewAqpjFmGgReaqJmdWXSGBlKbF94cJr+9maZwfdyjHqR2E/QlW+myBZSzpYit+gXA4YcAH78bIVwdrK5LmvwWYlqr31CKpgEhlSWTH51hljn1yL0MG5k+moIEbsrBcK/JaHwBNMjw6awDRPEljgkA6l7JJ6HAf4hF4pJytjWMmBIfkI9osrnwVzLFG+P0w0r6t4DZXpV3Vo8nzQaPon5ZCFQQezEUQeBG0zKPIqyz5r2aWap38Jt3/6eLUPApSt6DVJz9OcGSjdQqpxUDqs7eOsNBBz8zTdBeOg8+jbGw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=BwTwFRmCFpaxBoIaHR0fukLBUxYxW00sSyZ2IO9AoWQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -712304272; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 21 Nov 2026 10:31:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xUiN1-00000004oOe-1ZNz;
 Sat, 21 Nov 2026 11:30:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261120183029.238611-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 20 Nov 2026 19:30:29 +0100")
References: <20261120183029.238611-1-giulio.benetti@benettiengineering.com>
Date: Sat, 21 Nov 2026 11:30:59 +0100
Message-ID: <87o6bitr18.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump to
 version 2026-11-06
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pj4+Pj4gIkdpdWxpbyIgPT0gR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGll
bmdpbmVlcmluZy5jb20+IHdyaXRlczoKCiA+IFRoZSBzdW54aS1tYWxpLXV0Z2FyZC1kcml2ZXIg
YXQgZ2l0IHZlcnNpb24gYjQ3Zjc0YzkgaXMgZmFpbGluZyB0bwogPiBidWlsZCB3aXRoIExpbnV4
IDcuMCsgZHVlIHRvIExpbnV4IGNvbW1pdHMgNTkwZDM1NmFhNDMzICgibW06IHVwZGF0ZQogPiBz
aG1lbV9ba2VybmVsXV9maWxlXyooKSBmdW5jdGlvbnMgdG8gdXNlIHZtYV9mbGFnc190IikgYW5k
CiA+IDUyYTllOWNkMTgxZiAoIm1tOiByZW5hbWUgemFwX3ZtYV9wdGVzKCkgdG8gemFwX3NwZWNp
YWxfdm1hX3JhbmdlKCkiKS4KCiA+IFRoaXMgbmV3IHZlcnNpb24gZml4ZXMgdGhlIGlzc3VlIGFu
ZCBidWlsZHMgdXAgdG8gTGludXggNy4zLgoKID4gRml4ZXM6CgogPiAgICAgbGludXgvbWFsaV9t
ZW1vcnlfY293LmM6Mzg0OjI1OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rp
b24g4oCYemFwX3ZtYV9wdGVz4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQog
PiAgICAgbGludXgvbWFsaV9tZW1vcnlfc3dhcF9hbGxvYy5jOjg1OjkxOiBlcnJvcjogaW5jb21w
YXRpYmxlIHR5cGUgZm9yIGFyZ3VtZW50IDMgb2Yg4oCYc2htZW1fZmlsZV9zZXR1cOKAmQoKID4g
Q28tQXV0aG9yZWQtQnk6IENsYXVkZSBPcHVzIDUuNSA8bm9yZXBseUBhbnRocm9waWMuY29tPgog
PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVu
Z2luZWVyaW5nLmNvbT4KCkNvbW1pdHRlZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
