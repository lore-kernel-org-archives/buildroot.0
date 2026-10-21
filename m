Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5A160A260B
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gM/7/PVK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PyqxQGDd
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02781407F8;
	Wed, 21 Oct 2026 13:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Tq9bfINMI_d; Wed, 21 Oct 2026 13:47:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D7C8340866
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792590431;
	b=cbYJPyDKyZOge+xxrq4SfNOnbSZmmhRIprGnAk8OaUe6l4efD1tNKskH/18iJNGXHzSG
	 XcnZ9Ya2NGqyTe0GXu88BvJ34NBizyLaK0hQy1TKsFTDposFHn6Rcc8XqciNDb0E2prAY
	 blVcmi0iRBqOwl7GQxpVIn93gZ0qQluTMnOkQKcjwYR8MCtwL2c9QKAPn1OuDEI/8PoRt
	 jtLpRuSGAax8y+EnqQ0FGAAUlmc+iwfjJtyc4qahnMEp4jDkQGUb+Xfv1bhU8poGxv8Zf
	 Ka4VE/32T1CYJiU1v40QUuwpnkLdgZMOps2CLOeJGKDAXsbC1khBOQdpjVjB4XxG6OQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792590431;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cFPPz0ErRDWAaAnKthaEN72F7XfzObhHm7Q7PI4PHhk=;
	b=NPYMLcwiQ1JbpQr0FAnE5DzGp5Ur7VSj5pqdpSxaHzk5het2Ml9QTISLhgUcPGlHUDqy
	 rEACMDhSkV8aON/DZuJOqKUWRS7liDAnyRgr5YG2yj5nuxw1rnk5NxuWFr3BFkxuz3V9b
	 +LMqatDn+iBV7cMQWSIKQ8fxrd6mMjF6HNzZ4aHKS76sT+ypdtH/7nq1TnMCQnuYkmQBE
	 a/3FgseHVz+sw6pEBCiM00OCiTb/8gj2Df7RrUb0s7UWFf/YlWPdinUXtwnKcXkMTViwn
	 4ND4geI1P2emEFEZfP5wFKG4NlPyRW5krBWzFGIYru2h9FanVV4N07DNosPavoEQhNA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792590430;
	bh=cFPPz0ErRDWAaAnKthaEN72F7XfzObhHm7Q7PI4PHhk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gM/7/PVKuFTIFkgNFB8H7vA+0iL/Wy9kR42gECs2Le+g4+TaNE5lqBdE75Gm4RDOD
	 PZ6DHL6ZrMLbtedFAHe9RJnzPTqOb5gU4YLJPfytP9eWkq9PD2xHC2Jya8hd8jnu3I
	 c4RRlxnmKN4le1FmoIu59B7W2C/HjGEZ8AfftkZuIGMKkHzEZ5QrkyxGuJaAhC14M3
	 6Do+ufL53s7MSbIUVRWS9RHvIZ5IgGAru7aUCwuZtn/qYW217QVnWyJc3DWwOgBfDg
	 fRLwJby3ghlpi7/orMZNdmw4VAi7Vn2MFme01bDsY2Pvsk30iG/So53TiFYbd+BPsX
	 SN9famL7hp7zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C8340866;
	Wed, 21 Oct 2026 13:47:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 378D01E9
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 293FD60749
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuCr4BoB6gpn for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 13:47:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2929C6068B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792590428;
 b=KQuJhXGrR7grMy3RowsRIoBJb5gAOLtcY7JSgTku9vLSj6WjQ3so1/QQ897AUQ0w+KT8
 NpGuOa7RaOR5Rr6UBGKRPy6y1ZWcrD3U/tdxtkGwxataLIfo3/b5wVaHJ3bitPOiNRpMT
 4+uqqiMlp1gBY79tBoJw+NtgKHICOQFYjuDml/pG2KXkuOecAJn5WqwYrMumLzUniP+uz
 /rhWDmBxsiRC7N/ALwpcCtLhTGCakspH4wHZt/XKe8EJByTci7V7+o4YUGh9Cn0nmXDWY
 gjYSKMg/Ytvm42mzzxhOpsMxzhpRGA0tw4BoEC24yDdo/4NuIqpR3oUH1eJK8gxnVOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792590428;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=xsUOWUyOzsl2rRTaHJ6RybNITB/n/R5r1KlnR3DCiZY=;
 b=lYKZDtegJbo5vae23aD2tzhu7PePJienoRItiD7fXQBIn2EPSOEAG4Zfl1oSEhoD3Kw8
 c9tUBMUKIanJE5XZAoZW5E/rfhG/wHo2JRKxImg25K6FRZnEiYfpxXPRhAknAiauYqftV
 WGW+OZJSmUh1FPe0zqFYUJgQjbHjhJkjnAClzQtfg+oCfRFpHpdEbxUvvaKW9hJfEHJeq
 5/uJKGEi3wueBZ6+Yc9WRQC/aEJWqXdNeEqPXmEKh2LNzaqZA3kNvSbt4W5MIudl79TvL
 T04AsGiI+c/5G6W9WFk3HESKHZVyTOK3nR8ruDtuPBDmztPOOOCMmZ2IGzE/TVF38mg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PyqxQGDd; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=raslene.ziadi@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=PyqxQGDd
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2929C6068B
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:47:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48dfdd0678dso618916f8f.0
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 06:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792590425; x=1793195225; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xsUOWUyOzsl2rRTaHJ6RybNITB/n/R5r1KlnR3DCiZY=;
 b=PyqxQGDdV7FeLbjxWAMUsBsGg/YxrrETpbfZSbAt0xKSO3ljZevO+WujZQQpzmpQ9m
 87UZBDndIA5rN6e2nLeLDzPkpGeCv9ag/iI99GTK54LNWfTjs/pP0/nrZR3kIqlozfiB
 5il/90QDfLkJPLGMOR+GSRtxnQBi/qsTtcxqkknKrnsTihjjtc5YsBjQC2QT8XAWaI40
 wXDC0GW36Q/pQrAYC5tlPXOgapo1TTtbUAyM/OF6K1gdyCrQxUX1gbKlzI/Bgwk1goda
 /ABnGfu0OLdGnkcmrdM64pYJRHAC/cEJzusYL6Rxo5Jhok51BuaGylmCu0oqDohkHwZM
 hh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792590425; x=1793195225;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xsUOWUyOzsl2rRTaHJ6RybNITB/n/R5r1KlnR3DCiZY=;
 b=vtToEM0TF4Y3W8iVnGo3dNQDoz90bFCwdA2KNYu8AVGP87PJVkgYzh8yQhb4yVPOEX
 op5QFvXCSlZs4XdS1COJR5W1rAth3H7vISJwqCZUmdyOflFpLVBYUj0iZdwnKxXumv5z
 6v2IsPoYmN1c+hytl/5E9zUubgTLOVW2mvurdC3ekW5QkS9bDdHk77YngV6kmdDRtwqm
 e6+9FgyihvUB0BoUMxtLrDJnkj7MQN8bEt01KRIOwDuw4exczDpzDGm+KVjrDE6rS7gI
 ARBdLCqAltWDl/0FwunGCeW4NVIwFXcRQdXcvxH/Bp4e0jNeSKpD/+NLGU4agI7uqSDV
 II9Q==
