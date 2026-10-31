Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B7B606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=boWIZaFy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iN/cAsU8
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E87E6078F;
	Sat, 31 Oct 2026 17:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzAMHvzEI1l1; Sat, 31 Oct 2026 17:20:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 87820607FD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467256;
	b=JzkWNzcyFPL2BqCXcs3Ocu0X1zUwbjr5YIavprQx4Mf6/OQH1uVRX8iXIM2Lf6rENul1
	 F8HP003itH71+QhmjoY90B+HQV9Wcdg4OCEJKOctU/nt/H+5oR2RgOR8+SYkhuC/UHwx4
	 o6QQPpw/26C/pELanrepYXai/WbM8XEW4W4F3bVyHaaiHlZ8yOrl4VVyYyC7JjB+g+yfy
	 SM1yns8D91tgt68bHreDSZZpYlDu5az0LZxHLNgdqSUzv4QPZHHE6Qz0kcS0JwqXUGnZN
	 uo6UWNuVtIsQBUIdx1hm4IENZuwZUBISygy9shqr9+LV9QLMMPN8TXloBDTqO1W1zhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zV0TZXT9fXxK9MWa9/y9OsdGjGYdXVJxUzZsGM45lF8=;
	b=YPnvb9TuMeCtK8A2RXmTN1Bt+9mEPhX+0hgYQdzwEH0wLxERY/T327T85qPlPPQCDtVX
	 +/x37aNI3t9ufqtRMJRyyJ9Q3TRU9/FphxRJZYjLcOn4S4PJUQQqywistBvwrrefr2nnu
	 lRIi23WjOxp4GLysJzw/UTsMPStjBjvGuxEzV/KNtt/wfPRYEq9Z2BGwgbzqEKyxxo+Sh
	 c6z6UfCNHLVKGGkhWoluMyAQQpHwZ5E9vU0nmIA/4KEj0bH+dqxpDduQekaq0nVNBDejR
	 t8At5JJ9cMAVJmAcv21ChObAefKjy5huVU5wfw5LJQDt2tO212sV1H4XesACk+lnszg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467256;
	bh=zV0TZXT9fXxK9MWa9/y9OsdGjGYdXVJxUzZsGM45lF8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=boWIZaFyNQbGHgO1IYd6Ksg5sp8obccZvCNNb0HGRW4TOmVtOlnJESzx3XXk14J5M
	 w+UKzDpwWDJSZNduqgMNMQvlPlHNL/+IfjqDx03Q+ciUt1d9iGK3Xg01u+7L1LzMcP
	 J9kWNGRqYMfMXH3/a3gIwdI2vknaE3ZMSjwfSGZukX8i8up9ZLdFRH6/IhT4cSLb/G
	 2zbmuYbEVe2zvFrroIEjM9lxW+pBmOrTnUzEpLY8lOTgPN+zDsajli+v45qsmlLXm7
	 P9I/iD82rguwDIZmXvr5EnMsVoCdWbcQssa8MchcxO7W3MkiQh76TS9dvolJZ50Z21
	 YckOoHFBx1x6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87820607FD;
	Sat, 31 Oct 2026 17:20:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 019C94E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC42C40012
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgVVrVxMeyF8 for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0A4BE40269
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467245;
 b=XjhF3C33BsunTrZVj08vlYBJu0o1h/d13T7Q9M1sCd9+HrP4DI6uW3pmfgE3Hpz3tcsK
 OJgpKQ77k2ijkmoyp96bTg7PcZYaf7xyeHKrXJNOPwo4mWJ5Z+Xif70jdSM9GJ8a4A6Qi
 gDJjT1gP3OJvSRl3V5FXjMF1uDLAyUQ9irAvgtzZuappHf3dK49Iy1nePCbLFn+331gfZ
 G9p3IVHLuzWLaRkugNH3kqKL6+nmOg61dpp1MT3pSlwxDxJsPNuHr6NX9XVObwUufE80Z
 RbdLIw+YkUMd+jGhLhmbDJ7Z7rVTqW37j55HUL7g457Fdh9WSR8pla4YX2Agpv4GBJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467245;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=PY+stQSgHQL0ncNJKTZsPKQFbBxVv2JypCIv8C0wjIo=;
 b=pyQWxGafVPlxQ3y7DhwlGgcpbJg0y7hPzU4ROhmguaNZWK1cl2NusJ9tnxxbSdcU6V69
 29SWgRmwqXC5IIPBZjmlFGIqcdWSOfN1ZqCLYKOod3W3otm5Y2+zh7+F67hWiLg+oBwkY
 pmbDG0ExWZ5YAMjLKF1Q6uoDbifahMGP7QrbXSDglwANLSaer3j7dbrH41uP6jN2bhYRp
 1R3VRUdIhj+3mlEMo6rOU4RGuykStc5XpCjXKWI+FL8BWqU4R+NPYp+4qnIFcnlKLZNFy
 k7Ni7cB1g5A0KZkrjRjvBDBYUJdMGmaclYk9j9kG6UORWXXnEz3Xx1Hf6OT2v5pFfag==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="iN/cAsU8"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=iN/cAsU8
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A4BE40269
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:44 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-84d5e56f876so1224614a34.3
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467244; x=1794072044; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PY+stQSgHQL0ncNJKTZsPKQFbBxVv2JypCIv8C0wjIo=;
 b=iN/cAsU8hTAObyzPnlpLceTuANbfq82p5OOLdPPFutdtXo9fHy6K7lC5jOf4Et3jWY
 1zktU0K5Z07SeNRxbqSJu/NA7bl6dC1Dy08Io+MnhAISariDfPszb+8MKYbU+rOnZpti
 meX40VkoCUq7mu2KlqXbzcGijIVYLHISZK67NMzO5mm0jZohsg63viMy8fYAqEOPL3Md
 2/DdtJ5ijenpOf91LqG3CcknielHihPp8/KvnrZGBcn+LGmPYN7gST1eE1sPXpAdj3BU
 ADIGB8zrCb/1XIbLP2oQCzv8s/qcwQElvnk3nQVtVty35IzyFLIL2kMdqwB165j56Uvo
 2j5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467244; x=1794072044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PY+stQSgHQL0ncNJKTZsPKQFbBxVv2JypCIv8C0wjIo=;
 b=VHpTJfYL3+LFywcjtwFDfPGG3gxg40Ouc7GiyFSOxHEpJ4RcxTFI0a5Fnmv/kSEdMA
 0hKun0RkX1xFQtQR+Sl+23TBsCQoIDPghNasaWRuBb9Zl4YIQ3WpSSLJTKedZbLm3YJa
 yBO25SiJf5IWjjLSmjXK7UdcH4HREE2+9IIDmANhDdyefn72k3tCcNSfx2k0FywXiets
 4H7yUUIp0d6KjaPk9M5EiXoSdf18I3MaaLkSxD6oQAcHYK6EQ/PNjHF6uR/c+jHJrg5/
 QyM8vH/hZr+sYPxAUfxkl9VKVmxdjyvaxAPlFjfoqrRhWVhkL0mH5qpqxOogpxjMrzzf
 1AJA==
