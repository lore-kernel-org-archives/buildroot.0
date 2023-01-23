Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56418C25B50
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 20:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E26A540B73;
	Mon, 23 Jan 2023 20:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E26A540B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jY_iO1XwY-qT; Mon, 23 Jan 2023 20:46:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E952040B6D;
	Mon, 23 Jan 2023 20:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E952040B6D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADFDE1BF28C
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 20:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 851A160FBB
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 20:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 851A160FBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cFa6ZOdrHKcI for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 20:46:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0088460FB5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0088460FB5
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 20:46:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mail ([88.130.156.241]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MacOQ-1ohyrc0wJ8-00c8cE for
 <buildroot@buildroot.org>; Mon, 23 Jan 2023 21:46:22 +0100
Message-ID: <21929154-7cb8-31ff-20de-d48d25e53423@carrier-2>
Date: Mon, 23 Jan 2023 20:32:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: buildroot@buildroot.org
From: Stefan Kuhne <Stefan.Kuhne@gmx.net>
X-Provags-ID: V03:K1:eAsX8WMGw0yISNgoSJdh9p7vjKZVLD7cpW+6mTSmsUyUKKqs5v1
 ssY9rWTCo7y97Z0wWEnG68CmFrWKHZ+RdhPj8jgnLoyomEp44k7QLeZZotK6xwsYFeHFXFa
 zYoUnwFhqxKbGvque6m0cwu6m478CF4730GtMo7Xssum7BmPgTzK6TqxOrJjdO/DCKjGUL3
 1O/mvHQA/YSCxCoeYvWUA==
UI-OutboundReport: notjunk:1;M01:P0:A05mDrRHys8=;kzJMBvUQLNkLb1OuYpvVUOfq/ln
 Z/w4EAwHdXEIW/lHqReMjjBNvb8kUpZk6b44umILk+rX+LAZHr3fO25WDwtxfevHGILXan6um
 Pt5NHxh1FTQwTr8tH+vkWydtU+UhbNTzvaR9vc56wkl18cUVXaelochkYuw5XU04SpSLb7QDl
 qsYtcgdjSZtHjYuNBXbu+D4P1Gke7Uekx7+8Qb0Ota39vGuIDEGkgEkq1ldukGHiykxtYO5/p
 Za0GYZ1/hQprssCtv7T1ourS62DDtpdlcl58ytdjvBjujlDvmzTyyLcG6XUZW5hWiPR3TKDz6
 oPISxdaPexA5mwQ5qm5T+bDqc8rXkAdYroSs+uOZftJAqOVYXfw6khN62TY3i4peuPV2JYtUV
 IBVNrjR1/tj/j+Q3NvO/tHYtE+X2t/MyQDgdSJjZZqlx0CiPmdzmajKeTs/cpIRJq2fYdru2d
 uReKbwAAsA34cqXADLbY1UgT3VRLeMkIRnPuPhhMg44jVImdTUED1ZFv9FtXhDza+pQXvI8cP
 aNq8samuYC0ajlA8CrervRACziAPGQEqRgBLSK7ai6IPQJAxH9KvND/Z9FtvxDCSYsmeF7ewu
 oHCCmjd2xf3DCoCZ4tkLw073u2O/3pSunJ15BNT8X6MP1NqF7gydxjXXOpP/0wDJcYX9R3RNp
 /nYJd+M+ZkgX3vm+kEDuQIZyKpnRSlUn19Nu1itWiwEv5EkvNUoulVbEsuJkI5oi5ftLPMQ/V
 2+EPlRW1hDUC4VyNjmConszgqJhrfvQfIQcof5L0zK3Q1Q+RXab1Bmsxb3C0tcEmFt/hPNGdh
 eqMwiN9Ub95IjF5tEOLmREZUM5GEYBK9odpg945m+/K4hQ+zHLwj3I2F2q9bdRp1DvtbshuGE
 j8rZgfwqMdHz/D6Rw9OOUGeE8r4fJOlYt5cXtCK1nWJtwSTi8pksbbFbhiWB9BVIdVEpP605/
 IdKW725vIIPMsTEVI7fMkKl0tuo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1674506782; bh=d+E3ltoMoGan5PJboh+//Glb1eyELEO6yF3Oq+g92Kk=;
 h=X-UI-Sender-Class:Date:To:From:Subject;
 b=Zi6mrYFhbxU2ab77QAk7xmzTAMeL5a3N5r54d6NpLd578gZsg4cz4txV+XEEQ8kfU
 r/WOwmSHGVoaBDUnK0wPhFHULoGYo0hQ/qkIskL7k84ENA24885o46o6EzeoNjt5h4
 dj5GS8po0XCPfRJBJNcbyRpCrRFq6ZPIMNKnuFpAZjQuAWCBPrkzM6hs5HTiKjnGua
 5QJaPDkx7t5oczkrQn8WlWz969mcqv6gV8meNHyWN39ilezl8DkFvXQ5QNGX3OYEa7
 D6A8fJ/YfYOWnUb0H28w/EMoNb9buAL6PYiyJ7Z0+wexVrtn6SzVPRDqEMxkvrEmGp
 Cq26vUTHm1LUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Zi6mrYFh
Subject: [Buildroot] Build of glib2 failed
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
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello.

I've a problem to build glib2:

...
Library m found: YES
Run-time dependency libffi found: YES 3.4.4
Run-time dependency zlib found: YES 1.2.13
Checking for function "ngettext" : NO
Library intl found: NO

output/build/libglib2-2.72.3/meson.build:2102:4: ERROR: Automatic
wrap-based subproject downloading is disabled

I use bulitroot-22.11.
Does anyone have an idea?

Best regards
Stefan Kuhne
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
