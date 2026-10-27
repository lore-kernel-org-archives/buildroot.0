Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DF4606A320
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m2TF93RH;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lU+oIIut
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC14C8103B;
	Tue, 27 Oct 2026 16:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lx1JToEqrw9d; Tue, 27 Oct 2026 16:40:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0B9278101D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119240;
	b=XgG0GSFxlkmdw6qJgl//3fsJ7zog6BDvqxj+8Xa6aTRDwjWaWPdofx7UtyRMi0vDY74f
	 e84XbaQcQNHzAZh7pxID5QhJ/6odVrj9pwOrJ0neef9CJeMWQGQ0H+/aq+aBiC4OpUvG0
	 CSHICVzI2TqmzILeGehGvflQZ1d8vlctqUl/hYrwjbV5jUA66QpvSNOEOMv6RgWJJATaj
	 SY/RQBCd9eg6bpkgT3WPsCKZ+6eGoamCdh4gxiboAzPBgzzSH9/7XYP55A2ouJ55EnLkV
	 YcAjJKBAxvNDCFG77maNzgOCw52X65/5zh7NtLjGbkUkqRfvBt03HcT6yCGY01UxZOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119240;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=gOffDtMdQ6r9fEDaM4k6AUat3UnpiTxmuhOEs+BS28U=;
	b=FFh9QVjebIc4rJRC0/AWyIU9bSY72pWJS7BaUxA3l1oBJ5H2OObE1Tds+zT53+1c5JAD
	 cmPUt0PuW0XKP1Qa0i3EFOJKiuPdJeUyD9S0keQBll1sg/0thrzhYRKofe32hH5g1z250
	 9xBe5iHfrxMvTaarUDLvzVNDNxzDPNmBY35WwKDu7o4GxO/P8KBSAqmmnOthfIou92p+l
	 7rr6P+FKwluaWZVJRYK5EH4EdTqHo38T7shHXTtDQo2qj3oEi3IgCl4VprTzbEVSl6XHt
	 ejhooZiIg2+s25otoT8uaq0YBMbYnUzv1fO5mi3A4WJ5GywfiZenZ6NT8Di4VSWrg6g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119240;
	bh=gOffDtMdQ6r9fEDaM4k6AUat3UnpiTxmuhOEs+BS28U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=m2TF93RH9uYcnfkWUbS1Pi2Hk6kg7hronr3OIp15i/2jGAmV3/8M2NJ14ZhrdDfbW
	 G553UW9RacBUN8oqAqRwaOJhnnv3LxkiibIbyCgCcxXcklkmJ2iKUT52++H26P7bJJ
	 SlD5hhpLVA6lZTNblJQ2jd40qTg0Vse4zoO4479/o6fAj01cE3ZDkVKDrBLFAY8t/J
	 /4LNdZpZQfoqbsDc2IQZzD0MSGsvrs9lcvdTFFLluk4K/HHa1mq4640z2lOb1xIzTn
	 4fkUSd1Kr3bFKO9UZySYnOEw/pk4L+K6gFBZZBO58ESTn4X+QF+5Z0ouRcU3BYJgYD
	 xoUe+AHPsmvSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B9278101D;
	Tue, 27 Oct 2026 16:40:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4D9B4BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 866A66073B
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZtyUl9wKGyV for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:40:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AEE36607BC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119227;
 b=PzLFjdzwKLj7DyplKM2FIqfeKK7z3TTUuw13xF/C1yCdvxwFxp8msNuduMk0VfpT9ykW
 ACcBJSBatjgcGBaJOZdGLLzSldM2L5pUaCvo3VH8qHGcaSFLN/JUb/Mp7fk2gU+8eigQ4
 aibKPxDTQhCi+g7NUOrXJYp2DZ4SOTrvhEofkwyuw1hvnqC+ZCXdTk+Qed6+SK/wBiRSK
 uTZO55hTMV3uLUIlRtBxqdtpDQJYaag3XZRvzhUKN4mvIPMNNVIYZxEQrE0sGdQ4+snmK
 lXfYs/HmV8sZt4Gkxe7mcrY94sFkBa8XaiqjmGWLmqQLkfJCWr1T9cjXdA25SvtHaRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119227;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3uqztFCGlG1hakyrkC6pkx/bIkqduxVjKqg42k9NN98=;
 b=Skj1gotCMdx8CCLq0USVF7wKk2F0QFZlTORT/ceBzZ7LEWlHNVP0yrUE8T1aDfuIttcl
 n7IBrqjR3vRPFTuSLCFIeJXOAeoSmTW4pUg5WHjRI1soG5brohNFQm76n+Oa5OBc5GX+v
 h/w52CXVM6PkKOeoN12xpuY7W+eScOXZq+o0X5j1/fwm//S9TkazICKUEPqypGpdd99kz
 Lw3WI6Ool/KyX/4M2nC3TJHYy0Me+/4vfotv0ZOmawbKVQE+btOnb3cuEjmoz/p1WShjV
 NSwxWd3MkHZxOW1dlRvfYBzuy3p6G81DU7M0th+6HwAVDXktFOKG3LdYx+y24wUGJ+g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lU+oIIut; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::530"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lU+oIIut
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEE36607BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:26 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6acbe0e4090so15399a12.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793119224; x=1793724024;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3uqztFCGlG1hakyrkC6pkx/bIkqduxVjKqg42k9NN98=;
 b=lU+oIIutVz5T8CDs89cV9VJXAMcRxAFjbRvOe7JYAspyLOvAZnW8vv1ULQ930e9hL/
 yZj8ydzyMknkc6UfAyZfT483QLcBtCcERZjyIC8KSEIqiY3usDPJmpS0LhkldiNBINlp
 Ko2dOEfy7Q3W7ae66S5RzwT+jUvZR0Rk+1ucw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119224; x=1793724024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3uqztFCGlG1hakyrkC6pkx/bIkqduxVjKqg42k9NN98=;
 b=K1I9E8X4xdv4ntl2pqRb0WqvAgxN2pimuJwkYiQd7qqsEzGJb0nhonX31gGpocl6VO
 yQL7RrwzM4dfNE9Od7Ev/dlhmfzmCmmV9ooULPF4jQrKAEtrtQaX7K9JBfL0IcqQyh6k
 JTpV/ZgQKIXnADSxfikFZ5hMWTIczMpikFzgfOSd5bRZDOfTZTE5aqRXNDkvW4MOeIRW
 Zq/EXcaC0H85PZqjxUx7hbOVDFh2cd9RrNRGPNBbQiP8za2xhsNkSr5LWW6KLiSn5nvk
 s3mxy/9YkXkWw6OhjQXRljw+Ls4Z1DzSmkcPH78hK8GfvPYmtyL3R+MEU7CpHtb8EyMt
 Iqmg==
