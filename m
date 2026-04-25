Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C044FF885C
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 08:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADD378333F;
	Sat, 25 Apr 2026 08:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kq8RCDLIhYGS; Sat, 25 Apr 2026 08:57:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 090AC82151
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777107433;
	bh=XjH6jxLxpBhIHchcWqXVQ4khFJ1J9GUVvBO+kfQGbnk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=VvuaaEUWAH7Ezmmudt9s7T6Zh3NcIJWt0yJFp91sL/+NA4+8uql/Whqq7qOdFVJwj
	 C5G8LcyrjWC7Cj4x6WUpJFUWVKCOQ5ergnAqwnpKxzsdrkK6WGkQVsnTBU9bo2TSeq
	 MSys6i9UrW1sckmFu5KIMyvPENe4Uv1BqX0Z1VZIsgFi8MFo1oED2AnmcSbZofTdaJ
	 a16WaYRrb8z1VIMiOyYfQuJVGAmK+W8A0K4/6NdEp7+gXjMdAicsjuHERFmUyagpzf
	 9E3jBQjewDivFbngmEeTfwN93tYn/BdG5AeoXtuGAe92Yn1BixUqiYkwbY6MIXfXz5
	 l3TF/FgoW/PfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 090AC82151;
	Sat, 25 Apr 2026 08:57:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFC69194
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED40E41201
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7fkf7-17Rkr for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 08:57:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7877D411F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7877D411F7
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7877D411F7
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7Jza-1wHgtB3WqS-00FYMb; Sat, 25
 Apr 2026 10:57:05 +0200
To: buildroot@buildroot.org
Date: Sat, 25 Apr 2026 10:56:52 +0200
Message-ID: <20260425085657.474422-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Fx/jOkkAdl7T/M5VQaUgevIpEWPgRHIn9ssHYFFNvGbSExXQ1Cs
 HY5VxUcsqXsh5MamU7O6tMg1C9TSF0TGUaO5LH/1TZg7XJQvsKY33C6NU3zTPo+u/PTlEF9
 IOLxWO5TXYjHURwMm2OA1wxL5aFeNWEGgQCgBnJI7GB53davDmeHBeQwnIAU1IfC7nYt9TJ
 djKDNKiuxtXxO+wUYUTIg==
UI-OutboundReport: notjunk:1;M01:P0:90ypDl0I5OE=;PYLsv+/ChYaqD2yBYgS90dvOrG4
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777107426; x=1777712226; i=fiona.klute@gmx.de;
 bh=H041vuR8IyJq9uX4cyWSfdJlrK65naovATOQOChscMs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=k3DHnJhpgY+Svml5btxbHtsvaSXXTUUUnXGWhD+6jrIP8qnF6hykdmts6gU2kZZQ
 mhuSoZdqIgcJOiJNbA2M2tTklGedTCDGLjdVK67cos4OlvAp6mTa+0WikLqmANoGN
 lzzpu0bvgC2Zms2u9Bdy5LO/kg7jgb5HpDcYSRp9CtoEn6K067PkrPBO9gcxz7UU2
 hGC94cVaXAd28nekAJ9Zc9vqRGYC//X5I87r5EX8TmkAPC306alG8CdkqwPX54/c4
 BJcssFeyyEqzJZ+LtiDEe0Wnvdkn5NxLNWYU/PplixRWuWbEj327mvBtxutZWFH4p
 SI5n99FWfJbQDXHsDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=k3DHnJhp
Subject: [Buildroot] [PATCH 0/5] package/kmod version 34 and Meson build
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

this series updates package/kmod to 34.2, and switches it to the new
Meson build. The upstream changelog for 34 states the old Autotools
build will be removed with the next major version. I've structured the
series to switch step by step:

1: bump the version (should be backportable, if stable maintainers see
   the need)
2 & 3: tidy up to prepare for build system switch
4: do the build system switch
5: enable the new dlopen feature for compression libraries (if any)

Best regards,
Fiona


Fiona Klute (5):
  package/kmod: bump to 34.2
  support/testing/tests/package/test_kmod.py: use current 6.6.x kernel
  Revert "kmod: workaround for microblaze ld bug"
  package/kmod: switch to Meson build
  package/kmod: enable dlopen() for compression libraries (if any)

 .checkpackageignore                        |  1 -
 package/kmod/0001-fix-O_CLOEXEC.patch      | 48 ------------
 package/kmod/kmod.hash                     |  2 +-
 package/kmod/kmod.mk                       | 87 ++++++++--------------
 support/testing/tests/package/test_kmod.py |  2 +-
 5 files changed, 35 insertions(+), 105 deletions(-)
 delete mode 100644 package/kmod/0001-fix-O_CLOEXEC.patch

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
