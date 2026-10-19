Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE556606A320
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 18:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aoLLIfPV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BCD24065B;
	Mon, 19 Oct 2026 18:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXbXlzvJwgmK; Mon, 19 Oct 2026 18:08:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 922144064F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792433292;
	b=r4ZUR4eNmtz5Hpwjhf1dmmcGvE8cevJY9H17U31MTVT+Axsv8lSL0sdSk/i+7VUQK8xn
	 +rnsNUu85wrHbaz2+OpQ+HBkiLYcAbOXUD+6tjjsxgXk4rRBrEtLm+YvOPEn1TJQu9zOp
	 X4PPyV8uljyDihj9Mhph2c921FT6XNsCI21l5Rp6n7KKjHiPH3dnd/HxPLg4whXgYpVmK
	 KDeoJjlfEfkiRoG4ldVa6wH4dLrZaNdRBbdDHNy+Ng0doyzHqYTp8rRiW55A5P8fNdZ1d
	 EDykoGq5TfaHcItmvE6IbdwtLso4u/3YcLuFVYJ1Zz+L+z+S206KK0X2ZDlesf0Jo+g==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792433292;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:To:Cc:Date:Message-Id:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2vukW93qZbBzg/5P4x95lNk+eZTYqaFeMhR5iP+fiUM=;
	b=V29JAtD7I4yHhcSDK3ElxbEUIF0UwjE2Ko3g6h3X+sbEHXC03+8Wzi8EMj73WQAF7dCr
	 GtIm2eYfHjxnW/80OgJKGmQ1d+URu+8JR6OR0jYOMejDTwang/LUdJN1xZU+E2TU4AZ1c
	 EboXI2Hh/l3H4pU++9+m4NRFqu+3jND3dPTB8+QEuEmgau3UJBPpJWGMWalDIJ+dOXZ3q
	 HfskJNZFAfOuEnbqq23HRSVJBU+vhXUUjNYrLYpHip9j4CVZFTnX1WbarV2flkU/U9AnY
	 je5ZG2+CwN2onUZq3AFnPVzaxcUrDKt2RD2IamqiRSbWU5bc6ZKNJLLQ3e/A37QOb3w==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792433292;
	bh=2vukW93qZbBzg/5P4x95lNk+eZTYqaFeMhR5iP+fiUM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=aoLLIfPVgwvKk3Sf/b/EUPtSKGXhuRwHlY1zuMD584TXqDl+dFHCGxx6sRlOBf1QY
	 XCVYvA/H+pXdKsWC0pKCKVnS8dy1JBvZbTm670C9EejsCDNLjcHMDOMrCD7OhvidLp
	 iWhHBqNIky6ig5uUHfCvvxpqezwYubRf9sqAQbTRK8YJbD+HELhdtZjk1Ri0DPFfU3
	 e/4sPU8m4L1AAOgbny0Q9wypogpLVDkkyruyQqV289GteQDqhwR9lwdtEzyrjHgDcO
	 Is0JX2ivW3/9RBL+hFYNjo/KXKq2HUowzF9egQxoPfoRvnmqq3T7WlMqJgXytNMj9t
	 +VHadq+6RLPXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 922144064F;
	Mon, 19 Oct 2026 18:08:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A5223A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 18:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A48F40189
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 18:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvi250u2SJkV for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 18:08:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 47A91400B4
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792433290;
 b=jAx2buC9SCnWphGb6Qr5cj9wEpC/TGAC+0GyUrqKmoqJGbfBWKASi3JEiEqkE70SZe0Q
 9oJb+Md6MQWNSNKL5VWysROkbE1FHpIRAMNAshmCArVYHqPbLakMfyvrWS7f2n5NypLuj
 8xZOrVCcILpu3TP1loNphRdtyyT/U1wBnVN957FHw67JDiBhPuzX0pHIFUTy3XP07T5Dt
 hQCZhxzRNCFzqkaDqt7/X+PAK2kRb2GxS/Cvsz0WQw8vZ5mHMh/gZYKhduaYm/IfxJACf
 NnCv7TS6DzfC/gUUEYhLCRaOe9d0oa6MSXwJ9vs2j91TmyMzBgj5rGKMik6kn5NDn5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792433290;
 h=X-Greylist:Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:
 Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 bh=IEr4p4qpPEDmVL9wk6zjj4kj3lb9bXrbl4e4Mkn1JhA=;
 b=tecSZXNJ3XoC5YNQ9IuUYQVIFV2hhHFoqTVB0dUBbjZ+aMYChnwDgKhIhPK1fqQisqAz
 /20/IxLJKmf7eycEpN/RPizonCAirQB1NVl+7HupmWsyU6VApv246bdTJxTUFCexS1D+G
 sRES6YEoXg+HBHFxrADlZjcY13Zb65kTP3MZr4/8I5ifzZAdS+H8PiEkjROn5PAaFF3QB
 BLiBHxQQZO8JXzQmiY8iHIYtsoixe6i2eK0o5fxyCsiFJqRvBgETM+2Xt3JjpH5tFN83l
 dansiu9Q78nyhjGA3pa7fIYETtTfCRoKL8I+i8b4G4ytaaD6uRDdh54r/QT54SkSEog==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=murena.io;
 dkim=pass header.d=murena.io header.i=@murena.io header.a=rsa-sha256
 header.s=mail2 header.b=Q0bkXPcK; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:4f9:4b:5387::2"