X-Gm-Message-State: AFq9FYK0HqXJmjMlQxgB62yDozqMiQf5kMGhKKtmIIh0asO1cql/mwFq
 WpYjqaW00/zqgs7zrUE1lGWO+pWUoIkhxeSeUPx7nmrY+/q9rm39TVze9Ur3z0BdfQc=
X-Gm-Gg: AYBFou1DE4NW7MUwg2sMPWp8gulGJr/n8UbrJiH4hi/YsNhRSljvvXX12dKj8qBthVD
 inU4weap8g56kiMVdRFA/CFyGK9IJk0kDBtfWBjQ0djY34wzjJ8DVDgxJsMxUCOmsywDRdJ28Gv
 VXxf4GwqLkzFaOclcuxFpF4TP1lzX6S0jv8PYZhv/B/x+vPqptLACXFUcWo6mRcCqCrAmDr9N/S
 FGmYKj4mJNmGDrB4Ka8SQ3UjFBNDD9APWakRewY1RZYOmtMxdxJXC5bZkkDNokPf8Rc+AhLy44H
 zxbqjV0olEW8dTdARmMCuYYMqjf1+ryC1j1C+t3W1a90kMTARcHZpbXreB/3234SlnZlJ4xM4E2
 9ZOofmtshWxz79W07ncT0DJJMKoDso4PxE6XS8Sr9WBzux4La0HvO2bs8PudmYSfs/MOCWAK3E3
 p6Imkntl58I0D4rBSmTtgqrLNxam0suzd0WCt4QK5GUd6X3r2ZhiASnCRa3ws6ciQzCVM8N7HvQ
 doj+cfM+UMGmi2hREv8wnnoZoxA0g1WfZqWymnpJcozjVPSr6UiWOjjq0QqXxKCWkM=
