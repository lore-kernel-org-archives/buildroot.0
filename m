Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6617AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 29 Apr 2022 14:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2977400F2;
	Fri, 29 Apr 2022 14:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZ-wVBUsGz0a; Fri, 29 Apr 2022 14:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F8114040D;
	Fri, 29 Apr 2022 14:08:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48AC51BF2A1
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 14:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 453D260D74
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 14:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=freenet.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-quUlWwQXWj for <buildroot@lists.busybox.net>;
 Fri, 29 Apr 2022 14:08:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout1.freenet.de (mout1.freenet.de [IPv6:2001:748:100:40::2:3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E89160AEC
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 14:08:37 +0000 (UTC)
Received: from [195.4.92.124] (helo=sub5.freenet.de)
 by mout1.freenet.de with esmtpa (ID earthquake.de@freenet.de) (port 25) (Exim
 4.94.2 #2) id 1nkRCY-009Uya-Gx
 for buildroot@buildroot.org; Fri, 29 Apr 2022 16:02:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
 MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nxxtQGfwci9U+fgwY8v4YPsjo23217jx8GH68LsbX3E=; b=iVMhYMJuRAxbTqDa9XL8X4q30G
 S8rvzAAixB8jUhapGfFLvUGD0RAXHu5/+DtPdRPpXft+mxPapAzt52GbRF/BU1ifXFPdJvgSf8rki
 gaFgUw0BMC2bkuStHt0/wdRHL/rch5zhKSLIuVuiVbRZgI2nwZaGXpidgmQapoZ3f2yPrbSAlQq6l
 5D6/Vb4MFCHJH87ilUDAl8GebB1HHtMbCrquWjnexo81jjE5JR7sQy5mvkOKTx/4ZvMHWeVA6oCP0
 qpNdE0IOkCJwGK+QWUutxP2f4VAvg4qFWN46kQ0RxjzThP4f+MxnfOP68F22DAqqkZuhuNUwOH8i3
 mjFRrP7w==;
Received: from p5df03b90.dip0.t-ipconnect.de ([93.240.59.144]:57225
 helo=[10.32.8.78])
 by sub5.freenet.de with esmtpsa (ID earthquake.de@freenet.de)
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim
 4.94.2 #2) id 1nkRCZ-00DAaf-7T
 for buildroot@buildroot.org; Fri, 29 Apr 2022 16:02:31 +0200
Message-ID: <8043273d-730b-c378-fd91-21e6902081fa@freenet.de>
Date: Fri, 29 Apr 2022 16:02:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: de-DE
To: buildroot@buildroot.org
From: Earthquake <earthquake.de@freenet.de>
X-Originated-At: 93.240.59.144!57225
X-Scan-TS: Fri, 29 Apr 2022 16:02:31 +0200
Subject: [Buildroot] ACE + TAO with buildroot - GLIBC_2.28 not found
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgppbnRlcmdyYXRpbmcgQUNFIHdhcyBzdWNjZXNzZnVsbCB3aXRoCgpodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjEwNDEzMTM0MTM5LjEz
MjgxLTEtbWF0dGhldy53ZWJlckByb2Nrd2VsbGNvbGxpbnMuY29tLyAKCgpBQ0UgbGliIGlzIGJ1
aWx0LgoKV2hlbiBJIGludGVncmF0ZSBUQU8gaW4gdGhlIGFjZS5tawoKVEFPX0xJQlJBUklFUyAr
PSBUQU9fSURMClRBT19MSUJSQVJJRXMgKz0gdGFvL1BvcnRhYmxlU2VydmVyCiQoZm9yZWFjaCBs
aWIsJChUQU9fTElCUkFSSUVTKSwgQUNFX1JPT1Q9IiQoQEQpIiAKJChUQVJHRVRfQ09ORklHVVJF
X09QVFMpICQoTUFLRSkgLUMgJChARCkvVEFPLyQobGliKSBBQ0VfUk9PVD0iJChARCkiIApUQU9f
Uk9PVD0iJChARCkvVEFPIsKgIGFsbCApCgpUaGUgdGFvX2lkbCBjb21wbGllciB3aWxsIGJlIGJ1
aWx0LgoKVGhlIFBvcnRhYmxlU2VydmVyIHVzZXMgdGhlIGNyZWF0ZWQgdGFvX2lkbCBjb21wbGll
ciBidXQgZXhpdCB3aXRoOgoKLi4vLi4vLi4vYmluL3Rhb19pZGw6IC9saWIveDg2XzY0LWxpbnV4
LWdudS9saWJjLnNvLjY6IHZlcnNpb24gCmBHTElCQ18yLjI4JyBub3QgZm91bmQgKHJlcXVpcmVk
IGJ5IC4uLy4uLy4uL2xpYi9saWJBQ0Uuc28uNy4wLjIpCi4uLy4uLy4uL2Jpbi90YW9faWRsOiAv
bGliL3g4Nl82NC1saW51eC1nbnUvbGliYy5zby42OiB2ZXJzaW9uIApgR0xJQkNfMi4zMicgbm90
IGZvdW5kIChyZXF1aXJlZCBieSAuLi8uLi8uLi9saWIvbGliQUNFLnNvLjcuMC4yKQoKV3Jvbmcg
d2F5IHRvIGNhbGw/CgoKVGhhbmtzIGZvciBzdXBwb3J0LAoKQWxleAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