X-Greylist: delayed 416 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 19 Oct 2026 18:08:10 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f9:4b:5387::2;
 helo=mail2.ecloud.global; envelope-from=martin.contamin@murena.io;
 receiver=<UNKNOWN> 
Received: from mail2.ecloud.global (email2.ecloud.global
 [IPv6:2a01:4f9:4b:5387::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47A91400B4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 18:08:09 +0000 (UTC)
Received: from authenticated-user (mail2.ecloud.global [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail2.ecloud.global (Postfix) with ESMTPSA id 5CD5F72125C;
 Mon, 19 Oct 2026 18:01:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=murena.io; s=mail2; cv=none; t=1792432861;
 b=hx6hs7bC+NYz1kihq57Cuvrqcu1PCo6Fi41tjU5/+AAq9zUlFrB7sh6IiOUKJUBv6SNpbY
 3XNKahFcBwrxLHIwkFGcsj4WwlVoh8doC3cGBpfW3x9XuK452TUqOwVcXedqJg5V3nM2iU
 NpSWaK+RbCFjMVFMHGObJC3ECYIfbc8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
 s=mail2; t=1792432861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IEr4p4qpPEDmVL9wk6zjj4kj3lb9bXrbl4e4Mkn1JhA=;
 b=mPir9CTifYdBCxqKHEq3iv8+X28qORPGRBasxh7F3SnZ2cKj2aXvz/rLbwHuKAE5wKZrqq
 NuQr3lGYAbq54zLCZRGMZGVhZEiq16HHmb2FkMWsgr5/NgInIQqXU2oqxCWjfDLkC6mwsD
 3K8dNKYyq/jyyjTbyZCK/cWREJTQW38=
ARC-Authentication-Results: i=1; mail2.ecloud.global;
 auth=pass smtp.mailfrom=martin.contamin@murena.io
To: buildroot@buildroot.org
Cc: Martin Contamin <martin.contamin@murena.io>
Date: Mon, 19 Oct 2026 20:00:49 +0200
Message-Id: <20261019180050.1175211-1-martin.contamin@murena.io>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/1] first contribution: fix libtool v2.6 patch
 for libtool 2.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Martin Contamin via buildroot <buildroot@buildroot.org>
Reply-To: Martin Contamin <martin.contamin@murena.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

This is my first contribution to Buildroot, so please let me know if
anything is off in the submission process itself.

libmodbus (and any package shipping an ltmain.sh generated with
libtool 2.6.0) currently fails at the "Patching libtool" step, since
the v2.6 patch was written against libtool 2.6.2. The fix removes the
version-specific context lines from the failing hunk, so the patch now
applies to both 2.6.0 and 2.6.2 (both tested: full libmodbus build on
2.6.0, dry-run against libtool 2.6.2's ltmain.sh).

Happy to rework anything if needed.

Martin Contamin (1):
  support/libtool: make v2.6 patch apply to libtool 2.6.0 ltmain.sh

 support/libtool/buildroot-libtool-v2.6.patch | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
