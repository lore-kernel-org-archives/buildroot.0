Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F111CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 464A640FD6;
	Sat,  3 Oct 2026 07:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uK20VsXhN_Y7; Sat,  3 Oct 2026 07:22:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6298B40FD9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012161;
	b=bWg/Nx1kmYGWCtmXdPrMK4Te7vM7fXsvE8tWtGTzbSrZD6yC6n4meQCkmUhwRjFzFuLk
	 hL4t6WtE9fziNRInWa7MwaypExO+hrkQmX51+n2txmu3Tu4ocPFGYjvfqDWbmFCJis3Dk
	 fQbcROxxcs/D5dDQ5Q2tatLDHsVAOs0UuObfmQO2Lv1CpICJalooWl3CctPkZ29mJiRnB
	 2hEWMCSOOrkZLUriMv6eCU8dX2X+gnUDOFWFGV0brWQmZZLHHiuLBEdVidOw7qwdu1OAU
	 J4SI+4ulFpde9zBiCNxc6izYKVbxWGVH61QqiCFasToOIazTVGqHMUsUlUOFbvOnrPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012161;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GAf8ygUqVZK36ur9raXRc1kzLhN66kG84t1vF7hneRU=;
	b=I3v9Zn9/6stMQLbzqHnXqQubC1bIt+paL6MHlQjBoOVC0RtvvTMj2vfdEt7tIpnPbvH3
	 yhRti2WGfI0N9S8xlflT8TeoV59KEYJg1pU1ECGLe/iX5y+rIcVXesyyewKZfX9ECGew7
	 DtuY27YlVgp9i55jAfUbwuQCwBuLS0jdM+kxqWztI/J6Uhmvk3bq3o+GHNvRngBg/XIiB
	 ItwQjuFOEZEMXd2Xwolz46bsYo0ouirEx/Zq8k7ZVhpjXh2LUi6+Or00U9HgF2qgzeJEr
	 TbEAF42b9BpSJJtPWjDQ5WG1L3Py2XsTA9A6k6iwsqP4UtRQhFz0nZHri8B60LEkxUg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012161;
	bh=GAf8ygUqVZK36ur9raXRc1kzLhN66kG84t1vF7hneRU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YKCgflzXoisrGuiAUr8ybG9X0dXF4mKAyidQj0+n8SSnJJn37Og0E+FzWKujWp2Vr
	 R+Kn/cs7KEgWOm/1GQ2S4SxzroDTZGM1C2MBrfL3jTfzBIbpTLo6lef6DkjRRH+hQy
	 mTbdphtw//hum/cpSLDY1gQqED7mFyjhMET+yh7srjhMKyLuCUnryJ0P0he8iZhXya
	 RGhAFM+oTVhPVvcRUG/ozcdDknmu04XB1nM4zhP+G7taWpQnRfsbv18XYbB62vynFI
	 UNYIt/Cor1RBV0YpDZt/r+BjGSde8V8TtxsJR5Om/U1lDorqLd6Yp0bsGJkb6JXWnd
	 8e2+flbP9LEJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6298B40FD9;
	Sat,  3 Oct 2026 07:22:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C10BF34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B376140064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bK1VY5BbIigl for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B580240059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012160;
 b=N7vaImOhqACIvWvoM3f2zLV7yET1mO1lVyJH83cDyOL0NWKrNSQdX1jSerezDgjg0LxG
 PjtCItImIbNM6RDHcoC+bGkI7PtboiBuQazy5pCc1V1rm9XMwNke+qTFxf0Fo7jcfrDyw
 LFKW6N+Ezmh5gB8KgTVeOnkH04QI+7tz+8rsoTNsfqZdPRxjZe/ML3xsYfdQ69NSbdnAg
 8tETcMOrj9cUidRPkeZtopmA4PcDOlxCdvYgYlDAaz8fF3f9UNOQim+QWI7QInWfDiEea
 BN1PraR4bHRzGB+eJopzFmu5QD/jciC6cxuA9qAKa+1yZUquwoR0+Q1VIchuMSOGwLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012160;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=W76lHp1Bdz21dTN2kVObbvMn0xs3HB9Lzhwat00nAD0=;
 b=Kb03vk1MofiDf8xwM44qktOzPzJOTaYfKg/7v7KtJbLTgtAQ3Yv66geTXKgPhBP0TNMQ
 uocaMPl3dcQDC/xranu7nAo3Q31HjSooTQnId//qQZy91G2fpl7siwoZ0FqtfCBIIiiFn
 0EKiNKMskspAlZXPQNkFDDw9SnJ+bnXvTWB2Uej+nZu8Pj2wM6Ek9OxwiqG8Zjqy4XLL1
 v892RKi1U79zJz0uLwdhH17DCB0Or0J+gIQnqjtS9Pj81+f+XmpqOFbg+WYgJfXHJFzuE
 vkYZCT80woWQ5fBB9Oy2DTKsBKaJyF3xmgr0h+r9D9SIqEQw5GmKQkecgLNvtLssH1w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KULsdHSV; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=KULsdHSV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B580240059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010941;
 bh=W76lHp1Bdz21dTN2kVObbvMn0xs3HB9Lzhwat00nAD0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KULsdHSV2XvZ/E4qnabPYnZCHhrjCAG3rmgELyNRhtR07C/yEofZuFeFQIOkyYWlB
 SgxYmj+dFb3SYMcWoT2xJDDNTBH+shcxNzetU8VW8EfOABG7dzL6qBEIdTNhe1VBn6
 LNgcAizCYHkcdYjii8c+oRI+Wwxy+jUog4HOmTzX9hKzQQxkO9Q7xiFPla3k5eHqMQ
 W0J7cXkmOr4WKsmXq1cJ6hKEfaexy5la1LeoaS4ggOoE1hP8ypknFnT2VUDEwobanG
 RQy6Ua6rW8c1TFsumcd33Q/jMlha+iWPiPqxnUEbYRpOz5LSHEWZjaH1t4ZPh5mLVo
 QGJhRswm4RyDQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 uaIKiKJk2JPgp56xLXc36E9Jxt4/AStL3JiGyqPhRSyiDn219qmRhsnJSsHNhcUABX9vANF8VYK
 fv2Fv524O/LBZWW6XWHAvTKaRkc3VQMnbTvutHc5CYetjwHxJHdJeMCUFWPVFMkE4stOQWDrKT2
 1kVOv+w/cOYG7sShLrbPSrbb8pbUeFRPobzjFlI0yZPAp9audgzPzwar9cOV56lfxQRnKhi0zg7
 ii+KP30tRhFAFauM5IhVztiZ5muChb7Zj/rJmRFVPD/HLiKkrp8YFtbob9orVbw+HuKyIqvWXMP
 sXqghp2yfo3l9xC157HloibHmTFjwvMzjH14WsEr5xNcpcZXG1R1BSiq899cFazgEP7dZ8O0B9N
 pxEvTYi1yW5IWdydKwS3Rt0rO1w51eV9CQ9lKf+MnRRuOwsIDDRf2t3XuecxaPX8vVhAfwnbIAs
 9SwfxfZ52UqPiLTb0UkKADZb/nwo9MXo9qsMsUF6j9lJgjTxBgAVl4XOCWN6ClKxFDHLwq8tMiq
 l2B20QhwseenXibZ2u/bkW2iRmRTIhgPEIdzHP74NOgNj4f6DKV8gnmPxQU7gijLnN7Dslv6p5T
 eyDc+UBCNwzVbkw17MbCV7+uT1plLGymJLU7xxZcTMAhNDsN84jKeXjaTk2/fh7VohoTtvXmgZT
 u/xMZwEf25cpYR2vDvfw=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 704C7A4C551B;
 Sat,  3 Oct 2026 09:02:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtke-000000007Zo-0oni;
 Sat, 03 Oct 2026 07:01:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:12 +0200
Message-ID: <20261003070128.1295458-40-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 040/114] package/python-markdown: bump version
 to 3.11
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index 1a5aef991f..ffda094bc9 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  ec7bae2cc261dcb2c9a27271b60d40d4  markdown-3.10.2.tar.gz
-sha256  994d51325d25ad8aa7ce4ebaec003febcce822c3f8c911e3b17c52f7f589f950  markdown-3.10.2.tar.gz
+md5  b5032b0df41befcc3c96f9fc966a0668  markdown-3.11.tar.gz
+sha256  180224db6aed87ba9ce1f2781ebcd5826253de8ff637112090e24b84502bbf9f  markdown-3.11.tar.gz
 # Locally computed sha256 checksums
 sha256  7ba4eb6d10b32b2d11dce13821340351cdbbb30ba8ccc67841db2ffd86e79aca  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 0abcae709e..9e7559804e 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.10.2
+PYTHON_MARKDOWN_VERSION = 3.11
 PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/2b/f4/69fa6ed85ae003c2378ffa8f6d2e3234662abd02c10d216c0ba96081a238
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/f8/4f/700155c8c20d9e655dd0732b5fc3c7614f291b9148da271d7388e50bf774
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
