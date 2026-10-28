Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A93606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Iy6vny0y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMIcZC/f
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E4A80F81;
	Wed, 28 Oct 2026 10:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHxSRJuymGno; Wed, 28 Oct 2026 10:33:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 108FD80F7A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793183586;
	b=kYwP6zZOKB84VWgf3VoXPE2lO4AgPxNN5aUtyOmVdyPh0yC9d/lijMvpcFS8MVPgY+m6
	 FBqe++VCm4mq+7SxhLtftVQwPI53XCAK/FbHMsJTTT0NxA9EUXnKH+Jk0L8eHyJSFDdc1
	 T3I1CI0N/DVnVSkOPEW2e039eHDKkQ+UA6P+zi3NG7SGOo9XoZ0s1ovf4Rv7lEUH6psfF
	 UvK96Y/M4OylhFuGeJt2QsKYFKIgoxpFV/gfn8Jn7FZXJufAHSQ/JVbWbMctmeXVwzPZ8
	 DevGPMIl/HJ+Og4Mf18mbnYAC+FpZjsHFc3sNfIXFRYcZXvGLg0ssBVZiilPj7uS5qw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793183586;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KGjqRJNPM5YNhPL1MAqA5lAAJlr5/GgwJ7iFoaqSm0A=;
	b=T3hntmIS9VbltBRjn5UEflLcIw1byK1CuTEyGF5Nw8IP2LLDozADwMb5s1itlIwd18Cx
	 6lqjdeN0Ys4j3tmCHeY73jLHgoKle9cbQTzLoL25YjrRhkAuD/ZZKcYtMzeWQ/Dao/RCT
	 hUoO347USjzaQaJOcOVAlqZbN2MwebEt9X0rZsUct3xuh5nGSl65bYOp7+EN8M3HZIVq0
	 +xTx/OtcK+Nm9EIx+qXTUT9YelbAKs4S7GtyWCfdYDv2q7IIqwX7ZVyFfyAlGeId6Nt/A
	 qPu9+biXeNrpdzTgrZdYikLKE2wa43y4+HFomG6L41EiP3SZ2d5RxJUUFI6wo6PO9AA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793183586;
	bh=KGjqRJNPM5YNhPL1MAqA5lAAJlr5/GgwJ7iFoaqSm0A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iy6vny0yMk1yFlDZ14SOK6XZGFVLuZf7IHsw1oyGc4RsGkTTZJMr351zm7ldbTxjX
	 tjvss3FuGKRUZeQBeSTwUtKTOxrdRARyvKF8dbytQ5xpg3jcGmUjvFvBm9W4mlwJWw
	 Q3EvDyzT06YFNAnlDKAKRe4HNPec5c0p8EENX6n0uygGEWQs8eQd9rnnGjf6w8TSoT
	 yoLIFsoE3cJJ74aXWqkq3VnQLg68r3XN2y7TVPapDhxTiw2fKsqaxykpI6PcOQ8gqy
	 uJ5Vje3tpJUpd+5JgJBRXwc7zLp/U8x/LToyUJ/pVpuyAi1X0orF4AHIdK1cqfxgVb
	 G4yqgpKrWOcfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 108FD80F7A;
	Wed, 28 Oct 2026 10:33:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA15B356
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 10:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC24340087
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 10:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fK2ixBUFwj1w for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 10:33:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0045B4006F
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793183581;
 b=dBbsf3J4ieHEOW8RkF/NQjOwTSs5Qoxsy/mJvDiBiplB719vVRJieZ/NS6g5ekvuOQbz
 YfhvYGUNlwYiEnVzItQbVYfdIhMShRBud87GvpyhAFrT3/yPiKqinIyQnOagp9EZmDWdI
 5XpED2R5LJVNI2K9qZvVbEl+Qch2DzJ5Jc9gIWC9p2QDG6vhM8FOY/wJ5vC7H7FH5BfID
 BKD5NVTeHr7A3oD5lay8oIgVMPaW5INGU20dn83b9jf4T1kUFGk8AnY6DOJQTx0ZbtHor
 n6+wbc6LInqhR16LETnYsIHF5NEQbMBt5z4RTRiA6atOinTaihiiKUKuIx+GiqlyNpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793183581;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Organization:Content-Transfer-Encoding;
 bh=HXuty/CJpaX0eiJWdlxYNBkUj6EoBgZb6kgM9uaChrg=;
 b=bYUGW9ZxHXOG0ViidKvLV24XeKYpakCOrTC7tcFJ+i2fEbHyeNb7WLTtK+SCK+QhqAwC
 hwIPnemIkhiho6TOWS3g/BF2EuSx50ngRXD2iJUCHC9D9uYAbYYAlWS3HaFjZKLd2usbf
 LsHpVsdaDedXf6QFgMlERsTpnj3XCP/hT1CsVgOM7/f+CHYgsrqsfzbT4ZSvouJTlQXqz
 d3ykTi4LQeHS6dWI+CUDB47BAlyfpYKRUtLmeSlWhwArPfdrdn2W9NJzzZ6epGF07UrUM
 80HlO02/QorCiaJLdGHsSWP2CVBnNngz3dnONU6ukfSSAArJTNjouHpZ6n2hi3f6PNw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="nMIcZC/f"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=nMIcZC/f
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0045B4006F
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 10:32:59 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c3f8d72d7ceso114860266b.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793183577; x=1793788377; darn=buildroot.org;
 h=content-transfer-encoding:organization:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=HXuty/CJpaX0eiJWdlxYNBkUj6EoBgZb6kgM9uaChrg=;
 b=nMIcZC/fMMM9W2WTLklbOz5djSa6VtMCMZPtbtHOOAyEybTX6NRf5hr0Lc2vIFEz3M
 NRYhFDKKe55nfDyDc0+GWtXQa4eKXXqb/xnSk10X/sCX7WgRxfAxwwq6Uo9+nTN8EcAz
 kWExyagq3WLPmo+ZjYP6FUFIvFob/ik3X1jiF4H5SZUe0Z3vkDiAos1U3IHmrkRkNQXz
 crP+1cn5Qj0FTx581G8j1rGqKHfpxJCy+zjwzY3/3Amo4PT2RbMdPgmAEVadpG4CoYU2
 NuAaiiQlSHJ4TJLRxJ4yo0BiUGlPlTpwiKZD3aWsBKIaUqenKDDnYPXBtwtw3EVzbM19
 IOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793183577; x=1793788377;
 h=content-transfer-encoding:organization:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HXuty/CJpaX0eiJWdlxYNBkUj6EoBgZb6kgM9uaChrg=;
 b=DbXGcp02arP8xfl86vxZs+LOnD6Fl2/1bnBhq3DRtU2pQOXs0R0CzISC1/dk0WICC3
 5bqrIOriGDBjagqChXIxZM0RaBGWGxU38kt8nziFHVtMyRuWfHIcjJJoRZeFePK/vIZY
 uTuLPXq45G4EVCTaiqniYmd8nbepQ25AT9jzJs8sTLRyhOdXBSbJFpxnBIi+cp7XS6Zn
 FUDTrJUhAUWclf2e6aZSYYv+l8vL9O9la8rzU3l6fXlMiNjGQXfBQMbSWOZWdgJoteox
 ovzxnBUYdqB2c5oiKBnAzK8w/PgqXWmOsaWBbnWsp+UkdCLVMXPaGg52OV0fuwUEqT0B
 X96g==
