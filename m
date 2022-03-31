Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22913C433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 06:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB9C541DBC;
	Thu, 31 Mar 2022 06:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJOKeSSUXqZE; Thu, 31 Mar 2022 06:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A7641D3D;
	Thu, 31 Mar 2022 06:21:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 124F41BF321
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3EC060ACB
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DoyYPqLx3-hl for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 06:21:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 787BC60A81
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 06:21:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 207D31C0003;
 Thu, 31 Mar 2022 06:21:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZoBc-000Y7q-E7; Thu, 31 Mar 2022 08:21:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220320162012.1527261-1-fontaine.fabrice@gmail.com>
Date: Thu, 31 Mar 2022 08:21:36 +0200
In-Reply-To: <20220320162012.1527261-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 20 Mar 2022 17:20:12 +0100")
Message-ID: <877d8a7ibz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: hid and hog needs
 headers >= 3.18
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Marcin Bis <marcin@bis.org.pl>,
 Samuel Martin <s.martin49@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Mario Lang <mlang@blind.guru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with hid and hog raised since their
 > addition in commit fb9fc969d91f69851b4c70dba512b607e52bda7b and
 > https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9b58288693680b021e5dcbc6f8bea80b5be89311
 > https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=646db71713b05d50b2b0c421da34e80ed4c54fbd
 > because UHID_GET_REPORT is only available since kernel 3.18 and
 > https://github.com/torvalds/linux/commit/fa71f32b5de2be1644ee671ddbe211d79be7847f:

 > profiles/input/device.c: In function 'uhid_send_get_report_reply':
 > profiles/input/device.c:222:24: error: 'union <anonymous>' has no member named 'get_report_reply'
 >   if (size > sizeof(ev.u.get_report_reply.data))
 >                         ^
 > profiles/input/device.c:223:21: error: 'union <anonymous>' has no member named 'get_report_reply'
 >    size = sizeof(ev.u.get_report_reply.data);
 >                      ^
 > profiles/input/device.c:231:12: error: 'UHID_GET_REPORT_REPLY' undeclared (first use in this function)
 >   ev.type = UHID_GET_REPORT_REPLY;
 >             ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1db406eac7620e3f76d997414eb7af7d2ac6cfe6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
