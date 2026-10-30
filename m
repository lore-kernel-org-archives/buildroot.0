Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F9C606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y3vVdNsX
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3427B81422;
	Fri, 30 Oct 2026 15:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kG7JlWOpWCnx; Fri, 30 Oct 2026 15:27:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6901E812C1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374036;
	b=CFv/SAUSMgZ8HN1HbmHNCMsRAHwz5gtbGIN55sVPBhhguervVnvcB1APLk+9Go9dVVzM
	 UV2Ecj/RVOo3oqBkMlb7b2l/NWvkuJZDdk6pG6K85TRDRE6/xwivKdA+870MKOOsrLogM
	 J/xhyQlzhF7VqhaLpcCTGfwD1BWq+QrwoSWZ9YX0sC5ydkBJ5/3aC+UBQ58SngQ2UZ/Ga
	 Krkm4Ob/tay3KTvIFqrbBHTiwUXm05Ra8bqPxuXK9guR5khg/+0fr9cMOsivJ1syNEphr
	 wgbXk/gq/KJswJNOPGXM9ZBCmZYVt3UF4HefpzzSbGJwRMcBfoRhlU9KqxbvY3PFhYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374036;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2sx3sow26V/4pmMO5GJ58f9rsmNk8g1QNhNAqKyyrsU=;
	b=q6b/Oso4nBld1k2NelyI7JXil0IgsJLj3VoYt4VuiknOUjqxEhwc4fKQounDhG/yfDHO
	 4UuQEMWOJXDt4L7Fr2yDsolH+5PdKGMZ1uOcSiGNwWdZ1xR6toV0Iet6mWjhwTprzFrHJ
	 wU8IhLtT9tkC69Tt0fmN8SQomMLzXgtIeh/8700gUzWAjgtskeyNm2ub/ORLTMI/Z5+TA
	 H8hywTnIOGCJCf5KW8xk6mQoy+ile1atl96DLgEs3it44aFlwzR5r40PRwpcRZ0N25dcu
	 zTVCV64D20UyTP9AkqYNjLr82Gute3YsS3oKxbd+J2kQtuqOLgX5kQVCTrsrQvJwtAQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374036;
	bh=2sx3sow26V/4pmMO5GJ58f9rsmNk8g1QNhNAqKyyrsU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y3vVdNsXk5iOozNUf+M8GaWx4fulA0Dgiv0Bu0LQhvUCEMweUpaulg8PwVMDgNyFp
	 wSPLjj+UCDRO5stlPB3VbqV5GcUNuVwt+3G7UGDrAlov57tRXq+ow1XHBNEUErpIQ1
	 uCFKxfwPs3WTvHoUItKX3QSTqBocr1CnGOQDYoxXM1I1sMe4fAYsGdvMBUqcCSMNnx
	 pv6sK7F7GfAxOxnahWYn6zKHp5AuXEd7kABEjvOuZAtn4B8BhBE78hz9TYxjmMqQz0
	 kWA/lYxICgwFrGRcsvndPpgmywPoFHQqjRjyZHBsnte8xJGzJ8zlkiealD9Cbu4gCo
	 FRjPP4jRAWWxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6901E812C1;
	Fri, 30 Oct 2026 15:27:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C432BD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A904540530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeOOpuPIdT4R for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B3FFB40211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374006;
 b=a/PP3znJSggCyWCqx6H557qQ6JlSQ5lQJfmdW8vPuvRtEIjjh7fjcP5ck8O17c+XNMcA
 DewvNzhZic80+LuBqcQD5Uq0oCH7JmMGsczIdfgcIXLir1uG+yseY72n8+333a3yUfUDt
 RwIIQ3OY1PgG5a2t5F15mFop58w/aaYlOlkIKYjj+Aj/xM5n++7p79CpjKiFH5vbY54GO
 oNff0F0e/9evWJF9kQsKdydVijy+BptPIcGN3iZKUA6wzr3A4Ui53w14xav4+14CxbBXo
 GLuA/kcfEx0AikEJiExYfoW0lAogOPdPqzh/UIvL40xjk3hWPkz9rnFOy3E1itqZxRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374006;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3Xlwwg0dhURRjAMok5woAmYEL55oBSMgbd4UjYQ1yVY=;
 b=S0HxnHSZHyGsuEJv8qFPlNUj1PdxlVuNVDS+9KDB91zJ7KfPb5H4Wjdz8X/7CQGslDj0
 SIr36iy5ootUPiu4MrSEig9iuHrC53OBkAEVSp91d0nx/wsZ/4Gfmy6pr/s+w7yPqr3Lm
 vGkIc2z+sa2ic9wCASWgb/NNOJNqHlGL92Q+SPOT8dcxSsf0zxQwXwXOrmo2mbkXh6Ab3
 kdnF2MS/SHay6Ua7fpJjSSk72VNNyKFwS1C9VdUR22IdZxwmS4njAA17ksxWPSPDW4OX+
 HYz4uCg+IyJ1Vuymsi2zFaAPM8c9+zVm3pF5DUKvp+ZUKUvfJL3YpHyOw2R27WAQNMg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CaSmP8+0; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3FFB40211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so5072215e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374003; x=1793978803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3Xlwwg0dhURRjAMok5woAmYEL55oBSMgbd4UjYQ1yVY=;
 b=pFjIYXLQ9t6i4SNoeMpaOjW6n5Itww6mk8M8gOdUKJaLG+6N5RGj/Lvzov+bJhGnMZ
 wf8DHPV2Ks81cXr7KJj/vYIuiWF0c/1XqtFgDUy0qAT7Pbc3I1Dln7evAjZHdAw7l8zl
 80+PbvrTpfms9mfrtZTDGnlLslUhfHXM40HXLN/0CXKMRtB9z9R/e3x4tQgS1gr8Eu7q
 PBtRPlEiyJUDmuuTK1ACVBxUVjSwU3h3tvob1tSA/1ehGzuFN+1R5Gja+X0lrAhGs3cw
 A43rnjk9lCDg/GhbKSk46qvfOKnGv1stCYcH9mI04SEQKNpCzSMYseG1OIqgG+SvoQIY
 Dc8Q==
