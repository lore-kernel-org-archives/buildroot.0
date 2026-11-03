Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163B76082BCE
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 10:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M2uI2mEA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4AB2405E2;
	Tue,  3 Nov 2026 10:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRTrCTcKGqDV; Tue,  3 Nov 2026 10:23:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D2812405CF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793701426;
	b=eZXLExlXowb9w5lmzRTbY+SAZYcGbzGnhn1M2UBUuKovpVSKgVR5zZXAWlEYIDhYkFqZ
	 7a0S1GzLzGRCl7zfSn8ZCUtfSV3Fm4cpjDZzizzEFbqcuGUai47SC+fhE6m+PZydWOjwC
	 uMfNy+fzJ4lscKznaP4phRpiMo5AYC9dL6/MzYwWtgNbOyM3ruhF6QOzYEV+zfoiifKzr
	 BhEqc6jMgXrw1nLcJOb28PhKbvH6PyAQcZdCdaK7fx3BRVdJiuQaYmr56wxU4x1bEPqa5
	 V7KCUXWz3a7BvccqzbS0JVuvx3L+35B3l37NENG6NfkYkY68O31qJAi71k4YYoIeVVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793701426;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=D350nY3IQH7FE34OsZIImM8eujXOV0p8DA6bFgWqAD4=;
	b=mOJ+TJecuk9IDW37t5UWkDjOKc2UCa7FyMShH6KwWPTU62SFanTkJG8k0/0urJ+JRva1
	 16TZCP0UiknVmK2zn5uuELE24heRqn6WpH0qknkkdaL4hhJ5b+kNL+kZaCmwUBWAS3VIC
	 pYdiCTYNuzCzrf8VYKNzCc8hT9JQc+esrwJPs94tvVNnYODQmq1kz83/7HONe4lgAmBfN
	 +RORZ8/xJgCrBwig39KwDvX39PLxvQLeHGpbphGY8OzJnVnTwFLJLl2ecanW4AtYCfMMo
	 d+sfNQpd+XjlX/GBIhZlJFo+5MOQngCgIZCCay/BaKerD+EjhkkK6eF8CtvvptaS0bw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793701425;
	bh=D350nY3IQH7FE34OsZIImM8eujXOV0p8DA6bFgWqAD4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=M2uI2mEAshJzzcAezy8XsnV30X36m3qaKsEj3ts0Ox738euzQ9wimk4XiTAejNctp
	 7jyEla6+zY3IIinISSbC1dq5xtnuey6XgksGz+UszmYeE2rZd5bXHPQMj7OLn55Y/J
	 KSGdw0D6M18XjuzNASmBV7Lakg3x/NNliXc2K9S7Lqd9gd6GOGa4yVpobRV7VcPliX
	 5JuZNRiKlAfaIeMsVy+JE/lA6/OTxCH+19GdaSy9MU23ApYzHdm8uig4sMUM8iv1yi
	 5/11Xfk9G6WwhdjwPF4JwOlUJ5jfq0wnh44tGg1dJnYRGEg0YXNZ1CbSs7+u6SRzTa
	 JROF3/iTd71TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2812405CF;
	Tue,  3 Nov 2026 10:23:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0489ED3A
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7542400B1
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ex-MjPdRsx5S for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 10:23:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B53434005E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793701424;
 b=K6bY09zIb3itWIdrWghHYbqjxvfaXjt3+szirEFzVQeZjeo1DTyNWuyGx9z7mH7SWm/b
 JrYkexSq8IVKZW5Rn9bbEh0F8/wmqkWJS1gbelG8LC8qQQt+L/J7O6bU50wGnmkykRP3C
 r94f0I6KnzEIX0VW4J3RyVO84L8Q33ipRctTi550L9ik6KW+BCh3otB4bo6ztLEcwG0+U
 jwEL0CS7maBg043Q1vhLKfS2SNgnMnA1QgZ0FG/yjPoOoWirDiT3KzJccslSMtQoFMsjs
 Ogm0PmfL/MOT8PTCxQmiFJ2h6pn2JofGl6qyC/oofxj+mS3WLw1CWwTi2PMbzt/N98Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793701424;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=FV24tPRfWDhqw7s8FwOokE91I3cr88FDxflH8X7mFiM=;
 b=OnxVXeHgRB9zA6NfFvkJTm5MQeN8g9VxHVg+XrZXb9YhLQsvDCy8NAVF9okN5fUrq5IZ
 0mY+pFv8dI/EhF2aWssrcwOIM4QrNoL4wIbirLHYmWxqU7YX6XsI5qJ8O6axdnsyDgXNC
 zP2VQK//P+88hKkFywwaAtsUaD3ufdlBMFhDogxLEAEWUKw+ypj9Lai/5VUmwlTkiEB15
 YwifQk2h2rAUn+t/IKBAoneD7IYUgXJA6v6m9QpNycUhkzPgMB3SLAF8uficdUwvB6UpJ
 IYUgd86wxMsqzlTRmcb0knmJTeGrGXCfnpxgxnRcjaovYp8c6pcqY8V+gv/hcTuWxqA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KxONM79Q; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B53434005E
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:23:42 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so1953842f8f.2
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 02:23:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793701420; x=1794306220;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FV24tPRfWDhqw7s8FwOokE91I3cr88FDxflH8X7mFiM=;
 b=EeEDmRBhd/s/JuhphYTg6oMngxmy0s5a3JXnjXJN+hHm7NxYTepmtAsqKfSiG+9uwd
 fgxs9oJhXpEkwPUGnlN/zIPJwe+GukSFu5BGUrnZ7FvNXgBWXM8xYKoJvnjniZm4U6c7
 muvggPRx5WpsSE/KRkcNYtMNvEJQ5Fzos5t47BElBGRuXGlM7y2bI1XA3MmnvE5sOmp0
 24Y/OH922d1CCbeuvgFZphfG7RUBRZVJRuS40S+ZS8EeXk8ao+5o1c89IzYNF65TbOC0
 +dAiuYodi2CzApBkEbkB/Y3F7cDcrPpx1PuDxf3Pb7mKzUcCNt7M44X0u63rlD06WjbN
 H3MQ==
