Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F56C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC7F383E1D;
	Mon, 24 Jan 2022 17:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlnDwOS1Aem7; Mon, 24 Jan 2022 17:47:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D96883E18;
	Mon, 24 Jan 2022 17:47:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A14B1BF487
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72BE040923
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6wn912znl27V for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:47:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4651240919
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:47:03 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id BDD98440532;
 Mon, 24 Jan 2022 19:46:47 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1643046407;
 bh=A2RfvZ/ebwGsA9JleaOSKnHUhEoKKNxL79xRUupkMDg=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=SWRFFgSTH/iv20Vyik1M+9Ea9WxSDzDJ9j5zvMCErXFcJXTzZbTmZ/Fc5bPRsVIax
 l2Wlc8fcVwsVAmrCkyM/xGPKr6QEYQoUqyhgxKbBBQNAnH2Zji6/EbqU6Mjep0VkS/
 G/gqVGnqaDoSAhA9Wex3RqhvMlHegcX96FsJlqsl7agmaw0DLtOa0e+/clqAdf3R5I
 yV4rgiiM8/Qyu7wkoxfjSqqaryoGRKj200b2RTcNjHwbegGnTNBBaL7SqtMowIzDZC
 XQsOiJH2i0QTKu0+SnxIj0bs7E0Ei3P3dkDsBehXAKrZSHfkKPYgnvUFuSBZumR3/i
 kd0/npEyDEdiQ==
References: <20220124173521.2236-1-jborne@kalray.eu>
User-agent: mu4e 1.6.10; emacs 27.1
To: Jonathan Borne <jborne@kalray.eu>
Date: Mon, 24 Jan 2022 19:44:29 +0200
In-reply-to: <20220124173521.2236-1-jborne@kalray.eu>
Message-ID: <87k0ep9gbx.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH 0/1] Fix binutils/libiberty target
 install directory
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: jmaselbas@kalray.eu, buildroot@buildroot.org, ysionneaux@kalray.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jonathan,

On Mon, Jan 24 2022, Jonathan Borne via buildroot wrote:
> Hi,
> I stumbled upon a suspicious line in binutils.mk.
>
> In BINUTILS_INSTALL_TARGET_CMDS,
> libopcode and libbfd DESTDIR are both set to $(TARGET_DIR)
> and libiberty is the only one set to $(STAGING_DIR).
>
> Is there a reason behind this?

As I understand that's because libiberty is static only. Buildroot does
not copy static libraries to $(TARGET_DIR) because they are only used at
build time, but not at run-time.

baruch

> Sorry if this is an obvious question, I am quite new to buildroot.
> I assume I am probably missing something.
> I though it was still better to ask...
>
> Thanks
> Best regards.
> Jonathan.
>
>
> Jonathan Borne(1):
>   Fix binutils/libiberty target install directory.
>
>  package/binutils/binutils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
