Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F50606A338
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 21:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AdiK/B7e;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RXs58gOf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCD0A60677;
	Sat, 21 Nov 2026 21:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKeMhyS2j_P3; Sat, 21 Nov 2026 21:51:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E9BD66061A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795297915;
	b=pRAGkRZTwIXipw2fi9h/vm9zPlGHSO5gJaduiRa4a/hCga2AxrIDOFskartO2ySVOPP9
	 fUir4flZGlB2wcSbCMfOdeqK74H3tV+3N65KJcApWphtT2Y4RxctH9JHtCD3KRLmPfpyq
	 1lEm8HWXvlI7RPdWUsEF4jJBFTWyIpH3uop7pMrCCygGsVNegZZJuEyegKXlszUh7+Wnq
	 8KO5PEBopqHilOj7ItXEuWhxBOTTo6EzJo4M6b2mrut9rJD66AV3EvwVDgBtNZKnwt9J2
	 09Cq5kfNfhHD5MlRfqzOsCMnTrIUvi8b2k5gDxShcs2H6X5lq1kNFtTPidspgiao/9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795297915;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=qdSXmSqrwB9ZfquUN3jH+U4M3UGiDs1cUVhpMTgxlDk=;
	b=isKkOSwLN7Fdb1899NJEUsJ4TLZzOB1oHofwt99Ia57DsRxMMpQF+zR/Pylgtngn0SL7
	 qdBGYboib2TmSho+bZLFrlW1WdMl11+hP2XWRNR2ctORq29IGppQruk6KfnN6I3sHAaWQ
	 p7GJSgOePi8rYQ+TnJQlWtlIcTXBNXFgGnaoxGhcf0ImKw5XoWgQ25S6SqPjchna+/W1N
	 ihNFmrUEaBHX4VJD3tOI+uEJDubRDLss/pIOoH0wXb6Qdlw7gjAHimk6gwI+mSa2S9iNl
	 /IUouVNoG0p57hLKi8VD+95B9J23UM6x0GUG8Lfz/i/LP9ILVBdE1u0BsJYRTWlK8Dg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795297915;
	bh=qdSXmSqrwB9ZfquUN3jH+U4M3UGiDs1cUVhpMTgxlDk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AdiK/B7etif5bfqWc+rEs6Xm2+sEhZR64zWqZUNi5895Q5iEDanZt6pshVuEEAV0K
	 Ir0Rzais4z3Skl/wy6srntfV/JmfCOoos+I64LTp9JFM68bglkdycfdMbNBFgnA/V8
	 vT0pYY70/09l7Ziqd+EhTw5lwLtWs3ybT7s0ZiB70cCWDfOeF/HYI9TLxZ5lcmang0
	 inuhjSF4JPEMHt1nzpOPY448mYKw6AjAEVt331BZ1bsCyagzh4H9i41ZP+jf0qreiJ
	 HqL3rT3TQaxTPfkbwJ6mm6Z5BDqAx6o2P8YfXTcipDSaqJk4rKgpdOie9Rb3YackmO
	 u/SOZQUe8QteQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9BD66061A;
	Sat, 21 Nov 2026 21:51:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDBD9465
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 21:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB42280E4B
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 21:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anA71DFbCa-m for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 21:51:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 693B680E49
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=RXs58gOf
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 693B680E49
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 21:51:52 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so24184495e9.1
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 13:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795297910; x=1795902710; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=f4ryKBytNKBmFaKCrx5UOWYWJTX3/gJA0/xDUNqyumo=;
 b=RXs58gOfMWM9l+9ozy25P0wzrW+jaALWu7XsMxFBLzGl+UBBSGYeAsZJlHksKBSoVd
 y4WCudNStZXbW6Xt4Z2mlfldptIgyYxu3wjD/SvVAccoOxSx4kd6R6E1Pmh6bGzYu2sT
 48P/E3oZywcdV49gXitwWO2DNhIeUT67LSccqUU30WE93BpZBKbVJcpwOzBvzktKtfv0
 w/4JNWxXYN+e/9yMnHnm7v2OzLP21S+VuRUUNHN+uNlIg+TL2uIccdzuiQGb4L1gCCPV
 2Zgw4OYBTsx/SAxwsn+pXBF/2vAIkCVc2lH5qsoHjsRMVx9Dbk/hWPyzrIH84OgTcgyP
 FXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795297910; x=1795902710;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=f4ryKBytNKBmFaKCrx5UOWYWJTX3/gJA0/xDUNqyumo=;
 b=kMBVBxFP0D1Z0AwknZ2cGcYCthnZSuZ8R9pNR/d9j2bZov/Cz58HYP71S7aww66jBs
 bBLrUOu8BR5d/w7yC4Vvjoc9VOQJ3VxVCRBpfSJYGnNn0jzU5fRe9BdOZ7moSuezfDem
 QZouuPfjcekbUWIWqTIpkSizYoyVF+U1Qs51OyiemqkRL0YST8SKxD6mFDauek5yPCYX
 WAN2XQoAduU/XnqF/+OzqO310dzjDaJ9vSKBwZzKmxA3dFei4eNbV81LVoiURzcVx4iZ
 7PSGcq+Z9+UtdIkmCY4TnWx6RJndbRxfoLet7hwR3Bn1scCtGVbUNU8bDJJZBU23TrdM
 0imw==
