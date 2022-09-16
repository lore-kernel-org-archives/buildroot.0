Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10463ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 21:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DF31416BA;
	Fri, 16 Sep 2022 21:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DF31416BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXQMriUAvGAV; Fri, 16 Sep 2022 21:01:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53C1740C18;
	Fri, 16 Sep 2022 21:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53C1740C18
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C51181BF29F
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A05E940C18
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A05E940C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXZXx6s0N5Lu for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:01:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43E9C40137
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43E9C40137
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:01:04 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id a2so13436599lfb.6
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 14:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=sPW8CS41L7MEu+EdRWl7toXoJFhGCTscHVumiaUmWDY=;
 b=kp1fhruLz/KPeQvTTbpPlXgD2glu8nhn2SFz+w3YBNNxVTxd0pzQdZR6M4eWu1WQEP
 AnpL+/4Sy9e/JHJaWSOP+13vYuTtxtZz+Zx1EMMuKmJXciDB5Tq7k5EcBD/QbKaMTbgm
 tRWf1cMJ1/V1RlrrkUvY/zaWV/dqkFeB+i1KYCFEkgGyRUVzNuXCeSFB+Ar5C1enQdqp
 WHx1fkbkVpbM8q/rPbvCoiRIRnLMd4kDGHvdlhM+TLUi3q6aWZ3rjlP1us+WNg22gXSA
 6+WtTgDNIbjADNcHrJCIh6jUAX7narT0Ljqn43qVtot3VNFhQ+3Pzpxe4eQAMgbj6aHb
 kw4g==
X-Gm-Message-State: ACrzQf2Ami7l1MFjZx0eg758Uw3/PJYg4vbiiHEPf8jI/jkZm2gCREtL
 3F48/+46n58yKdYhNuslEQy4NxEQf3cOKQ==
X-Google-Smtp-Source: AMsMyM5Z4FlWbITsbi757PGLtYMVIzMuCuvJ536+g0R7+WK0F6hqemjLfzTLpZhRYPVxwz0391egXQ==
X-Received: by 2002:a05:6512:692:b0:499:322:f81b with SMTP id
 t18-20020a056512069200b004990322f81bmr2072188lfe.207.1663362061910; 
 Fri, 16 Sep 2022 14:01:01 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 z18-20020a056512371200b0049a0832ffc9sm3341243lfr.211.2022.09.16.14.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 14:01:01 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 00:00:57 +0300
Message-Id: <20220916210059.2395129-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=sPW8CS41L7MEu+EdRWl7toXoJFhGCTscHVumiaUmWDY=;
 b=cFyiFZ6nVnDJIZWT7lnBE7o4LU8KfRzQqxr7fOb/p2Tux/VRyrJzqRFlpW7Ig+9uoA
 ZOqHBwnRCsd0FL2xk5+ESjdQVfZ1drpfTPf6IBWzTcHOvUBhUzx1U6V/haoe4cntRTci
 gxp5pIVZGzSo+bV2aAV6bCj3Cx6fJa0indCMHfaeGyvuz/RB05npuIpfFwR+f7DUVpJy
 M+hoElv9vG4e1pyw2O1vwBXq/Nowv7YzmBSN/HIQj4N4H77h9GA6e8zuxKanW6lLVd8T
 OR+C4dalagLAzSL8JbqZZJZoLKHerGPXeQEnkNpRsiAo2UjFmUVH7A7v0vPYr4XDOax5
 qJ9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cFyiFZ6n
Subject: [Buildroot] [PATCH v2 0/2] hostapd/wpa_s: fix static build issue
 with zlib-ng
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Both zlib-ng and hostapd/wpa_supplicant define functions with the same
name 'crc32'. Buildroot autobuilder detected configurations that failed
to build due to the naming conflict between hostapd and zlib-ng.

This patch series applies appropriate hostapd upstream fix that renames
'crc32' function to a less generic name, see:
http://w1.fi/cgit/hostap/commit/?id=0c7b3814ca6070a8e930dea09fde08b4058a4ca6

Regards,
Sergey

v1 -> v2
- replace weird Kconfig dependencies by upstream hostapd patch

Sergey Matyukevich (2):
  package/hostapd: fix static build issue with zlib-ng
  package/wpa_supplicant: fix static build issue with zlib-ng

 ...ic-name-for-IEEE802.11-CRC-32-routin.patch | 101 ++++++++++++++++++
 ...se-a-less-generic-name-for-IEEE802.1.patch |  78 ++++++++++++++
 2 files changed, 179 insertions(+)
 create mode 100644 package/hostapd/0001-use-a-less-generic-name-for-IEEE802.11-CRC-32-routin.patch
 create mode 100644 package/wpa_supplicant/0002-wpa_supplicant-use-a-less-generic-name-for-IEEE802.1.patch

-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