X-Gm-Message-State: APuU4Z/BIcjX2NrPsArjyuS1Y+eLT4/rH/uTLNrWv7V/wdd1HRA2zBhM
 sAySNafsPCqjPdxGM5E0Ut2s9cjYn+XQBsfEpR2x8fy2Bc1Xsj7xnvsT7PcJXsBwfbI0rF2XYlU
 d+9H4dVM=
X-Gm-Gg: AYBFou2tbaSx9hqegB9Eb1IWtccxFBUqItpH0k4BWX8HPzK8/s8MWbmc0yflnWsMQQP
 5LsKUFNTl9CA7J10+vQMva5PH9TjBycJJ2rtlcnKZMbRqel6/GrNtCc2ATJgjeh+17M0kNIiQl1
 sxKZzpZnxrKsdt0jQ1p3aCC5ySYUMjykLXJlug5RzhpirrOaYJYb/0wYdG9cp6Fu8mYOLwMlNh+
 am2MLxCVrfw9BUF9cf7nkXF+PgD7FPDtU0105gilTkz4ZY9Itu0AOGc1e/xRSWJzDFpu56VGmtK
 H6galmeCXDwZK3sVtu8VqwQHJv0tMFuPcMzXBQ+JZPSjug7QdDcA5p2SSZhMtqV4LEjFcgcddnp
 y4s+EQ1uv1a9dKwik8oVfroO9ht+pLuuiM3v3VJ1d9KbinVI9qCyYiJcZD6ARwnTN5u1hkzERir
 aJ/rVxf4/ZrS1ED91iPPAW+p8QWPy2o9UEExVOhh9+R4tinEzDoa9SVUijJSBKRXGP9hbhcKWvn
 yR9UOJsvL8NDfXuMAW4ZHEX42ftSq3wixVRL6VNrTTcOs3Iq/whFJazgOY+c2UxHI4LF4FUGbPN
 /4jlkjfdrxmuLeZkfqMYNegRjnrHdYU=
X-Received: by 2002:a05:6000:4a19:b0:488:8bc1:a2eb with SMTP id
 ffacd0b85a97d-48e6e308b00mr28013945f8f.39.1793701420563; 
 Tue, 03 Nov 2026 02:23:40 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71a4d4f9sm24619473f8f.2.2026.11.03.02.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 02:23:40 -0800 (PST)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be, titouan.christophe@mind.be,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Tue,  3 Nov 2026 11:23:32 +0100
Message-ID: <20261103102334.180654-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/composer: security bump to version
 2.11.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Q29tcG9zZXIgMi41LjggYnVuZGxlcyBjb21wb3Nlci9jYS1idW5kbGUgMS4zLjUsIHdoaWNoIHN0