X-Gm-Message-State: AFq9FYJtYft4jWLqbflGa3Lc+GBfxfISp650QZuMufP90bDaSMQsmUS4
 WcEzuhNa+R67IKTXCyDytPiMeZ0o+KAkchV62t2CNj92BsAemFrvPcchCchENV1eXQIIIVrZwtl
 a3qaT4pU=
X-Gm-Gg: AYBFou2E1yrXED0qZrhsF3qyDqqMRS2kVFP9Zv7quDapAMRhw+LC2PLj3jinMUcGAdV
 XgyH0c42J61yu8myAI2P0nmMUGqPMdh7XPJpXrRwoGXU8R1/TeiCaIO6Ax4WXxHbP15xqKXbqjJ
 1eCpgoGLN06O5JaXkr2WW0hI/5xEwkmBdJ005k+XrjmA3nVV+Fi0+WPWt9GZaO7O+313ZnZzE1X
 RKy7qrfl7YMzI4HOMGaFbA9T4zhpluS6UBG6lLBJ9Zdu0GdzKyzHNJwp6sp39XLoKIomFqOzfzo
 dW6e6kfHbRk6l7a+wK/KHcY7csSlVhTTGdOkxdYAWjm8omG0YrnNPskJMzzCGKjg5+cq4cwdS50
 thSfhu4pmYQn0DezWFm8KSRLHpmk0ZkUlpYIviJugTN6MJGzZ0GQL44yyrUGCZ3nNancT/bhO1N
 c/m4S4suJevM10/Fl7y3TqxohQjEJQiAiYYqBedjyDWcQ5/aPeTDtJ9gjfUSayi+9MY3AR73+Ml
 B2JubdkdBNYBP9uFleXLNAKHWy7n0enmEOEeQ+zITSVYF3jE94x+NNFS6rKyiDsfS3hWIcxYDXP
 xNXRvlmqu17Nz1hGRjU7AsndTzTwfxwR07kn6sNYyjzoppikTkS/bkCw9UVhJZZfYCuZjd84k8o
 3EhczU3wPwn0FoaxCqTQ3FBH2YygoW+/8FuwTZ3pjkObthrY8pAJ4kiMQaIdK5w==
X-Received: by 2002:a17:906:aacf:b0:c34:db91:aa1e with SMTP id
 a640c23a62f3a-c46bdbfef75mr1143713766b.4.1793119224096; 
 Tue, 27 Oct 2026 09:40:24 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79683csm479171966b.69.2026.10.27.09.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:40:23 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:40:08 +0100
Message-ID: <20261027164013.1602502-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 11/14] board/mender/x86_64: add a udev rule
 to create /dev/root
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As /dev/root does not appear automatically, add a rule to
create /dev/root. Without this rule, even running a simple command
outputs the following warning:

```
WARN[0000] Could not resolve path link: /dev/root Attempting to continue
WARN[0000] Could not resolve path link: /dev/root Attempting to continue
```

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules

diff --git a/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules b/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
new file mode 100644
index 0000000000..7d2ae8cb89
--- /dev/null
+++ b/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
@@ -0,0 +1 @@
+SUBSYSTEM=="block", ACTION=="add|change", PROGRAM="/bin/grep -q root=/dev/%k /proc/cmdline", SYMLINK+="root"
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
