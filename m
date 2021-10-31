Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85241C433EF
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 05:39:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B974D60FC4
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 05:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B974D60FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5506680CD9;
	Sun, 31 Oct 2021 05:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bU_HcTVonxcq; Sun, 31 Oct 2021 05:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB5C580CC5;
	Sun, 31 Oct 2021 05:39:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 90ECB1BF312
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 05:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D73840130
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 05:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=hotmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hdSLqvw81BS6 for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 05:39:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from AUS01-ME3-obe.outbound.protection.outlook.com
 (mail-me3aus01olkn2082b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7004::82b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A33514012A
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 05:39:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXwzUw5S/GpJYs99R4T5EbdBVxq6dO+ukmY818D3IbwIPTiUPA3HKIWX4nTHY/7qiJtUTtF0grx3ulJykmNNZ2tEmlgBOXSdJl5aLr9rF2jy/iquz8gGrpBR4Bepnvh7XlzfK20K0yFs1KpOAxVhHynizjpwpGtEpmyJLdJjaq927cvC75Zcv/rp64NcvJbPMXqio20LAqUUTSe/kcdjpVjPhAT27fAA3xqs06nxAMvqMRY6K2OS/KOduecAl63Ah4lzsLfPVGYsVcVxSqAjOAFAaUlXX0LGqC5EiRypEosykAksnuAVZ+/WTUSlLlLcO5BuDIqD/PDS1z2v8SiMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoIM7krxtmYO176P9zT5bzXJ02SrN0JsxMOe/bFmZbg=;
 b=EgYz52VKsuxVo7+PhLp6GIT1mbUdIKJYW2MyIBGBMb4TVkuWmOxz6wnz9BFQ5N19/8dPLehoql0FXSk5ae/d3EKL6BA3DSf8wr/VIRqKX6X+7TsKBfPlDQnO7UQZkVae7zINjgUtwEdc51+W4aO3AZiFGGLr8LmntWvcnoceufFAImcGu9WUOtQWRmTmBAFrMpuvTyAv30hXUyIceto4oxrIiHUGwpRnK4FykWJohwf2bI6n/rDWOn3Pt1OkshzE9ardJInKJup1mSG87o03EuKJ4GBcUH6BMs9R88N/vUr8WY2BmqB4nJU8aM2RGMYdJA4GW4QnOOKRo/xr9JqCGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoIM7krxtmYO176P9zT5bzXJ02SrN0JsxMOe/bFmZbg=;
 b=G7bDAK+87x71yUJGYpfS+S4bK0dNIEv+zZYY4lsX+fZk+LiIA1sZ/sKYpB5yPCH4/P8MHn1ZuC9AEznEGZJ5Qt+uC9UvDfRyoOojbAWBpfTFCSe1AJnIBQbxAaE6q9Rbe1L4dnAiMSqLmYShS9+GisNLLiXU8Si0SBDsmBffOhO+v9Fi9OhFdfgTdiWAJSUcWBFtmAsaqvbpgnpXZ9ox/KV/K75DB/8iWUGB/IOlElVkdUl+cDYuGaVBT5Vv/GTXpZGjFeo5eNnMKi0rr2G3hdqMYC3YhomQymN7Y6DvOu04MPWCxOukGdEFVJcXq+KU8/81An5a6k/t9MuhsNMlrw==
Received: from SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:161::6) by
 SY7P282MB3721.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1e0::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Sun, 31 Oct 2021 05:39:27 +0000
Received: from SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM
 ([fe80::c5b7:4ae0:ae51:3a23]) by SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM
 ([fe80::c5b7:4ae0:ae51:3a23%4]) with mapi id 15.20.4649.018; Sun, 31 Oct 2021
 05:39:27 +0000
