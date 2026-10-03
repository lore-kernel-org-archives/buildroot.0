Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D232BCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD17A81488;
	Sat,  3 Oct 2026 15:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVb0WA_rs5re; Sat,  3 Oct 2026 15:54:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E70E18145C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042894;
	b=hU8C8d4GW7IVBK+erzBzoVa6Gw9+83sp+plZejZR8SNYCFja7BoKMqpLcoMk3kAUD+eE
	 LYPwelcgneij4StNy0AenUQzEEHfFFo4UfPf59+V5OrTcrT3ygOWQHVD6EIMMnAP5KfhD
	 6pVIdsU7b+KpLjgD2XhgRGcsudO6RpNGKflkcbVhAx7KFz6b1enkRhwc/sVun4fkNh9bE
	 zBOFST6ZHtsm1fOcNr0FifbfNJldSvf0Bf41ori4TwPaRzzp4elbyjHjSLNsxwSIKxu37
	 Rh3FmgqwJ+eulEod3q6sVotzlfIoRpXlO3Hw9fL6K4QSmsgIGL7wMjd9YJcaHpnnAxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042894;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Gu5FOrTP6HvtiAzH2VSyxbtiy/d7668WNTQsx70x2R8=;
	b=EG0jFhaSRzOkSCcF9Ppik3WdDnHh3fs8pKhH6vn31Gwc1m49EsCXBJwaykptigiddnQs
	 Et7MqdqSn6SU6li05MZ4L3Ov7zcHpXEwIAudkQWzGe9GUkNcb/Bjhu9Y02KsdNb0MWQrl
	 sEU9HQy8cLFO6+Qx+B48UlVPAsC0XgAtE67+WoGuPlXdj7afOlJ+bwYk5/SJtbuYoMQfY
	 f6oJw3RImIrjdBNNPPVqTjNPMtt+sIgdOcRTEns8D1zQf0w7dVQFKN3hEgWYNrQ+UcG1+
	 sxxBX2LMrqNzk1o+Qwa0V37YU0DmomILLR18yU11bxaz+Af42VuZYq0x9/u3ZjpWHIw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042894;
	bh=Gu5FOrTP6HvtiAzH2VSyxbtiy/d7668WNTQsx70x2R8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XYtRW62iviBntM0rldwOle8gnVh8OK21yVM/LpuYaVLOIBV9qlJh1rlpE0XS5XyQT
	 DoOiW3iJ2238pCbcFyRxiqaBEoNV0nJ2PxkUXwC3MgEGOPgSiqRDtLRlcRN9FqpdJ4
	 l2siSdNwx4bbtYDbtGWPz+khyBiGnrA3hV+BaLeFocqiVihWjsR73rZAVGOHDPkfVh
	 wwEJSW2IKftWsR8Y0APQqyMTm/nBX8VoPnvCSZ4dOSb5RgtXPxZzrdY4D8aTdFqWaQ
	 3iBp6XM5BqtZEJvQdw8TMlQPGcHyjyeaj8rgcFgkg1hodh4as0IJ/1Hy/mrKl24vfT
	 /3Kuu2Z9J4pEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E70E18145C;
	Sat,  3 Oct 2026 15:54:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E129335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EBD76064B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id koc07fdAYmgn for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8293360684
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=dQqj49JwiY6Li0ooK+re6By2sNghit+5VDmZQsqQ4kHNeGy/c+8Hm3CxeefSpuDr7gnd
 iyp9zxaD2ksVk7DJCjoUKbNsmMgL5RF4JmDPNLtSvRfkleuSKlplrlsrEAsRc0EO0N7wg
 fc3leEA2dWLonNOAY3CNun+XVpvZm3T+UHlM/WduBeie8mtYqPVKuBnA5K14RTQd8fOgG
 7eI2RV4p8o9M+I002ePqcYJJm93goq/DTiWHv6VsPhhJExWvhO0hMctXT8SMUPklrWESz
 wQnISagD6maPFycjmNJtr14Ii0vbfgwFrdSTP45Qf0EGxsVATFM2qUJes9dbzuvyGyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Lrim8WjrDhvSSsFSA6edAf7qXXN3Ra+5/+pfNk+az9s=;
 b=G5kXGQ+4qW7p++kMhpxnHo/VOSf5nxisWzRNg3Wxl1C8AxgnjBphvBuX3WlVduwVwk3s
 xq4Jg2xD2DlLmFVZgtRLhdNGOaOCpD9blQBR7wVsNlYTmpLE/3WaSnpBbccC1wcfCmn1h
 nXUsDroGPQps+c9iLy/m/NB732GJP92yrZxIrIhlM3rFXVXvCOr19VIm3TsHaVtQCrJqq
 n5TGa8jQgQSg40+omYQxnDaha1q9mNZkjCnA9HCE4eINsBm1EQ0W3iAo5DNMCO1ZiFiW7
 Vd4J+7ud4jiLRRu5ryVdwaMtJ7gCXWZuoPoKe+0Kam/duYmIaq3JJi+cpYkr1hMq4zA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8293360684
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C33378A31E; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e793fee963c68721f9907903689f4741a5e5ec7
X-Git-Newrev: ad11789d542762c9f6f93a38f41a47306f4ad160
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.C33378A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyqt5-sip: bump version to
 12.19.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ad11789d542762c9f6f93a38f41a47306f4ad160
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Ralf Dragon <hypnotoad@lindra.de>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyqt5-sip/python-pyqt5-sip.hash | 4 ++--
 package/python-pyqt5-sip/python-pyqt5-sip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash b/package/python-pyqt5-sip/python-pyqt5-sip.hash
index bf5560dab1..65882779dc 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.hash
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyqt5-sip/json
-md5  739bb540472188851f15aac80bf8e715  pyqt5_sip-12.18.0.tar.gz
-sha256  71c37db75a0664325de149f43e2a712ec5fa1f90429a21dafbca005cb6767f94  pyqt5_sip-12.18.0.tar.gz
+md5  30996db30ec078362cce4920dafdd08b  pyqt5_sip-12.19.0.tar.gz
+sha256  71cacf1879da2cd3e50cb239e21673cfe02d358af70ab6768817c960428868c3  pyqt5_sip-12.19.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e6f5b427c36f94ecf86bc01698af7030a1ed6eb3748110d5dbb8d142d804611  LICENSE
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk b/package/python-pyqt5-sip/python-pyqt5-sip.mk
index 7360e6dd48..74e1f28eb5 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.mk
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
@@ -14,8 +14,8 @@
 # recorded in the PyPI source file "sip.h", in the SIP_VERSION_STR
 # macro. For example, PyQt5-sip 12.15.0 was generated with Python-SIP
 # 6.8.6.
-PYTHON_PYQT5_SIP_VERSION = 12.18.0
-PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/f3/31/5ef342de9faee0f3801088946ae103db9b9eaeba3d6a64fefd5ce74df244
+PYTHON_PYQT5_SIP_VERSION = 12.19.0
+PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/0d/9d/5179b8e619fe084218a87f963f1648cba4c5aa5bb98dd5661d2cbb9eb1e4
 PYTHON_PYQT5_SIP_SOURCE = pyqt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
 PYTHON_PYQT5_SIP_LICENSE = BSD-2-Clause
 PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
