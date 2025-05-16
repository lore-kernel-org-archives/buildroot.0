Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AEFC54754
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41CED613AF;
	Fri, 16 May 2025 17:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NnZBsrYWa-Q; Fri, 16 May 2025 17:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64D03613A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64D03613A2;
	Fri, 16 May 2025 17:59:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A2A413D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0CE841779
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zt48BNmYX4kE for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B950C41786
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B950C41786
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B950C41786
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 860DF1C0FCB; Fri, 16 May 2025 19:59:36 +0200 (CEST)
Message-ID: <65e477f4-54a5-4d5d-ab48-600a1913af73@rnout.be>
Date: Fri, 16 May 2025 18:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Seiderer <ps.report@gmx.net>
References: <20250415-libcamera-qcam-v2-0-84301a46a144@cherry.de>
 <20250415-libcamera-qcam-v2-1-84301a46a144@cherry.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250415-libcamera-qcam-v2-1-84301a46a144@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Xa+MvxbVPDTa8eZNC0/l5xh8w9JWusiV3wxyijxjCuw=;
 b=BFZwiyAhhCTp8X6vYlmL3BfwRikDtRnYGmheAyAmnoa7BGlOGnHun00cQDMIqJC1OcNWtE
 VZp8C83GReiUi1JJerTemEzwOUSFwIi30mHN2/eySH5V6RseZ8hNZlV+iE9Ul8VDxICIC2
 wImy1BQBJ6oIgX5XYGDpKE0TfLsstvF4nKRD4N+9OR4O0EM56Qwd11sLzQMQYv8c0hAu5u
 k4q0q4tfTqyljSwo7z/HNR0fN2BZHjwfcQ9dqbotXF0Gyez2OFS966Ypj3/x7nTGNLpL+K
 KJrNolgAMfgxqpZQ1CHHnr8aA3KOnN6TyJbNz1oAxg5/Gvkop7i38dbnA4WS1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=BFZwiyAh
Subject: Re: [Buildroot] [PATCH v2 1/2] Makefile: add libexec to BR_PATH
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Quentin,

On 15/04/2025 11:57, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Meson qt6 module is looking for uic, moc and other host tools that are
> now installed in /libexec since Qt 6.1.[1]
> 
> Since the libexec directory can contain executables,

  libexec is meant for executables that are called from other places and that a 
user should never call directly. Sometimes, they have the same name as a related 
executable in bin or sbin.

> it seemingly makes
> sense to add that path to the BR_PATH environment variable

  So no, it does not make sense to do that.

> so that Qt6
> applications built with meson can find uic, moc, rcc, etc...

  I don't understand why Qt did this... It implies that these tools are no 
longer meant to be called directly, but only through qmake? There is 
documentation for calling moc from the Makefile[1], but that won't work if they 
install in libexec...


> in the
> Buildroot host tools.
> 
> Another attempt[2] was made to make Meson look into the Buildroot host
> directory but maybe it does make more sense to have libexec part of
> BR_PATH anyway. Both solutions to the issue aren't exclusive though.
> 
> [1] https://github.com/mesonbuild/meson/issues/9791

  It seems it has been fixed in meson now [2][3] so I think we should take those 
patches (or update meson to 1.8.0) instead.

> [2] https://github.com/mesonbuild/meson/pull/14381

  There's an interesting comment there [4] which says that we call meson 
incorrectly. That's useful to investigate as well.


  Regards,
  Arnout

[1] https://doc.qt.io/qt-6/moc.html#writing-make-rules-for-invoking-moc
[2] https://github.com/mesonbuild/meson/pull/9988
[3] https://github.com/mesonbuild/meson/pull/10259
[4] https://github.com/mesonbuild/meson/pull/14381#discussion_r2033625986


> 
> Suggested-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 5bf5abfe3badbd460392582425bbb49ab1a4e7b1..8787a9065fcaae126ed46c434f7ed7988d99bb16 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -468,7 +468,7 @@ $(STAGING_DIR_SYMLINK): | $(BASE_DIR)
>   	ln -snf $(STAGING_DIR) $(STAGING_DIR_SYMLINK)
>   
>   # Quotes are needed for spaces and all in the original PATH content.
> -BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
> +BR_PATH = "$(HOST_DIR)/libexec:$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
>   
>   # Location of a file giving a big fat warning that output/target
>   # should not be used as the root filesystem.
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