From: Bassem Fahmy <t_fahmy_bassem@hotmail.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: autoconf Makefile in sub-directory
Thread-Index: AQHXzhmIUZuXCKSNZUucmeWHDquJlg==
Date: Sun, 31 Oct 2021 05:39:27 +0000
Message-ID: <SY4P282MB30149F3F7DB7C987B84AE139CB899@SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 91704edf-38b0-f31c-7e1e-b0921a0e27b2
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [lT6PzkV6hv+JeHsvBIBmxaguRMQTfTuwxdU0q3vZw00x0eG0iswO9YeI50GKiRSqSm1HeQ1QNDQ=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27d1a706-2169-4986-78e6-08d99c30cdb3
x-ms-traffictypediagnostic: SY7P282MB3721:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SWD7BMshI8LFoxv8fC8obXe+LFi6JjwBHxI4BfDqxGGBo0OBTs11IvAaWH+GjTsluOWvDZlo7G5jPZ7b8UufA0qOoiFe1GjVs+jRu+OdiUeC+UsS4SJnoQnnLIVoLxap9+PUjUJh6xeLoWDssS8i+iqZSMYrCQclT3Nfgv0ObeHy6YZJwwsl14xogk0DzAtfMFw5eUp1PNnC4tlctTrxz5N2Y8+hW2IAOm/gx0xmrUg/dy464vpE2EKLOZx4o5t9tDDOVER1HZVBMDnxFQ9clB1NC3eVHAKV69ARuVE3Uz7OuvQIrUHr3sQ6jMQNSgxF6QU63T4QgEgW3ZtdRm5BHWmWlzKwdavTnn3AiJltOYffNDZSxcRxpmnUk2WkBpj0C3P5ytZXtJup9hptFFmYvR4BIRLm/nYSF8b3RvoluVWCDqOnoejRSB8rA3rTukLUqTCOf6nyO25A0Sy8nm0laAJrTz1f6AW7AWsFXCuOVS01rwEDt0CZhuq6qSrnPwP9th4lcuy7mm0WSmY34xOWAO6opngo5/NNpLDaV1tiywU=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: aR2mbjzewIr30oMqYqpxkwbl3bDRfpD/RP2QzveiqlognKF9liVtGWr/fQwSMPpYeZOglEuTaG2Vpb9DcwZxGCA1KmOVc2wQJogXQffFQvdIDLjMkETC/qQ1wHesvGb++bt7qv+WUJPA7OwRlxyY33SZ32LUQwglfHXI8L1voXDtRFwoXJvbpFKUR7jFNzqGtYqbm8WFdxLBQT+iR9IMKEyGdvrQPzWtmSnuFLawoyCCy23aSXN+dKDp2bZhCSVWQ+Jr7IkRUGv1bmcdkxOgTWXSvfWGxQKSrRmBYUkDpYaaXpqUwJB5N1fEdX4Km2cElI63dSK0hWb7++1oKSkLcsnahe8clQ0sXSpT91JFwxP0RN2qA0/7VoMSDmD13Y5VwWzDuicXX84YXSioDp+opTTO+anVzbN/XhytqIa9RkgJF9Q8zQZfdCCUzUn09zLUKkdKmrebUZoc7DyQ6E31izdeEXSQeCtll4psYzjbfrgw1nvj0ZGiyITRh8FYMjHZqazCHhLQ5wrklDVjQMgTsFiqCuryiznYXblIOESePwRKANoQXfjlEVrdDIBPqwJ1BAZWXpC8R2aWoNPN2QNvx43IOcs/7CgYvZtIVwuqlIF17iEQ3pRk4bTqQ5kDsv76SaQ9bW2N2YdglrFFwkbTw7LEAGlz/Huj91qO1pjPnJVi3p2emsAIK1m1wDWfpt81Fgil1S0DC2cGYdrQ3IbzujR+qiilxt/3jvCoKlMRgqfKGkwB1f/jdj1j9uVutxlgIKXy/aVAuE+8JP4xGlRDXw==
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-8dac2.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d1a706-2169-4986-78e6-08d99c30cdb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2021 05:39:27.2682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB3721
Subject: [Buildroot] autoconf Makefile in sub-directory
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

I have been given a package that is built using autoconf tools. The
package builds fine under native compilation.=A0 The package however
produces the main Makefile under a linux subdirectory

CFLAGS=3D"$CFLAGS
-I/home/bassem/projects/morse_buildroot/output/host/arm-buildroot-linux-gnu=
eabihf/sysroot/usr/include/libnl3"
AC_CONFIG_FILES([linux/Makefile
])
;;

Adding an autoconf package in buildroot, buildroot can pass the
configure step, however Make target is failing:

PATH=3D"/home/bassem/projects/morse_buildroot/output/host/bin:/home/bassem/=
projects/morse_buildroot/output/host/sbin:/home/bassem/.local/bin:/usr/loca=
l/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/g=
ames:/snap/bin:/home/bassem/tools/riscv64-unknown-elf-gcc-8.2.0-2019.02.0-x=
86_64-linux-ubuntu14/bin:/home/bassem/tools/riscv-openocd-0.10.0-2018.12.0-=
x86_64-linux-ubuntu14/bin:/home/bassem/tools"
=A0/usr/bin/make -j9 -C
/home/bassem/projects/morse_buildroot/output/build/dpp-custom/linux -C
/home/bassem/projects/morse_buildroot/output/build/dpp-custom/
make[2]: *** No targets specified and no makefile found.=A0 Stop.

As you could see in the log, buildroot is sticking to the PKG_SRC_DIR
as the makefile source.

Trying to use LIBFOO_MAKE_OPTS (forcing -C xxxx) didn't work either.

Any clue how can I fix this?

Regards,
Bassem

Sent from Outlook
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
