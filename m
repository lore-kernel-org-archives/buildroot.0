Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CE6C88E64
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 07:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E6EA60688;
	Mon, 14 Sep 2026 07:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uz6bbGYFLjex; Mon, 14 Sep 2026 07:42:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 169066067E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789371749;
	b=YYwwjAp08D0g1eb5eHZpfJP8+BURD/dAYPhZi54n6VXnIt38wI9CQjJ3Q6ghl2j+RLWh
	 T7lh0PKImjP+Af2Y5wW1OkE1Hmw52+WdNI344PSdtPtFIANfuUcYS8NdnTVYO6YDZa7U+
	 0c5iwiK7WF4GZjoPUTsKnHDYh3lzt9GODqkPa1ficgglaLKuw4mafofpVRENgx/H2npIf
	 eosI9DQ88au5irRAkI9am7+FxyILE22ikKHRowBeTU936QndBiyrBu81iHobsuZO3g5+b
	 wmo7grO89uGq3Nfc5D8yW4GKmoDNC8QPJJl/hS9DLtF4voWInt7Q0qNGkp3Tf8RMQcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789371749;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6Q1Ajs8lMp5GTODpmj+bIjO1Pw85QSoCWYQ3ojH68hw=;
	b=stniHLgJtQBwUaz6OvsKZKydZ6um5Pygm+2U0zHNrqQAHZ1ZlAlb44OZLhqrkqzy/MGt
	 UTHZ9jGUqvLiGI5VxPKpM6P0uCoRLPR2kg8GUh1Or/dVAyqwcqvUJ4LdkWWjkrsJfDjlt
	 IABBKME+C3+7SwFD4W3yvJabgngaDTDA69VE4+0TMDKf30aYLNpit+fO8vdV2Aaz6qNq0
	 YQMDK/K71odCyv5m2LlHYzqhS0i6/bf1wimnqOYdkr++rKscn1bwGmG2M2Efh/1CyDIW1
	 aNzdNqdW4Ftd3com6ISA7iqPT1GAsQFivNEHJdTd0P2+gNT8yCPrns23OjtrXIVSeNA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789371749;
	bh=6Q1Ajs8lMp5GTODpmj+bIjO1Pw85QSoCWYQ3ojH68hw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=JXl1AdOaIOHqPWDZWZ7bBINVuHFguXiZQx1re6J34a/S6AmdPRoAo6kFkOyv7tILV
	 6XHkAdptynsClzGw1t9XhbVDL+uAk3PeghOV+uvfOT9uLPJbclcVZgzh/f4b74Cpa8
	 x7VUYD5oZLEpXm5fqU8Dk1FG+uagt5EAxrtqclWlWpDqN1JIuI+aC/8yGmzDt901P5
	 DNKVwEGg2bzhUKGYum3toNs4gcL6/z3CYPdPNdUt0dbHZhWwbzoayCw6pEnTufWQBu
	 V7TYFiMJ04/bsXfGs1Anf6qsYcrhqTE4MgXZMlnhzvkEQj/S/Ne1wgjBoYmvbohFy6
	 6oh7qVQIftTGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 169066067E;
	Mon, 14 Sep 2026 07:42:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9034324D
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 07:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CB8B400E2
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 07:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YH5lgfW8K7Xr for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 07:42:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2ED744007C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789371744;
 b=IYYk2I1Le8sTIDYPXzz0u8KIPABSCDfO168meDPevxOaP4g4Y6SXvBWVZFkQPTTmR7Dt
 tTpuGuKPrCqllScnoxrnI2S3XfucnssX0tmq9+gL28rc/bsAneiAA1Eb077xqTLnmQxpr
 kPonB/wuxJLKfl8/pksaOn/FebZscMg9/Vim/ebTl7n8Z6oSoWdK3h4W2oBZPUP+2McCT
 yUJUXf3fjjkPtP/MwnPcuev/3k6f+IuqAjyYjZwVwGAFEcsGA2SO2pmckae9brHKQvpVg
 7wZA7M2qOVuhtkqWJFAGJQmz4DF+8RgOLQPXyd16zPR9HB+bQBPm6CVzq9l18NXpuEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789371744;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=k+77r7MTetFv5FfcdKFZn2gf5iASD9E8gzVmTDi3u78=;
 b=ARK/Vkx2AUA+pbUULbGgMTJ2KJV47bWNCIGvVIwPs0jk4e8BlJYO9H+2MBH53IgkClYB
 UogZ2lcHwARbpTQnxdP2tCrCl8KAcPEfUVTqYmlrIcI0VCs4hkl5xbXvVlqnXffews0K7
 Pd69JlycTnVJdo7ve0ahB1vCeHTKrrcR+wberRpKhhzIp2B8dONDXAKa0PR9VWfhU5nJb
 CuKJdiEjSuYDhIn39AO71jNfUf23g84FC+jQOOLLCp2zmMr1+dPTsbRkhfszEs5U7OHQ3
 JFz2nZMkh/ubJaSUYwkRTummP7gBcUdiECxV+jXM7Q/wDHYGjrV7xcS7I2HZ6fp85Ag==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=bUao80SK; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2ED744007C
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 07:42:23 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254f55efebso252828866b.1
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 00:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789371741; x=1789976541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k+77r7MTetFv5FfcdKFZn2gf5iASD9E8gzVmTDi3u78=;
 b=re4tS2cjbexYmyrLlsAxqLA5y037zdQo13uOfb23AfbPvEVN7E5JEF0uIBuCABnUgB
 uR2lCB6oI2ry+eh3lEQ72R5XN/zfiPr1S4mvnXGUmKXePa+GZOwngtqHYrb+n9wZS0GS
 K+K+KLsXoqZfTqHDQMdysD/DIKUA9fehsUla9BuYOJZiH/R6oMXbIiifZ6UEE6t0cvbj
 8AFBeahr3QWev0TEwP4fB3LcCJn2n2bmM80piGhBPFNfH9BCpGPJG9kVF/kk954k7EZl
 394spj/GjgNwAWu6PTj5IBFVHphTzRWMDhjZ0quCkoUZ4HH8DDq1/2E0cBv4C6f/cbCU
 aw3A==
