Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5F3C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 15:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB40640BFC;
	Fri,  4 Sep 2026 15:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6urKWh5ZbFk3; Fri,  4 Sep 2026 15:01:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 288AA40BE5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788534089;
	b=b6HyYRwuBwGGAoUK8QbmOENbNLjShj98LtDyI+aWJIfgk6SM6yNbaOdtSrlT5oD9PITF
	 kjDyKylk3giQm3JHFuRd6hiK/16eI6I28dv/jk6YXvnxwIwIwGUgWm7WQO51ZB1SmXIbu
	 DpoBqr3aoD5xAaBbQTSSZsnX5iJM/W3ob7RXbOWJO1NLm+ZDc3KGHcAJYDL7ShGlEfwX6
	 F7TP+VU+DfoBCdlUr1D7a86ncX4B6h5O8w1h3bj4UoY+c0ET9NA5mwekJpHDGBA99a+Xq
	 EkTXQHi7eh/b+b7qloMpPSFtmQd0aGZYizdyWYI+UsfkM6dAN85hnN42rWXH2pz8Geg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788534089;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=XYImDT98cI52qS7zTXEKCBFt3/nIr872DPK3LX3jvMM=;
	b=BCJXGfVvCKpSuDUKNWQRMy9zwdx6YU2p7HuTvoqPFiSI7I0LO1kvcHuuNJMcddtK7JDQ
	 7YaO7hA1+khbWIpnZvP8ZD8aL7IJIQxZ99mdc+NtE6OOMdFGyyu0XZnS3Aaz6LEQMgpTg
	 jHEVtyimlu7O4RyA+49x38g8ZPymOwig3Y3Ki5c4q5HmO8nhSUT6dlKCymdSZrPYbv2cs
	 x6qOF5PMw/xn3unrzM+PgswKWfcNTJr8yDOd76ftIyhBHM3N0Y8JUFjKzDZ+RtGmCU4Mg
	 TUfpR8HABgAXDGEswO8WxJHR8cIfrk+x1oIeapLQ2qfrXSu7mBQHNd+MXADpUN6bMZg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788534089;
	bh=XYImDT98cI52qS7zTXEKCBFt3/nIr872DPK3LX3jvMM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EtxH1cKCjwAqTVAgn4HXOkgyfO3CnEwhrHiQO7Pj9vkD1mqkoQtaRzF/We8mrO9MF
	 ZRXVJYCqd2gMqFilQ5N/9mYAIxq3FnfqV3oRP0Lm1cH/q8K+TsSpqoBk4u6s+A5b/v
	 45ye/eGR4e4hTjVXYcuAsYuwyD5mSzer974f2GzfQsxwobH9KZ88eWQstypMXGo6F9
	 E1gDmrqlsCxQfMvdNNWL+u/tFf9MLgQEEcfI75HwAQ7ogsz6pFuuuhyHpbssriypT6
	 XX+hSddTZPzEPoZTjqkjc96Klh38Bj1morh0LJF7lCuaBwobNkEGdkeElxHFXHYflc
	 rQ6SStlvdfn6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 288AA40BE5;
	Fri,  4 Sep 2026 15:01:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCEF177F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3816811B6
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QtXEqA3hHh3 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 15:01:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1BC6481155
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788534087;
 b=V25d0DqssEk2bMejFqBZHa1mUBFmele+cZlz5s+vZ4TSpr56zTw/f+n53PWQQ8vNcc5V
 EoDl7cCOjraeVgPFk4UggROTf0y2I62TYXaxiDEQ94HmZyg8hIWZyuSgaKJC3W0BOzEj5
 3yTqxDoNy8gus5ZcfEDx9GN14qCPBh4g/Z4UDukPQGGqFEjU8/ZaAabEIhSQAa3TYO2Nh
 PdFTV7My4d4cxPtzL1talXUbCS6IsGWcsp6D+Yi8b+QxR9AAVCuzIAHxfFjJn0OfLDMsu
 xb9auoDkwpmk5OhvPSZ58LCvwQXZ9cGKxae0Z8cq9oz3GPhJKD1rv2Ywy/Voa+FIeZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788534087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Or04QLQVnjQ+72HqdgymwXpXqYom9iwBNVthuEixwoc=;
 b=NWEqcS/cVqyHuw1tmo31RTOlHaO7KsCba6eolVnoIMckoK92oV/8bUMyduwSFG/2c9F0
 3BsJVnHo8eAUY8+G5mSCRDvD5GSBYqHZxVtTXfO9P0iSLaGSUu50UZLriiWujIMCbTm8h
 wMXZbuMENyjYriMaD8Y5wQaTtWTIqAqtwy4BhIkwDGkcDyD8OUZftnpMyCbBN/z0bLaVP
 mzTRksJhBQLZDLGmzOtPU6gEXBnoBDgKgmLYisUBbFShW9X4oXzblFXsRmsj3BLn6xkb+
 0TPMrIJow2ugbM7YVN3qXzG/yUlECdVZtERqnABk26t/XPRRUj1DZYbIluaoo/WKJPQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BC6481155
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:01:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 847B394B81; Fri,  4 Sep 2026 15:00:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 16:58:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfc909b1cddf7e69fe3d1ad96fdac08f595dccf2
X-Git-Newrev: 05ee0ab1e0a52cde42ce8c3aa77c980339b906b4
X-Patchwork-Hint: ignore
Message-Id: <20260904150026.847B394B81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: add Othermo as a silver
 sponsor
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/05ee0ab1e0a52cde42ce8c3aa77c980339b906b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Othermo offers manufacturer-independent operational monitoring for
energy centers and boiler rooms. They connect a wide range of peripheral
such as meters, pumps or pressure maintenance [1][2].

Thank you for sponsoring LTS maintenance !

[1] https://othermo.de/
[2] https://www.linkedin.com/company/othermo-gmbh/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/images/othermo-logo.png | Bin 0 -> 5492 bytes
 docs/website/sponsors.html           |  14 ++++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/docs/website/images/othermo-logo.png b/docs/website/images/othermo-logo.png
new file mode 100644
index 0000000000..98f8a93f38
Binary files /dev/null and b/docs/website/images/othermo-logo.png differ
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 8353b149e6..1facb3c2d9 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -68,6 +68,20 @@
             </div>
           </div>
         </div>
+        <div class="sponsor-entry">
+          <div class="panel panel-default panel-lts-sponsor">
+            <div class="panel-body">
+              <div class="sponsor-title">
+                <a href="https://othermo.de/">
+                  <img class="img-responsive center-block" style="width: 100%;" src="images/othermo-logo.png"/>
+                </a>
+              </div>
+              <div class="sponsor-body">
+                <a href="https://othermo.de">Othermo</a>
+              </div>
+            </div>
+          </div>
+        </div>
       </div>
     </div>
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