X-Gm-Message-State: APuU4Z8IB8WQ63Y9lCPin2xs1o5W+sKXCTm8G3F/ULf5BKG1k7tMsNeC
 MvkcmyC/Boq4EbJe5Mo7FC4NG6QvBw1qpe8DTn6BS0MslRUeu+hJThkJAb2eH8Z+
X-Gm-Gg: AZFdTZf++pD9EZzpnX0DI0P8ffSeSLu40sMI7kNMdXhgK/oEasVCyB3Zmdc3qfKAMpU
 REvcDvVaesLP652drSSbPdXb/9Lz0CI01LYuB5USnKCED0LAk3Gxyy2LenWHx97FIG3uOcExday
 jBFm+fheNwQ4BNPJQvpBnURWwQxljBOhAmWoRavwNHrX2SL+32Q8uLJzTIyIClHStT6TUUen60R
 GY9vb6pi6n0ijVUR78/FZVbhhKNB9VFx0+vtOI/bZ5uHehrvtTe0C0jmy/XajdBG9aMufRVdQ/w
 ytKJw8oYY4Yj8JiXleVac5YgkisCTchvMiiTwgW9rQ2AuAwJoYqHIkzvcFOutNMbht319JzLfTC
 oTFhmdo83WGjYXC1gQ5Tro0D4UsiWKh9keMq2OOKj5J0BwLDJIh5v4LdkHsnpK3B4h+IA61BsP2
 jAam3H5+Uo6MOMkwXTJCB5GByNn1C9LZu3AZewHAgUjeR6v4I9DVMBxdIj0wYZGTujd/iuPWMwC
 yIYq5p0wL/fZKOVWW9d8ayRV4jM1oj7SiHxaTUGLVZbwpeCxnXIicnui53JfmyrHba+ULsH2PDh
 90caIIMU/ZAHS8V/B7uDbcI7N0TJ0thg5ycHIAmC2p9BwBr+X2Q=
X-Received: by 2002:a05:600c:b8a:b0:4a0:20b4:ba93 with SMTP id
 5b1f17b1804b1-4bb88818156mr153516385e9.16.1795297910049; 
 Sat, 21 Nov 2026 13:51:50 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88402ce9sm161893155e9.0.2026.11.21.13.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 13:51:48 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Cheng Yang <yangcheng.work@foxmail.com>