X-Gm-Message-State: AFuF++n7ruVNK+zz0buShYT6dGdaeuF8eJ9p6WpZjYSeEiVuadXO+ndc
 Nd1v3S5LexKJ5yCq2mGZbr2nLm4kbVEWKJEuUvdEQXx/pIRC0JdOGAXPSi36tA==
X-Gm-Gg: AYBFou1b6t9SjuBCvaLSwg78jgGBB1DBDGnb7dcrTSd0K0oEMwYrzfMqmLxYDOGJZQh
 3i56JQtCtf+KtskEE85k43MT52okJU0zFMxQhhjsorrXA5PIppn9z9KMZ5ZWhlO0lbVy9DFyMRD
 6tSO3Xa/GSFWIpTuU/R+JsMM+bp4L13pzVEwJmXR8DPkYJ+71/f6Cs67L01rPjfM72JGxFao/sq
 R1qIOxgRTpR4HVaudJg9ttRy7qNL+GiEJqkin2hCH+DAN/NqqO7lcWqkOoLb0xdP5WpmUi3hy0m
 SAbIuzH4LXY4BxrvzedsA+LmU9+JCHbGNPufNioyuhPIwNF0PfksGswGOj9IHAvdqnxwEDY7a60
 5sCKHSNpkQzRnyDAO46e+YL37ZhNQioNfEJWoN1/mKIm03xQ66i0NGrbWTo/AHPHLK1u1rqQrVg
 rgZ4Uju1gjdr2JTuNTOKrWi/xUuvF3AE6MiFSZJcsGQCw8Qn2cXsmVFjqUoIXF4wYdG5hB+DfpA
 YZ5Jxi3W9OjIhlSLpq/KhLNd2X4tTokiO1o7zFz3FjfCY8=
X-Received: by 2002:a17:907:97c7:b0:c1c:4e36:eec6 with SMTP id
 a640c23a62f3a-c29b862a3c4mr87319966b.18.1789371741301; 
 Mon, 14 Sep 2026 00:42:21 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2966022298sm381784166b.17.2026.09.14.00.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 00:42:20 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 09:42:04 +0200
Message-Id: <20260914074204.65594-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [RFC][PATCH] docs: document check-package ignore list
 and GitLab CI selection
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: matt@thewebers.ws, ju.o@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

AGENTS.md told agents to run check-package and pointed at CI, but not
how either behaves in practice. Two gaps regularly cost contributors a
round trip.