X-Gm-Message-State: AFq9FYJu9mAoeGobKpa9BAdct4EoYeBFENVK3QTdCMzDtDBM28HQkMrw
 6F7eOyV8JtyUuGEa6W/+xvhRilgLGK8RSEhhpQ84uvV//u+8BHpoayWuc1PTWKCPz+qr9e4AZdJ
 Hx5RusH4=
X-Gm-Gg: AYBFou1T9iqcaOtXKN9lF3+0DqE0zFdvQgtnuGLJiuMa8+Ro8JbhI0fAENKk8OcW+Qt
 Hk988K9A7sLWEjvdTKP5d8l8r3w17eBxiXnWALsTtqtkWoCjbYxfXdIO+IH8QGUK6O2N+eAxqZr
 pNNJdDdvbZbRzjBkBtxKGPgDvV2ZogY07mzIu2a3vVtEIQ1v0klhMXZYtK0tTD555bBN3o7AjE8
 3j7xNS376CxDb709A8BIBpJP8ioLHED5HOKg3PQJhonAW2hdRvjvpAIFkQXDYZshJsnIQ0KeW+0
 lRvDaaaAYhQDeLEjtWJJZIiPOEXC1u8VYHgbAGisfO6nVystEpUPocCMEuyFMq+FkuSpLcO8Isn
 mbCrHm17iQBCMpQ+k+Fz9OQeHfxWBmJmC1CflmkFvGMBGG7Gw/jGxJS1NTfXWVyYfWBNfU1nHQ3
 pEq+zjFFanjMiKV4a3bfSfpoHZsgBXn/jGe9AFLY56SCMIhL4TSXsuZeq7ZUGnEPS0w5QjEFABw
 uJv2xTtuAAqg1AWdQez24ETVgdAXt/lLScS0fWpaBavM2nZhMsqSAuKdYu5UymrXlrSa89spJxB
 /SWPyl0786Tam6Up4uotngGuW9vL6zw1P6j3r9yunVwlgNq15VTgo8qlBSWCDXTtSOGG5Q8B
X-Received: by 2002:a05:600c:4e50:b0:4a1:7d9b:d4ae with SMTP id
 5b1f17b1804b1-4ac16fa3523mr58297545e9.5.1793374003424; 
 Fri, 30 Oct 2026 08:26:43 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7f322c46sm138194605e9.2.2026.10.30.08.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:43 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:40 +0100
Message-ID: <20261030152642.1906337-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018232916.3896517-1-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix build without
 FIT support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Commit d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1 ("package/uboot-tools:
> fix target FIT signature support") changed how options for FIT support
> are written to include/generated/autoconf.h, removing the
> unconditional "echo" call (possibly with empty arguments) that existed
> before. Because of this, include/generated/autoconf.h was not created
> when U-Boot was built without FIT support, making the build fail
> because of the missing header. Add a "touch" to ensure the file is
> always created.
> 
> Fixes: d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1 ("package/uboot-tools: fix target FIT signature support")
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2026.08.x. Thanks

> ---
>  package/uboot-tools/uboot-tools.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index 32fe9f1d7b..87b708ac5c 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -31,6 +31,7 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
>  	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
>  	touch $(@D)/include/config/auto.conf
>  	mkdir -p $(@D)/include/generated
> +	touch $(@D)/include/generated/autoconf.h
>  	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
>  	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
>  	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