X-Gm-Message-State: AFq9FYLS+sikU/FmOVdeYtOZ01IYH8T7Vht54FPKwz0gqnJgK9sWv0xo
 a7QgzTw4CMQeaKpVEkW7HZ2yAyX4eEyuEf7uXwXOGOyKsemWfefM4QAbI1gACg==
X-Gm-Gg: AYBFou0pwfHd3rDjZkSf6uULMnMLFNXEbnln/fiL9LASqa3UVJJFUextGAm4bwlxihW
 DiKYUIFuWmFCgQITDxmWF5g/60CNMAKEOW9S8EYE7hs9AgdGD3PKkT01HBWC3UYw1Ry3cQXnQBy
 fZdMNwTFMDH0ErVI+tJTZAm6FLOxUdNnV8vLsodzM3YAXSYG0Bec7UZEwKx6ZCDEfFuSiooKL0j
 yt3DxeKdSLlfyko1BHfo/fVUMcXX0TsD768TkHL/7sw0fV0zFLVqCEXZex2eh7KeeG5AK3JgRyc
 hb/fs3rfXm3YsQ8saUHhn4G/V2Nb8i7q5sn2aS5YbPj7fIfeYolVOpWDgmmawsiyMBIT+lie6Bw
 GOzQou0OiniEPEyXesSHKz2WeaBWKTqFzzQ4534AB+Sa2JsiWPca3GnnO1BDsz+nCsrRw3tEm04
 BApHwMAR+4Iz7w4OtoyxEYBnwJmeIseRBAL1s3UPnEi3QSR5hkrhTHRnKW1mNRmadGbPmD2wkQD
 eEzlisKGcIfxQpxJ29TcmXvs3lfRwdfMZs2uT9hnkVbdSeJJU3SYYLMGIwByG9Swv0nT2T0hXDo
 gkJLFHZi8+65GQEW27wxr3uNQGLNuo9jDlnauLao0RkOORZQD94yyqNVVfefJekLxdxws0nrjQ=
 =
X-Received: by 2002:a17:907:9607:b0:c46:ca2b:84bd with SMTP id
 a640c23a62f3a-c49bdf5a7e6mr149128866b.30.1793183577456; 
 Wed, 28 Oct 2026 03:32:57 -0700 (PDT)
