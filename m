Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A71CCA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAD6E60862;
	Tue,  6 Oct 2026 16:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckjC_y_JIivD; Tue,  6 Oct 2026 16:31:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E1C9260820
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304296;
	b=Hzt9wUSkZeGayigrlmMIe8EVoh7nlujyXzY3/dmsDNrIFzrKr4YquPgTk7s4vD4GAsAp
	 lslI1EiRPSm++w9H0RVOyDudIlNmwxLIcRRhg59Fq4uOBCaDcqXEcP6g5MaZUJPTW82lF
	 mEdo+SoTIyLSSQnHAmukEI3wXkI6/8R21dkfFZrmXafgZHmRybKFNzCYb5jpKWrX+cjFl
	 iLduLGg/RYmh/oVeXcOBxOBEzWeO8isGZANu6J+/g1XJxTa2RXS0w47vzUYT1nHKSOSbr
	 rrLo7S8cqA8QygTHqnexY02ogkjTd/W27oGYZOvBTXK/5sNZ981BmeoM8MZc6/TV3zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304296;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=h4zPVStqHZ7TV68Q/w1yPNPX3+oLmg3gjr5gh/u1cbk=;
	b=nebVF0BG242TpfcjJ2rZ8qFogC2YdSu4GYCRSldM4awCs/SWahPezNOwLpLHzMYcLVbx
	 SPQJ9NrK2fyOphAJjHh+tgrFiedMFR67SBpNEAfpuonlrTsu/c56Zw3FLEs3stY0GLZwD
	 FuO5cRuG7lrudfJ9ifY6SPk0PDpZO3zmEGRGz9lzSpFxW9VdApivMpR07JdWP9AiJ5/Fm
	 hL5bBJigKz92BXLFuDfpMKX3V2TID73NufuEBIo2kli4uBay8UJ+YLG+o/19CO5kZ9GKI
	 z9K1WTPcHEIyjN8bUuQvid+RJV+gk0QKobP7Pnc1mxN0pw1do1ZwOKR7aBJ6lw63qgA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304296;
	bh=h4zPVStqHZ7TV68Q/w1yPNPX3+oLmg3gjr5gh/u1cbk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KCjn3QVtHt7WuUZ0WcXS946fgROrziLzAU0hq5u47dFoKYB5Mred1/VH33Vc1r3UI
	 i4paNif3JTlPctNzBRV8tQceAT5NC62LgZpcZ8na5ywd2xsCYiGQ/LpzXaBSmrw6C6
	 n+P1GEJ0JABU2HscA5phSCKSJ4IUPm1o3sIWf/LACplOx2r+3PA7PXvynPzJ3KI+83
	 fZCS5VRWjLUBxFG1gy3ydFizselrhjUtqC/BWwne9txgajpT0owkViq9x1QDe+7+z6
	 uE6oLXKpx+pm4GLp70gYTaOfyGy+LL/POsQFh9oh+x9I3Tu9bVJDsHrU5PVci+62hA
	 tI77eQ4mv/t5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C9260820;
	Tue,  6 Oct 2026 16:31:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F96F341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91B8F80D8C
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1uZXCCX9rh1 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:29:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E201280C73
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304170;
 b=sYhyUMwoW4pq5VgITmn32P2zB1ILwEh5WgOP5S+i+GPKnSBEeSj7D7uAGbddwre70u+0
 p1dWezlESpwnCmaGGjrB1/zCyebQfWKD+go2VSnAqcYKXwEHU+965trvH9P759ILww4nd
 bHPeSrhvFcahq1EEgebqHJvQ5pkU9SOIuokUcMdTrYSsV1Ez8cO4wvhF1okRrQqYYgaql
 vy1rWyLxCVkzlMHLULxv2/zqL3PlsSwxVULttOlWMAiirG1uPazJLQlnn9OpZqna2IAGw
 FCCwb2EOaTe+/HpdK6ZALYXZuLo8UrSZLd9SyUauh6zD3Bm9p18M+JSm7hrbugh0E7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304170;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GTBibPQUKC2AIOM6aJDgIhenYXQ8Q6kNAn0Vf4jOk/0=;
 b=O2bgE2ghq77ie3UWsYN3tScJ/9wIq5Ion72NZ80g4C0bDQcfOlvUeLWPUhRf8VKvvLan
 dGZpXdMIhiRYsMciTCUQN/j7D1Nkvp1xf1aFI00Skr6t+RK8VtKQXkhCJPb7LnvzYTzyR
 YLBmaZNHjLCaPoGu9shDeQ7km4KI1N04yxFsoJgVRH8FDr3rpLAtjct0OfH/aHWtZYG2p
 Nma7gWNbrS08kO4oGQkm8WlHsmA3+u3323lILw1yx1t7xy3t41lIZ7qctPrYyuI3O5kIO
 8fLfszNDRAdbnz5goNipg7pI+AujcuESG6wCBRg7j29C3VZRuwm7cuqOD6PwyPzfchw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=C7hCkfGH; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=C7hCkfGH
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E201280C73
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303707;
 bh=GTBibPQUKC2AIOM6aJDgIhenYXQ8Q6kNAn0Vf4jOk/0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=C7hCkfGHdm670LlAjFiSABPEsHN5zRKLRUy0nfdzmDGwAUeGDueJAWBKlozYGYEmj
 5oGCcmMZg3XUiaxzlw7LuBDAtjCHDLwKH6h6HYDPU1R3L4NUU3MWl9y627+/x1l4Cg
 WajutpwPcoiL9JVJVxtFB6vuamg6yihiLCKRWsaqFbheXjPo3H0YMkdQVIXRAWqxzV
 kqYz6zMaX9m+5nJBEnMkMQPf4MTpSjdrPd07x6ObmRvxsMQCBH1SAFhVeXjOrwMkfW
 j7AkpCVpIicqoy4N48A+qgrh/W2fbzaBcHOaMyBfbcBpxqAfJROgmkjuPPDQC+54Ww
 pDB/9dHAJCRrg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 h+k87eJVDqfySsSlEYMNyJ6nFh1aAVGNIRYHP5wWJZeBxflF5yLp63wVdwVGTYmx/7aGZhBwiAb
 aGGHGP2B18Qe4pnv6cVkgY/2pcDLxeTFLZ3bp1i2+IQTAzmE/LaXFzhQfRElCzLXAhKVjkk7VPO
 DZ28zFVI99W2guaLRjpdaC0ZBM5ZRiU0CPf/k2YKW5oLw0vL/cNUvM2UOs1MDEy9jPnZUiql2ry
 WRLYy2lBc2OKToRh4e7wT61tSQ80aM4XBcq5Fb2J1YnV9y3Is7rMyPQlKdp9a919B6jV3RRP8Tp
 zN6G9Wmt5hIXLgv3ZiL5dWdQvtW/TaENWwXTGSlMcKgQhULFRp70JB9WWQmPi7wOllQb6kiuqRP
 Nwx9EpNC8GYlMNSACG85p5R2FCjGfiFYrI02dpUP7xBXIQIqdGDALQnfyAfH5EESwt54mQ9nxIr
 2WG9Yg7N8G+zpHfsm2S2JAfBfQkbqvEYbJLN7rVAd8VPVnH3/eP/RsTS51aTdntvaMZKt2oSVsD
 gREQK4RSX91lqLikKybbtK06St2SnRoi0LXPXAH5Xa177jHLCPABkX7CD2MtaWaCP481APYzydn
 1e+0ssIMT4B+9lZ+r2zPUQSmQLTBMNGH5RHg5VWY9sVYLQU=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 493E2A4C5420;
 Tue,  6 Oct 2026 18:21:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-2sRO;
 Tue, 06 Oct 2026 16:21:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:57 +0200
Message-ID: <20261006162106.3439373-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v8 16/84] package/boost: log needs serialization
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index e88f497f6a..5ab351d8e4 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -243,6 +243,7 @@ config BR2_PACKAGE_BOOST_LOG
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SERIALIZATION
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Logging library.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
