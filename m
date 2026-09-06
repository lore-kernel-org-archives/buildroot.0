Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C6EC79F9E
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 19:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC219605DE;
	Sun,  6 Sep 2026 19:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNHrYiFABXm2; Sun,  6 Sep 2026 19:40:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0B4A1605EA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788723640;
	b=diHYiO35SrpecXOnqwTkSu6GK4Gh7Qxawyd6uwWbFA6MiNYxf8/lap8gs/tYj+wGGpBA
	 BnSGnT3L1cB9meCks4JJSxmVI1/X+J3XE17XTgtHZzMKCVPOFHg4ELoMMDO9JugBQQhLN
	 LVIv6nfYeo1EH93L61jhpEQil0hPMCJkyQOvCNxq2rPLEOpneiHwvU3EsjPZpdFyP6j0F
	 LLlIOK4eWXG9pIFahR8H4g0hDpGp7MLV/X1gg9JoEwEZjVL546L4Plbu1NVE6jdi1SSX1
	 PNvlMOXOKcHMomUUGcvHkkvyUKZwp3Ht5PEyHWTc+wwFJlHixVFiC6YFqhJxosLisig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788723640;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fZFHuXkBki1gnR2DRWvxzI0uXnyTZUBpTzBzpC7v+d0=;
	b=p0oDZC4dti6UVI/EDW05b/YIEPgJfnpOZeWiD0U+i193GhiVABO1t8DtKWJOASkkYHSq
	 QnEP5NOg1QzU7pR8OTROapvelKCSbbuhO9du0uKZckU0j7sdmtquKjpJEpL4DJCkm1iq8
	 6W8qaWrqglh61k1c92oT/dSl0XvHzzyifH24BDkVC4YMjBWSnf7WBWrbrr7O1LTGn0stM
	 0CNdnjNiYcZOWszHpjhFg5wn9M34p0rli0njcU+HHCSlwEYD8L3AqlbPfbeVxHat4ItSi
	 bm4V7QJw8mICb/sJZM6RrsOK6VumMCcyjOQxZJhp8qmIijgZlzjQyR9Oiex31ParktA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788723640;
	bh=fZFHuXkBki1gnR2DRWvxzI0uXnyTZUBpTzBzpC7v+d0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FR3hPnNGGEkFgwwgkgkBc9cWrLSMz8BzmLcOpCLNpGm/WGZusF+7PQEQ7lgS6ODgh
	 YxB84u3XUtOdTpIPeWaGWa2LHTqsZC04WDJoYo6UdhmhEZfheC0jw8VkEjWqr7gGxR
	 Ut7aNWxB3Lk+NJIsNQ+Ph1Y2YqyuTaeXonbv3BvOVlx1GTgGncy9cyoX+1mYXSZLF5
	 w3FE6kYIKRAyAi9Wix7i7S1ErTnCXWDNsdy9tuHljUhRIhNfEHQzvBdK2qXGS/jpF1
	 lsYLDcayDh3hP+Q32zvZZ62R84V3MO9RUz2e6SzcSKHpNI+tHrwXQKVJvckYUNbwFA
	 OPeMy/F6Ijwig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B4A1605EA;
	Sun,  6 Sep 2026 19:40:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D553E970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA90D605EA
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhMhtxdWNAfY for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 19:40:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1E39E605DE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788723637;
 b=HcsUjPFHb2ncbWMyW/TJ//G75a3jqeL7HM5K6GJZbW4zKq2yJpbxcT7ehYGz2+s66NGc
 bIQBQgwo7zcBgNQlxlkMyhPKVVFUotvwam0HezFYK79aJ5ZGtK/9+0nmjSlkCsi+fW24G
 vGlY2+wXDNg+ktJJCjvcHMgsxKHaydr2jdSGQGa+QdDPISEVmsBPDJstHoeFCX/zXVYdb
 IZ96y9FLtftb5T5sP9d/xC6eHWrh1gUShwBGpG6mvuuZr3w/2YTWuWP7c41R8tdUnF/4E
 Rgw5BgVasTtIgUP4iUCHHXT+2+req3G3xRmb/zQGKIjbuWxkLn9z8atHs367Z398Ibg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788723637;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VMVfR94plLeHHTtkj9vAncv9c9ePbP+PSTIN5keuUHk=;
 b=pYRoiyQoFVZAyn5IloP3dGkHy3ULo3CUYWAWnaH5Ds6lTXUljwjmUf9GVJJnCOXRx+5k
 L1i+uBLshGKEWAzyxstRy3l4jOJQx/F9M9Ts5HV+PaFivEu3RcxzPQVzPjYvpGW8nQDnI
 gsSB9bET+0/PMn5o6XSxbI6nRSoX4iBQ8UpiEnsSTAgiDzYjeE5eCobBOVdoWUQUs0dE1
 Nmbjgv2EWIMD192kblDavMWjsRV9taHNeL7mqRqvU+bmqwprags6JXyQgxnmzOsTtzwoj
 hjjsVa8hbMpSnUaluM0JyJAOvpcEctItUTLIrgFqa+znb2l+P8Dq14kVcS8GrIBrnDg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E39E605DE
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:40:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80BDE95465; Sun,  6 Sep 2026 19:39:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 21:38:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3c4a32d34bd70fbfba72f384d852d2603233c6c
X-Git-Newrev: d1fbea37a6e1f81f7117e4b1a238fdc581132d83
X-Patchwork-Hint: ignore
Message-Id: <20260906193935.80BDE95465@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap-ng: bump version to 0.9.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1fbea37a6e1f81f7117e4b1a238fdc581132d83
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/stevegrubb/libcap-ng/blob/v0.9.5/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcap-ng/libcap-ng.hash | 2 +-
 package/libcap-ng/libcap-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index d79ef54d07..a39cbf142c 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  fe11ebbb55904763b3532f19069f13ec319042634620180a03bd4653d301563e  libcap-ng-0.9.3.tar.gz
+sha256  a2b4211f59b231d607c61ea2a13e9ecb38f446fe769b44e12da939d5af6d978a  libcap-ng-0.9.5.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 31e0ff8d64..9d29350b2b 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.9.3
+LIBCAP_NG_VERSION = 0.9.5
 LIBCAP_NG_SITE = $(call github,stevegrubb,libcap-ng,v$(LIBCAP_NG_VERSION))
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
