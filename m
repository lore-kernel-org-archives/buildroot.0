Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23ECC54E60
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F7AE81235;
	Tue, 19 Mar 2024 12:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ej-CxKD-3hBz; Tue, 19 Mar 2024 12:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80D8781242
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80D8781242;
	Tue, 19 Mar 2024 12:09:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97C891BF406
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84BFB60AA8
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gj3t9mmiJ_xQ for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:09:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 25F67608EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25F67608EB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25F67608EB
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:09:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 288651BF20A;
 Tue, 19 Mar 2024 12:09:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmYHS-003RJI-1Z;
 Tue, 19 Mar 2024 13:09:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240214195858.1796266-1-fontaine.fabrice@gmail.com>
Date: Tue, 19 Mar 2024 13:09:22 +0100
In-Reply-To: <20240214195858.1796266-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 14 Feb 2024 20:58:58 +0100")
Message-ID: <87o7babez1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-vaapi: fix
 wayland build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > wayland-protocols is a mandatory dependency with wayland since
 > bump to version 1.22.0 in commit
 > 33d4c226e582f6c0086431c4d9154e462cb3cf34 and
 > https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/3c713cc16ee1d374213cb2b47a3127e14e5ff8a5:

 > Run-time dependency wayland-protocols found: NO (tried pkgconfig and cmake)

 > ../output-1/build/gst1-vaapi-1.22.0/meson.build:111:0: ERROR:
 > Dependency "wayland-protocols" not found, tried pkgconfig and cmake

 > Fixes: 33d4c226e582f6c0086431c4d9154e462cb3cf34
 >  - http://autobuild.buildroot.org/results/b5e79d4e10fdf24c3fd43ab742d9d14a5d07824b
 >  - http://autobuild.buildroot.org/results/ad624cd11d5a1b3346974000ae2b61f4261af02c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