First, .checkpackageignore is verified in both directions, so an entry
that has gone stale is itself an error. Describe the line format and
both failure modes: a listed check that no longer fails, reported
against the package file, and an entry naming a file that no longer
exists, reported against .checkpackageignore itself. Mention
"make .checkpackageignore" to regenerate the list, with a caution that
it rewrites every entry and hides unrelated regressions in the diff.

Second, which CI jobs run is selected by the suffix of the branch name
pushed to GitLab, which is not discoverable without reading
support/scripts/generate-gitlab-ci-yml. Add a table of the recognized
suffixes, the behaviour when pushing a tag, the "test-pkg config:"
commit-message block, and the "# gitlab-runner:" size comment.

Both sections were written against the implementation, not from memory:
utils/check-package, utils/checkpackagelib/lib_ignore.py,
support/scripts/generate-gitlab-ci-yml and
support/misc/gitlab-ci.yml.in. Both stale-entry errors were reproduced
against the current tree before being documented. "make check-package"
passes, though note it does not itself inspect AGENTS.md.

Assisted-by: Claude:Opus-5 [Claude Code]
---
 AGENTS.md | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/AGENTS.md b/AGENTS.md
index a4d11570fc..1ff824affc 100644
--- a/AGENTS.md
+++ b/AGENTS.md
@@ -97,6 +97,30 @@ Choose validation appropriate to the change:
   utils/docker-run make check-package
   ```
 
+  `.checkpackageignore` lists the pre-existing violations that
+  `check-package` tolerates: one line per file, holding the file path
+  followed by the names of the checks allowed to fail for that file, for
+  example:
+
+  ```
+  package/foo/foo.mk lib_mk.Indent
+  board/foo/post-build.sh Shellcheck
+  ```
+
+  The list is verified in both directions, so a stale entry is itself an
+  error. After fixing a file, remove the check name it no longer triggers,
+  and remove the whole line once no check remains or the file is deleted or
+  renamed. Otherwise `make check-package` fails with one of:
+
+  ```
+  <file>:0: <check> was expected to fail, did you fix the file and forget to update .checkpackageignore?
+  .checkpackageignore:<n>: ignored file <file> is missing
+  ```
+
+  The complete list can be regenerated from the current tree with
+  `make .checkpackageignore`. Do this only deliberately: it rewrites every
+  entry and hides unrelated regressions in the diff.
+
 - Validate `DEVELOPERS` changes with:
 
   ```sh
@@ -146,6 +170,40 @@ example:
 - <https://patchwork.buildroot.org/project/buildroot/patch/20260906215252.499931-1-ju.o@free.fr/>
 - <https://patchwork.buildroot.org/project/buildroot/patch/20260907110454.1071513-1-bernd@kuhls.net/>
 
+## GitLab CI
+
+`.gitlab-ci.yml` first runs `support/scripts/generate-gitlab-ci-yml` over
+`support/misc/gitlab-ci.yml.in` to generate the real pipeline, then runs that
+pipeline as a child pipeline.
+
+Which jobs are generated depends on the name of the branch pushed to GitLab,
+so CI coverage is selected by naming the branch accordingly:
+
+| Branch name suffix | Jobs generated |
+| --- | --- |
+| *(none, or unrecognized)* | the basic checks only |
+| `-basics` | the basic checks, plus a `savedefconfig` check of all defconfigs |
+| `-defconfigs` | build every defconfig |
+| `-defconfigs-<pattern>` | build the defconfigs starting with `<pattern>` |
+| `-<name>_defconfig` | build that defconfig only |
+| `-runtime-tests` | the whole `support/testing` suite |
+| `-tests.<prefix>` | the runtime tests starting with `tests.<prefix>` |
+
+The basic checks are `make check-package`, `utils/check-symbols`,
+`utils/get-developers -v`, and the `utils/checkpackagelib/` and
+`utils/checksymbolslib/` pytest suites.
+
+Pushing a git tag instead runs the basic checks, the `qemu_*` defconfigs, and
+all runtime tests.
+
+Independently of the branch name, a commit message containing a line reading
+`test-pkg config:` followed by an indented config fragment additionally
+triggers `utils/test-pkg` jobs for that fragment, against all toolchains.
+
+A runtime test needing a larger runner declares it with a
+`# gitlab-runner: <size>` comment on the line above its class definition. The
+default is `small`.
+
 ## Finding responsible developers
 
 `DEVELOPERS` lists developers associated with architectures, packages, boards,
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