Received: from tollan.addiva.ad (h-212-116-93-252.A259.priv.bahnhof.se.
 [212.116.93.252]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd6573dfsm578711666b.52.2026.10.28.03.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 03:32:57 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Wed, 28 Oct 2026 11:32:48 +0100
Message-ID: <20261028103248.1317597-4-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028103248.1317597-1-lazzer@gmail.com>
References: <20261028103248.1317597-1-lazzer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 3/3] package/pkg-golang: vendor modules of local
 and overridden sources
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlc2Ugc2tpcCB0aGUgZG93bmxvYWQgc3RlcCB0aGF0IHJ1bnMgZ28gbW9kIHZlbmRvciwgc28g
YSB0cmVlIHdpdGhvdXQKYSB2ZW5kb3IvIGRpcmVjdG9yeSBmYWlsZWQgdG8gYnVpbGQgd2l0aCAt
bW9kPXZlbmRvci4KClNpZ25lZC1vZmYtYnk6IE1hdHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21h
aWwuY29tPgotLS0KIHBhY2thZ2UvcGtnLWdvbGFuZy5tayB8IDE2ICsrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
a2ctZ29sYW5nLm1rIGIvcGFja2FnZS9wa2ctZ29sYW5nLm1rCmluZGV4IDA0M2VmYzk0YmQuLjJm
MmI1YmRmMGIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcGtnLWdvbGFuZy5taworKysgYi9wYWNrYWdl
L3BrZy1nb2xhbmcubWsKQEAgLTEwOSw2ICsxMDksMjIgQEAgaWZuZXEgKCQkKCQoMilfU1VCRElS
KSwpCiAkKDIpX0RPV05MT0FEX1BPU1RfUFJPQ0VTU19PUFRTICs9IC1zJCQoJCgyKV9TVUJESVIp
CiBlbmRpZgogCisjIExvY2FsIGFuZCBvdmVycmlkZGVuIHNvdXJjZXMgc2tpcCB0aGUgZG93bmxv
YWQgc3RlcCwgc28gdmVuZG9yIHRoZWlyCisjIG1vZHVsZXMgaGVyZSB3aGVuIHRoZSBzb3VyY2Ug
dHJlZSBkb2VzIG5vdCBjYXJyeSBhIHZlbmRvci8gZGlyZWN0b3J5LgorIyBUaGUgbW9kdWxlIGNh
Y2hlIGxpdmVzIGluIERMX0RJUiwgZ28uc3VtIHZlcmlmaWVzIGl0cyBjb250ZW50cy4gUnVuCisj
IGZyb20gdGhlIHNvdXJjZSB0cmVlIHNvIHJlbGF0aXZlIHJlcGxhY2UgZGlyZWN0aXZlcyByZXNv
bHZlLgorZGVmaW5lICQoMilfR09fVkVORE9SX09WRVJSSURFCisJJCQoUSkkJChpZiAkJCgkKDIp
X09WRVJSSURFX1NSQ0RJUiksIFwKKwkJaWYgWyAtZiAkJCgkKDIpX09WRVJSSURFX1NSQ0RJUikv
JCQoJCgyKV9TVUJESVIpL2dvLm1vZCBdICYmIFwKKwkJICAgWyAhIC1kICQkKCQoMilfT1ZFUlJJ
REVfU1JDRElSKS8kJCgkKDIpX1NVQkRJUikvdmVuZG9yIF07IHRoZW4gXAorCQkJY2QgJCQoJCgy
KV9PVkVSUklERV9TUkNESVIpLyQkKCQoMilfU1VCRElSKSAmJiAkJCgkKDIpX0RMX0VOVikgXAor
CQkJCUdPRkxBR1M9LW1vZD1tb2QgXAorCQkJCUdPTU9EQ0FDSEU9JCQoRExfRElSKS9nby1tb2Qg
XAorCQkJCSQkKEdPX0JJTikgbW9kIHZlbmRvciAtbW9kY2FjaGVydyAtbyAkJChARCkvJCQoJCgy
KV9TVUJESVIpL3ZlbmRvcjsgXAorCQlmaSkKK2VuZGVmCiskKDIpX1BSRV9CVUlMRF9IT09LUyAr
PSAkKDIpX0dPX1ZFTkRPUl9PVkVSUklERQorCiAjIEJlY2F1c2Ugd2UgYXBwZW5kIHZlbmRvcmVk
IGluZm8sIHdlIGNhbid0IHJlbHkgb24gdGhlIHZhbHVlcyBiZWluZyBlbXB0eQogIyBvbmNlIHdl
IGV2ZW50dWFsbHkgZ2V0IGludG8gdGhlIGdlbmVyaWMtcGFja2FnZSBpbmZyYS4gU28sIHdlIGR1
cGxpY2F0ZQogIyB0aGUgaGV1cmlzdGljcyBoZXJlCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
