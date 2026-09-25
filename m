Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91440C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 11:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A629A812A3;
	Fri, 25 Sep 2026 11:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNzwQTaR80_Z; Fri, 25 Sep 2026 11:53:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8A18D8120D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790337191;
	b=QgxvF1Y8Ggg0bMTGgGU7XWIwu9pPX1Qp2e+DNKO7rniIlC51vX7F9pPDWYF91aeWxWeK
	 /WeM6WJX8D/nwtr4nvayZHubXwmYULajXqcMVkIZk96I1zRhUgJ6chwBaoJp+pOt0gksM
	 /3kAOZYKtUJ2S1or+bvA3JN3GCracj7fsteHRmMU3qyRS2l3R35kmaixDHeVSZ+MiW7AY
	 5/Bgwr6c+4esBZiiq0aSBkunXeXJ4yoWoCUJpU8CQMpMXyk9wEJim2tta8TSyzD/KbXcE
	 gcIjL/w77SAot5OsrQLpnKbaQ6O8iORk1urk7OowmXNiwHRyo7rBu7/5bDLDU72rAzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790337191;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zSdLSjUB1trHWPwvFMxwCDt7tnlw9woYxerA/olVBls=;
	b=YgKo8OE1x3+H8YtY1v0jKkZkO1Y37D323FVmg3ewnbk5GQ3A2wjb+lvzh11KxF3lR5jw
	 VdTaoOHILNJTOvlFtyFQuTrwCeHxL0HWi6JFykcMVnqcsctV+bcOqZCJYfa/RA+ee12qn
	 2zcrjgr0qGPRt9qADoiYOp59ujoJ9tfrrcXx6ire+2/jeilaakqkYShH8GRwFl2WxX7I4
	 pCA9P0algXT/l4s8CQ+vylAIhoQpXw7rAspt9n2tjCE9aAYlY6Z7kHNqClTxBAsCeC+1U
	 6Ye+p4hptn+K5pLzJGdvNW0seWMvgL0LRXJg7qMYHJI+oVkKimiSOwn3ayFLc4Cto9g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790337191;
	bh=zSdLSjUB1trHWPwvFMxwCDt7tnlw9woYxerA/olVBls=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q3hGjWhb8sfldXGIV21sJRbKjVVT0fLBSZxvX3TcjEGr9QqvwjIUdrAio+lbpttbj
	 WtxYQAyeplQknnCWz61OkNco17Oed5kuXoYyNsBhUgQntIFpmn4D0+p+cWi/TAc0au
	 TqStMTSxaVwSGEU/8mIXgk9u09TxMbCwaZ/V4GGGo4P86DveGmUmgXeMOq2Om3E/6U
	 CJo3Zelwl801lUX8CwBjHkVpX74Ps7LMJmkciBeeYBTlg4pSfdM6g1DdcTY+39inMK
	 z+Aa/J6bMJrFKkcJ18XFX+arPdszJZ/liPOs4tF1G+yrVDa4vUMz/NrvTIsNRn543K
	 fvNi73MNKCwIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A18D8120D;
	Fri, 25 Sep 2026 11:53:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0DE3A33
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 11:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A32BA811C7
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 11:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpOIFMtjIw8k for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 11:53:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9970A811C2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790337187;
 b=UsbrWiBk8lZjK3QNztmdQo23n/NenwEWb+c3H+z09CyHa5E8IsrmrPqVxdFhBJSQ5rkT
 ARXUaw6EgeyYx/NKplj8OhjGVBQuilCiEIvrJPZ0xJv/CLpLIDX96m/v/G0VhzIjFT0f5
 wSZRq7og6pkDtExE6dHsm0XXdfRlXKwmXj1gHgdJYO9HnM6qmpx7B/QPuo2aExIssfAsZ
 XQz/oLjhM3G92onIMYx/GilcoxuxM6da8Zg2g5adBpw4zhW9CHMeUj4S41jCBIR2E2Xuo
 yuBEASH7iRINZ+q1o/qtDKPpULSns3OvWfy7Pj31++6Q4kE3u7LUN3UanLPNUF2i6qQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790337187;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=orfmEJx7nC8qNpN8mDnPrqPF8MeTDRaetE8SS7n4Ieg=;
 b=JsXv8hTkmItKsjinI0JB1lQsOG/TKSxQwIDRReRrf+ivQwQjRf76IphOI8cYYbp2CSL1
 AI0oxFSTYS5Jbau3fpvTziSiUm28ca/iYqEdKHvo1ebhEoopjNu8FCOO6d5T9exJ0gDMz
 Yi/PWq/AuYB1VwXMsALOAkPvBnFBmzMscbdDXtitRdG7Uw0dy8BmszsbTFx0FUPGZESro
 ly8J7zTD9Chr3QfUfGYTZAoZf+BUBAmxFXXAvCTu4s+ouJj8AEDOhpxSBEsn/qXxTTZfB
 qtPKDLRLI3yfsa0vINSJdD8yx9Y+ksnkVUk5zNJQwtA59RczWlCXshyxtPBjJZlDUFg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9970A811C2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 11:53:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDF8998378; Fri, 25 Sep 2026 11:51:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 13:51:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bf8b2ecee6b1b41746e8863b57c2c5ba3a623b1
X-Git-Newrev: a962be2eea146e06661712159698bc7cbf3305f2
X-Patchwork-Hint: ignore
Message-Id: <20260925115156.CDF8998378@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xen: bump to version 4.22.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a962be2eea146e06661712159698bc7cbf3305f2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes:
https://wiki.xenproject.org/wiki/Xen_Project_4.22_Release_Notes?ref=xenproject.org

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xen/xen.hash | 4 ++--
 package/xen/xen.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index c41f0fda60..a6c0291506 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,6 +1,6 @@
 # Locally computed after checking pgp signature from:
-# https://downloads.xenproject.org/release/xen/4.21.1/xen-4.21.1.tar.gz.sig
+# https://downloads.xenproject.org/release/xen/4.22.0/xen-4.22.0.tar.gz.sig
 # with key 23E3222C145F4475FA8060A783FE14C957E82BD9
-sha256  e2a69289d6d13c0a71d4f3a39a597741c85c0282d9af1ec5dac495bdcb2872bb  xen-4.21.1.tar.gz
+sha256  b2a14ca369e3cf26f123a455b1603f3962ae9fcee0b8640a9cc33879de198223  xen-4.22.0.tar.gz
 sha256  9eeacf4e4f91bdbcd16b3282bb86779e3122da032953ebccad4fccdfcf4cb3ac  COPYING
 sha256  aeab99f147957cd25fe8cc008992d5e5426ea73fb7d429923b5428a1ef1a59ce  LICENSES/GPL-2.0
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 729d213c02..f8a4100bbc 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.21.1
+XEN_VERSION = 4.22.0
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_SELINUX_MODULES = systemd udev xen
 XEN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