Date: Sat, 21 Nov 2026 22:51:45 +0100
Message-ID: <20261121215147.4121-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250411172944.1379043-1-vincent.stehle@arm.com>
References: <20250411172944.1379043-1-vincent.stehle@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/3] boot/edk2: add custom version option
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgoKQWRkIGEgY3Vz
dG9tIHZlcnNpb24gb3B0aW9uLCB0byBlbmFibGUgZWFzaWx5IHNwZWNpZnlpbmcgYW4gb2ZmaWNp
YWwgRURLCklJIHZlcnNpb24gdG8gdXNlLiBUaGlzIGlzIHNpbWlsYXIgdG8gd2hhdCBpcyBkb25l
IGluIG90aGVyIHBhY2thZ2VzLApzdWNoIGFzIGxpbnV4LCB1Ym9vdCwgb3B0ZWVfb3Mgb3IgYXJt
LXRydXN0ZWQtZmlybXdhcmUuCgpNb3ZlIHRoZSBkZWZhdWx0IHZlcnNpb24gZGVmaW5pdGlvbiBm
cm9tIGVkazIgbWFrZWZpbGUgdG8gdGhlIGNvbmZpZwptZW51IHRvIHN1cHBvcnQgdGhhdC4gV2Ug
a2VlcCB0aGUgc2FtZSBsYXRlc3QgdmVyc2lvbiBieSBkZWZhdWx0IHRvCnByZXNlcnZlIGN1cnJl
bnQgYmVoYXZpb3VyLgoKQWxzbywgYWRkIGEgY2hlY2sgb2YgdGhlIGN1c3RvbSB2ZXJzaW9uIG9w
dGlvbiB2YWxpZGl0eSBpbiBlZGsyCm1ha2VmaWxlLgoKU2tpcCB0aGUgaGFzaCBjaGVjayBmb3Ig
Y3VzdG9tIHZlcnNpb25zOiB0aGUgaGFzaCBmaWxlIG9ubHkgY292ZXJzIHRoZQpkZWZhdWx0IHZl
cnNpb24uIG9wdGVlLW9zIGFuZCB1Ym9vdCBkbyB0aGUgc2FtZS4KClNpZ25lZC1vZmYtYnk6IFZp
bmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KQ2M6IERpY2sgT2xzc29uIDxo
aUBzZW56aWxsYS5pbz4KQ28tYXV0aG9yZWQtYnk6IEFuZ2VsbyBDb21wYWdudWNjaSA8YW5nZWxv
LmNvbXBhZ251Y2NpQGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBBbmdlbG8gQ29tcGFnbnVjY2kgPGFu
Z2Vsby5jb21wYWdudWNjaUBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZ2VsbyBDb21wYWdu
dWNjaSA8YW5nZWxvLmNvbXBhZ251Y2NpQGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMgdjEgLT4gdjI6
CiAgLSByZWJhc2Ugb24gbWFzdGVyOiB0aGUgZGVmYXVsdCB2ZXJzaW9uIGlzIG5vdyBlZGsyLXN0
YWJsZTIwMjYwOAogIC0gc2tpcCB0aGUgaGFzaCBjaGVjayBmb3IgY3VzdG9tIHZlcnNpb25zLCBv
dGhlcndpc2UgdGhlIGRvd25sb2FkCiAgICBmYWlscyB3aXRoICJObyBoYXNoIGZvdW5kIgogIC0g
c2F5IGluIHRoZSBoZWxwIHRleHQgdGhhdCBjdXN0b20gdmVyc2lvbnMgbXVzdCBiZSBlZGsyLXN0
YWJsZTIwMjYwNQogICAgb3IgbGF0ZXI6IG9sZGVyIHZlcnNpb25zIHVzZSB0aGUgcmVtb3ZlZCBH
Q0M1IHRvb2xjaGFpbiBuYW1lCgpTdXBlcnNlZGVzIHYxOiBodHRwczovL3BhdGNod29yay5idWls
ZHJvb3Qub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjUwNDExMTcyOTQ0LjEzNzkwNDMt
Mi12aW5jZW50LnN0ZWhsZUBhcm0uY29tLwpBbHNvIHN1cGVyc2VkZXMgdGhpcyBvbGRlciBwYXRj
aCBmb3IgdGhlIHNhbWUgZmVhdHVyZToKaHR0cHM6Ly9wYXRjaHdvcmsuYnVpbGRyb290Lm9yZy9w
cm9qZWN0L2J1aWxkcm9vdC9wYXRjaC90ZW5jZW50XzhGRkIwNkY2N0ZBNTI0QjJEOTBEMDUxOTMx
QjFGMDA4MjQwNUBxcS5jb20vCgogYm9vdC9lZGsyL0NvbmZpZy5pbiB8IDI3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKwogYm9vdC9lZGsyL2VkazIubWsgICB8IDIwICsrKysrKysrKysrKysr
KysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9ib290L2VkazIvQ29uZmlnLmluIGIvYm9vdC9lZGsyL0NvbmZpZy5pbgpp
bmRleCAyZjQ3MzdmYWI5Li42M2Y0NGNlNTBlIDEwMDY0NAotLS0gYS9ib290L2VkazIvQ29uZmln
LmluCisrKyBiL2Jvb3QvZWRrMi9Db25maWcuaW4KQEAgLTIxLDYgKzIxLDMzIEBAIGNvbmZpZyBC
UjJfVEFSR0VUX0VESzIKIAogaWYgQlIyX1RBUkdFVF9FREsyCiAKK2Nob2ljZQorCXByb21wdCAi
RURLMiB2ZXJzaW9uIgorCWRlZmF1bHQgQlIyX1RBUkdFVF9FREsyX0xBVEVTVAorCWhlbHAKKwkg
IFNlbGVjdCB0aGUgc3BlY2lmaWMgRURLMiB2ZXJzaW9uIHlvdSB3YW50IHRvIHVzZQorCitjb25m
aWcgQlIyX1RBUkdFVF9FREsyX0xBVEVTVAorCWJvb2wgImVkazItc3RhYmxlMjAyNjA4IgorCitj
b25maWcgQlIyX1RBUkdFVF9FREsyX0NVU1RPTV9WRVJTSU9OCisJYm9vbCAiQ3VzdG9tIHZlcnNp
b24iCisJaGVscAorCSAgVGhpcyBvcHRpb24gYWxsb3dzIHRvIHVzZSBhIHNwZWNpZmljIG9mZmlj
aWFsIHZlcnNpb24KKwkgIChlZGsyLXN0YWJsZTIwMjYwNSBvciBsYXRlcikuCisKK2VuZGNob2lj
ZQorCitjb25maWcgQlIyX1RBUkdFVF9FREsyX0NVU1RPTV9WRVJTSU9OX1ZBTFVFCisJc3RyaW5n
ICJFREsyIHZlcnNpb24iCisJZGVwZW5kcyBvbiBCUjJfVEFSR0VUX0VESzJfQ1VTVE9NX1ZFUlNJ
T04KKworY29uZmlnIEJSMl9UQVJHRVRfRURLMl9WRVJTSU9OCisJc3RyaW5nCisJZGVmYXVsdCAi
ZWRrMi1zdGFibGUyMDI2MDgiIGlmIEJSMl9UQVJHRVRfRURLMl9MQVRFU1QKKwlkZWZhdWx0IEJS
Ml9UQVJHRVRfRURLMl9DVVNUT01fVkVSU0lPTl9WQUxVRSBcCisJICAgICAgICBpZiBCUjJfVEFS
R0VUX0VESzJfQ1VTVE9NX1ZFUlNJT04KKwogY2hvaWNlCiAJcHJvbXB0ICJQbGF0Zm9ybSIKIAlk
ZWZhdWx0IEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9PVk1GX0xPT05HQVJDSDY0IGlmIFwKZGlm
ZiAtLWdpdCBhL2Jvb3QvZWRrMi9lZGsyLm1rIGIvYm9vdC9lZGsyL2VkazIubWsKaW5kZXggODFh
OWRmZGRkMy4uYTA3MzJjZDNjYSAxMDA2NDQKLS0tIGEvYm9vdC9lZGsyL2VkazIubWsKKysrIGIv
Ym9vdC9lZGsyL2VkazIubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwogCi1FREsyX1ZFUlNJT04gPSBlZGsyLXN0YWJsZTIwMjYwOAorRURLMl9WRVJTSU9OID0g
JChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfRURLMl9WRVJTSU9OKSkKIEVESzJfU0lURSA9IGh0
dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMgogRURLMl9TSVRFX01FVEhPRCA9IGdpdAog
RURLMl9MSUNFTlNFID0gQlNELTItQ2xhdXNlLVBhdGVudApAQCAtMTQsNiArMTQsMTAgQEAgRURL
Ml9ERVBFTkRFTkNJRVMgPSBlZGsyLXBsYXRmb3JtcyBob3N0LXB5dGhvbjMgaG9zdC1hY3BpY2Eg
aG9zdC11dGlsLWxpbnV4CiBFREsyX0lOU1RBTExfVEFSR0VUID0gTk8KIEVESzJfSU5TVEFMTF9J
TUFHRVMgPSBZRVMKIAoraWZlcSAoJChCUjJfVEFSR0VUX0VESzIpOiQoQlIyX1RBUkdFVF9FREsy
X0xBVEVTVCkseTopCitCUl9OT19DSEVDS19IQVNIX0ZPUiArPSAkKEVESzJfU09VUkNFKQorZW5k
aWYKKwogaWZlcSAoJChCUjJfRU5BQkxFX0RFQlVHKSx5KQogRURLMl9CVUlMRF9UWVBFID0gREVC
VUcKIGlmZXEgKCQoQlIyX1RBUkdFVF9FREsyX09WTUZfREVCVUdfT05fU0VSSUFMKSx5KQpAQCAt
MTU5LDQgKzE2MywxOCBAQCBkZWZpbmUgRURLMl9JTlNUQUxMX0lNQUdFU19DTURTCiAJY3AgLWYg
JChARCkvQnVpbGQvJChFREsyX0JVSUxEX0RJUikvJChFREsyX0JVSUxEX1RZUEUpX0dDQy9GVi8q
LmZkICQoQklOQVJJRVNfRElSKQogZW5kZWYKIAoraWZlcSAoJChCUjJfVEFSR0VUX0VESzIpJChC
Ul9CVUlMRElORykseXkpCisKKyMKKyMgQ2hlY2sgY3VzdG9tIHZlcnNpb24gb3B0aW9uCisjCitp
ZmVxICgkKEJSMl9UQVJHRVRfRURLMl9DVVNUT01fVkVSU0lPTikseSkKK2lmZXEgKCQoY2FsbCBx
c3RyaXAsJChCUjJfVEFSR0VUX0VESzJfQ1VTVE9NX1ZFUlNJT05fVkFMVUUpKSwpCiskKGVycm9y
IE5vIGN1c3RvbSBlZGsyIHZlcnNpb24gc3BlY2lmaWVkLiBcCisJQ2hlY2sgeW91ciBCUjJfVEFS
R0VUX0VESzJfQ1VTVE9NX1ZFUlNJT05fVkFMVUUgc2V0dGluZykKK2VuZGlmCitlbmRpZgorCitl
bmRpZiAjIEJSMl9UQVJHRVRfRURLMiBhbmQgQlJfQlVJTERJTkcKKwogJChldmFsICQoZ2VuZXJp
Yy1wYWNrYWdlKSkKLS0gCjIuNTMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