X-Gm-Message-State: AFq9FYK15O+1ZgxeGiYHBCKdYeBnLVpfYJkOZkn/A85F1n5a3+Ag86Sl
 A5UvmlFz44od6215P63a8caTHQI960telG9ICL1ywjwdG81tcxCBqWE6lYoG6A==
X-Gm-Gg: AYBFou2kLaaKGAIXcYuEVTXDXF8YMBrxt8JVlvvNQyGG/RghsWy03CTyqznGPgN9vpF
 fUF9vUQ1T5JyOMZSB4t6LE/8MyxjLSwcKAECTz2paLKejwmVgsl7SzKBkWvknZ7Ji4Twd1banms
 sDseEZ0LGxcg4kNVJjZA/e/omcVMYpI7WVYSC1VQJTXR4phByt3z9bRVIyLjKop9kpPbeQiznEd
 oOnse1+VpN2hvfkwR9o5oK6DEspfs/HeII7uo5U6PtCK+0cFAbDd2i59SXwklNoa4zFW2Q6QMnj
 6r4PMdBfai5LsZAm+hNE63Hq3DQL/HX+thlTUSLqz7zZa0ymKBc4GncSGHKTGqcj50vLdBuW4oe
 Hs6I9VwdZD+lrY1i+u6Y7x6kMjDp4n/QKafXxRY8ot18wnfhXB90K4WAj+bF+YSzNTkowN7E3gN
 2+ILdSadI9rUUSTvmqRTjZDzfKr+3sgsiZ/ypI5C9U3H1R8o/PcmsU6jInxLgdjhHOZQzWXctqO
 l53EtSY1Mq5ln5m8rMwmDKmvykx2dWYPRkgoiSiSoHMvYWW2Zq+gfFIP9sQ6dFno9V0oB6YxLm/
 ZRw4EnpSTCxzH2q4yQR/ITta3fxGNIzmVgm4R5J9eLOmYoyahicPWk1tuTPHLF4Z51RUvykIUrO
 204gMRzd3PzCjB4or7CUA1+xlmkOqRjk/H4IsqBrV5A58G8TmnO2VE6LQMV2Wejwi4be2pY7y3r
 mZH8LiAa5+/QZHNPK2JuYBdYXWROyMAQM5P/74+BaTbvdkGV6SHV0HjqEIR0joZ2zb+PebM5TSD
 k7YEwgma2ZonxCLVM7m6Jk=
X-Received: by 2002:a05:6830:2641:b0:826:b77:adef with SMTP id
 46e09a7af769-85d363b89f1mr4218082a34.14.1793467243665; 
 Sat, 31 Oct 2026 10:20:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:42 -0600
Message-ID: <20261031172019.2683287-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-multidict: bump to version 7.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index f6e2ef09b5..837cfff240 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  fd85b7ce516e9f58c6b3029ea1c8b392  multidict-7.2.0.tar.gz
-sha256  f4110a13e264858eb00697751785cb2c58ee96707d8ded5ddb8239530d3b9ba4  multidict-7.2.0.tar.gz
+md5  3f9f08805cdffa6469e13ef33c93d091  multidict-7.2.1.tar.gz
+sha256  e8af3e6f1bdbc31fd762b094133b478b89988eaebc63cbe82b1d9e3bbd15cede  multidict-7.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 2004fb01bd..d388ab514a 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 7.2.0
+PYTHON_MULTIDICT_VERSION = 7.2.1
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/9b/18/0127fdb8aa54b1d29d5b8f752af088ad6aa47abe13adaa519377b0b331ab
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/7b/6b/29ef8e752f5854dcc267ded0652c475bec99b86f255957a0d4fcad657b18
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