aWxsIGNvbnRhaW5zCnRoZSBlbVNpZ24gRUNDIFJvb3QgQ0EgLSBHMyBhbmQgQUFBIENlcnRpZmlj
YXRlIFNlcnZpY2VzIHJvb3RzIHRvIHdoaWNoCnRoZSBjb21wcm9taXNlZCBlTXVkaHJhIGludGVy
bWVkaWF0ZSBDQXMgY2hhaW4gKFsxXSkuCgpDb21wb3NlciAyLjExLjAgdXBkYXRlcyBjb21wb3Nl
ci9jYS1idW5kbGUgdG8gMS42LjAsIHdoaWNoIG5vIGxvbmdlcgpjb250YWlucyB0aGVzZSByb290
cywgYW5kIGFsc28gcmVqZWN0cyBUTFMgY29ubmVjdGlvbnMgcHJlc2VudGluZyB0aGUKY29tcHJv
bWlzZWQgaW50ZXJtZWRpYXRlcyBldmVuIHdoZW4gdGhlIHN5c3RlbSBDQSBzdG9yZSBzdGlsbCB0
cnVzdHMKdGhlaXIgcm9vdHMgWzJdLiAyLjExLjEgaXMgdGhlIGxhdGVzdCByZWxlYXNlLgoKVGhp
cyBhbHNvIGluY2x1ZGVzIHRoZSBvdGhlciBzZWN1cml0eSBmaXhlcyByZWxlYXNlZCBzaW5jZSAy
LjUuOCAoc2VlCnRoZSBwYWNrYWdlJ3MgY2hhbmdlbG9nIGZvciB0aGUgY29tcGxldGUgbGlzdCku
CgpDb21wb3NlciAyLjExLnggcmVxdWlyZXMgUEhQID49IDcuMi41LCB3aGljaCBob3N0LXBocCBz
YXRpc2ZpZXMuCgpSZWxlYXNlIG5vdGVzOiBodHRwczovL2dpdGh1Yi5jb20vY29tcG9zZXIvY29t
cG9zZXIvcmVsZWFzZXMvdGFnLzIuMTEuMQpDaGFuZ2Vsb2c6IGh0dHBzOi8vZ2l0aHViLmNvbS9j
b21wb3Nlci9jb21wb3Nlci9ibG9iLzIuMTEuMS9DSEFOR0VMT0cubWQKClsxXTogaHR0cHM6Ly9l
bXVkaHJhLndlLWhhdmUtYS1wcm9ibGVtLmNvbS8KWzJdOiBodHRwczovL2dpdGh1Yi5jb20vY29t
cG9zZXIvY29tcG9zZXIvcHVsbC8xMzE0NgoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90
dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvY29tcG9zZXIvY29tcG9z
ZXIuaGFzaCB8IDIgKy0KIHBhY2thZ2UvY29tcG9zZXIvY29tcG9zZXIubWsgICB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvY29tcG9zZXIvY29tcG9zZXIuaGFzaCBiL3BhY2thZ2UvY29tcG9zZXIvY29t
cG9zZXIuaGFzaAppbmRleCAxMjNkNmRlMWJlLi4wMjAwMmZhN2EzIDEwMDY0NAotLS0gYS9wYWNr
YWdlL2NvbXBvc2VyL2NvbXBvc2VyLmhhc2gKKysrIGIvcGFja2FnZS9jb21wb3Nlci9jb21wb3Nl
ci5oYXNoCkBAIC0xLDQgKzEsNCBAQAogIyBIYXNoIGZyb20gaHR0cHM6Ly9nZXRjb21wb3Nlci5v
cmcvZG93bmxvYWQvCi1zaGEyNTYgIGYwNzkzNGZhZDQ0ZjkwNDhjMGRjODc1YTUwNmNjYTMxY2My
Nzk0ZDZhZWJmYzE4NjdmM2IxZmJmNDhkY2UyYzUgIGNvbXBvc2VyLTIuNS44LnBoYXIKK3NoYTI1
NiAgNmYxYjg5MWUxZDQ5MjdkNjI3NDAyNzZjNTQwZmI0OTBlNDc2ODllMTllMTAyYzQ5ZThkYTg0
OTc5NDg4MmY4YyAgY29tcG9zZXItMi4xMS4xLnBoYXIKICMgTG9jYWxseSBjYWxjdWxhdGVkCiBz
aGEyNTYgIGM4Y2NlNGI2Yjk3MjlmMjY0ZmZkZjkyOTZkNTA1ZDYzNDMyNDk3ZmVlZWQxZjU4NmQx
OTAyYjk0MjE5N2UwMjQgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvY29tcG9zZXIvY29t
cG9zZXIubWsgYi9wYWNrYWdlL2NvbXBvc2VyL2NvbXBvc2VyLm1rCmluZGV4IDVhZGU5Y2NjY2Yu
LmQ1MDlkYzYxN2UgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvY29tcG9zZXIvY29tcG9zZXIubWsKKysr
IGIvcGFja2FnZS9jb21wb3Nlci9jb21wb3Nlci5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCiAKLUNPTVBPU0VSX1ZFUlNJT04gPSAyLjUuOAorQ09NUE9TRVJf
VkVSU0lPTiA9IDIuMTEuMQogQ09NUE9TRVJfU09VUkNFID0gY29tcG9zZXItJChDT01QT1NFUl9W
RVJTSU9OKS5waGFyCiAjIEhlcmUsIHdlIHBhc3MgYSBkdW1teSBVUkwgcGFyYW1ldGVyIGluIG9y
ZGVyIHRvIGNvbnRyb2wgdGhlIG5hbWUgdGhlIGZpbGUKICMgd2lsbCBoYXZlIG9uY2UgZG93bmxv
YWRlZC4KLS0gCjIuNTQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
