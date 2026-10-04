Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76297CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E489880AC2;
	Sun,  4 Oct 2026 15:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pInZTO3OQ6qk; Sun,  4 Oct 2026 15:59:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EEE2B80D6A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129580;
	b=YKERvjFQnUVumxOrUYo3rXG46hTKPOa7fNrBPjC+dr2WDb9IYUFrjE2vispJIdGcyiR0
	 TP1XmWXRs2YLQ0rjve6z5W7If+1vPC0HxLizDWf+pwsMi+8StJ6F+dIi9oYmFgmOU2oPh
	 YFu6eBXOJKbpNgPcVttqFsW4Ytmr+mJgd8AULZTgYEMmj9qyAdHqsyjiW3JieAC4ny2Os
	 Mtt4SCSTC3AshgrEgIEdeWXXpgk4nQfQIsH57h6F27yB9bCevD8yza11J9sCSWH1w9JHM
	 bVou8MY7NbQpz1VB9NQkutPd9GUDdVkTijdhWQfdesI0ymM4JjCNf/HcNwzhBUVarhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7KK1KkWSd8HmYpgwFqq4ls9F0N6fAzM17a9aZ3+GMS8=;
	b=UfIiUlFMbwJDlm6x+PINjfXti0C0i1F6NJmwIKDNIY8qMLII1QKYWXvmVlwe2u9HIaE+
	 MlFoXeFFq7nuS/XI2vijPV/8LctgULCFPQRqXp7eZH16v4/ATUNbDM+C7b+CagnivnKUJ
	 6IyA47j8leBLYCNIxPKhyG5j9ixuvsY0154LTl6D349wdtFZATt6egzBWA3MND1sZx8Xs
	 pBhWHPkUYikCt95sS+57mNE1JU6iwFRuNvUqykLf8AxziJf1+OMKFvvHwLbeQy0/Oayrb
	 YWNPQUebVq1lR8+Nq3CXckD/JIFsOxwmD0JEhAgBeh5120uIZLIZxKWTU1LRkGtTHKg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129580;
	bh=7KK1KkWSd8HmYpgwFqq4ls9F0N6fAzM17a9aZ3+GMS8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EKbG6B/WbdSct9VNjzsqk2YEYU2X20948rTVeChvuhBmuX0C4cng5pl27vC0W24vm
	 ovBsvBYP7yKxM5g0UKtdVf2/y+wGQ0sVpuk6N2MKLNDSDeaMUUW508tipjgeKdVyLI
	 JSTXKQuz6yqSlZvTwtutzwirwPxjtjyDfyCU5m9TB2Igfk4zhQjmHiXxTucOOXGiPE
	 qld1XkPZuuFOyyr/z1wDWKGZyNgP1EWoZtDtYHxme1tVGtbjOEAr9mT+9zvhiEK1DT
	 vRIeq97KKFykqqA9ICiMq/r6n0hUsEFlF5hzOngYsHGmNdZ8Fm3vE5g+rjcGey8nor
	 nwhSB7NuR0x2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEE2B80D6A;
	Sun,  4 Oct 2026 15:59:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AA3F32F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CAA580AEF
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ci_dbJyboKI5 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 99C5380AC2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129573;
 b=BUXt2GZJ1mPH3mtuUsJiztPT44E2GQUzUpZMXdoYrCF1ECnVYixWohoMTpH6qsE8QLKP
 MhII42lPVsVRY6q/c3kvLpgyFBK5c9ZBNrzV0gMg2jXBXokh77j3NGpkzZih8mBXwyMnp
 3rYSu6WRGtU6HwxYLNo8N8qvQ4fvRckv479pvAaekixn4lbCb9Td2tlVRq+yzkqduanrp
 9q8BzH/Wzn33AUIBVUZkLL1FNS2R9aDlNCH0LoiPkprq5fIBhuZE0Ymyxu3mYToi3KzMW
 fMIhN5Ct+It/4M795RKHJ020qFcnS72EYYunLnsZ70zYQof3rcKomCKTRA3C8pEzVHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129573;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Kvw8ZSpjabQG4GAVxQ15rEw5vBpkvrNVdNvizcTLVV0=;
 b=G00xsTGy4gGXqi/FDpI+hop5zHD6t9i4jMIJqZYNzkwv4JIBS72yGajL9odJMSNzUiGo
 hXSr5CDnXtAS2Uyv7455BwmpRpWemyDAq/0V4C+NkF2sMFM6ME7IUz5bHT/Q7miANVaUD
 zILJY9aF71OPy2w9WCfalwL54g/YnGMeuU5B4KJu5MX+WAcs/het/MCM02wlDcT84jloC
 /UdFlHaFGAqJzlegtzAN+oeFvPlkeALnGsbOm6jeIQTZAxIncx/6u3leDQpOnLHk1pIy8
 N9MPjHFm/TgHwGald/6bb5eJzFh4plO0WMsyZxYcdCHIazUWit02fnHV6pdk0rRMpXw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99C5380AC2
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53DA88C99F; Sun,  4 Oct 2026 15:58:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 17:57:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aaeac510a107ac67ccf182e4830acf6e5a019407
X-Git-Newrev: c9293e3ef17d337ea67372768eea7efba2d09d31
X-Patchwork-Hint: ignore
Message-Id: <20261004155818.53DA88C99F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-googleapis-common-protos:
 bump to version 1.75.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c9293e3ef17d337ea67372768eea7efba2d09d31
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-googleapis-common-protos.hash                              | 4 ++--
 .../python-googleapis-common-protos.mk                                | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
index e25d4cba33..aaf12f78e0 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
-md5  e67910a98d106e703ba34483626c4538  googleapis_common_protos-1.75.4.tar.gz
-sha256  4587babdc82a8d7e5a3d4f5a6697e064bf44a598b4d08341c212b68185eadbcd  googleapis_common_protos-1.75.4.tar.gz
+md5  d1bdd06d44f08c8f3cfd5722ab5363a6  googleapis_common_protos-1.75.5.tar.gz
+sha256  c7a866fc34ed29a3b10af627a4b9b1dc2433313ca6e959f0ae4feb132047ed72  googleapis_common_protos-1.75.5.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
index baa2b5cfe7..e21c5df3ef 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.75.4
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.75.5
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis_common_protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/4b/13/f83676de1dce4f8106bcba91725b3f3f4baf6ca1977685102b008b8e0097
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/8d/2b/6ce81972d5c8cab9705fddce3153be63222d9e12fd96f8baba5038a744dd
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