X-Received: by 2002:adf:e28e:0:b0:48d:ec3c:3247 with SMTP id
 ffacd0b85a97d-48e264dacd3mr3448673f8f.44.1792590425194; 
 Wed, 21 Oct 2026 06:47:05 -0700 (PDT)
Received: from raslen-HP-Laptop.. ([41.62.58.180])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2582a53fsm5535771f8f.32.2026.10.21.06.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:04 -0700 (PDT)
From: raslene.ziadi@gmail.com
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
 Raslen Ziadi <raslen.ziadi@enim.u-monastir.tn>
Date: Wed, 21 Oct 2026 14:46:55 +0100
Message-ID: <20261021134656.30706-1-raslene.ziadi@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: handle missing
 git repository
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Raslen Ziadi <raslen.ziadi@enim.u-monastir.tn>

pkg-stats can be run outside a Git repository. In this case,
retrieving the current commit fails and aborts the script.

Handle this failure and omit the commit information from the HTML
and JSON reports when the Git commit is unavailable.

Signed-off-by: Raslen Ziadi <raslen.ziadi@enim.u-monastir.tn>
---
 support/scripts/pkg-stats | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index eb6d1836c3..52a4293948 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1260,7 +1260,10 @@ def dump_html_stats(f, stats):
 
 def dump_html_gen_info(f, date, commit):
     # Updated on Mon Feb 19 08:12:08 CET 2018, Git commit aa77030b8f5e41f1c53eb1c1ad664b8c814ba032
-    f.write("<p><i>Updated on %s, git commit %s</i></p>\n" % (str(date), commit))
+    if commit:
+        f.write("<p><i>Updated on %s, git commit %s</i></p>\n" % (str(date), commit))
+    else:
+        f.write("<p><i>Updated on %s</i></p>\n" % str(date))
 
 
 def dump_html(packages, stats, date, commit, output):
@@ -1300,9 +1303,10 @@ def dump_json(packages, defconfigs, stats, date, commit, output):
     final = {'packages': pkgs,
              'stats': statistics,
              'defconfigs': defconfigs,
-             'package_status_checks': Package.status_checks,
-             'commit': commit,
-             'date': str(date)}
+             'package_status_checks': Package.status_checks}
+    if commit:
+        final['commit'] = commit
+    final['date'] = str(date)
 
     with open(output, 'w') as f:
         json.dump(final, f, indent=2, separators=(',', ': '))
@@ -1371,9 +1375,13 @@ def main():
     else:
         package_list = None
     date = datetime.datetime.now(datetime.timezone.utc)
-    commit = subprocess.check_output(['git', '-C', brpath,
-                                      'rev-parse',
-                                      'HEAD']).splitlines()[0].decode()
+    try:
+        commit = subprocess.check_output(
+            ['git', '-C', brpath, 'rev-parse', 'HEAD'],
+            stderr=subprocess.DEVNULL
+        ).splitlines()[0].decode()
+    except subprocess.CalledProcessError:
+        commit = None
     print("Build package list ...")
     all_trees = get_trees()
     packages = get_pkglist(all_trees, args.npackages, package_list)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
