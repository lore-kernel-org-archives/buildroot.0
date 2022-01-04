Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD99C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A7AD81D34;
	Tue,  4 Jan 2022 18:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIdFV5_MkTxd; Tue,  4 Jan 2022 18:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC2A2812C6;
	Tue,  4 Jan 2022 18:13:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2837D1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1455B40491
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kuq9yRxC8B_A for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:09:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B0A040272
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:09:34 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id u25so30326215edf.1
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4zJQkMNiwDXPGiKzVUh2tnU+f9zfNE0DyTaDe1byhEI=;
 b=QbT6eTNuPbwBXQ06UEq5qYGIYsgp48pK5xHtK5M7HXMXBK4hsfwd/ca/2MMl2H0UpB
 5QcN8v6mCSwr0nrfbuv43lGgJLlP7u3VynAbuKNDqUgfnhcfH5m/gN5ETgXLtmrbxaf5
 hAE2MMjKWR5KtX7rXpAizI2PZXC3Gqm+S4ssBbdpGp5vebCR2v5EPhefF8aAdSDXNBdJ
 a/rJ74YUunPxhciWmwFG0TfBZqsPTNP5IVeSITfTC5w5sr5BzM6Pwft9BkwjGH0v7f2G
 +hvfa0tRDB8z5HrcQsWPreZU0C9k0Q30B+a6LmoAgVewHAYuT66o7bP20oMRi0BXUfwD
 dORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4zJQkMNiwDXPGiKzVUh2tnU+f9zfNE0DyTaDe1byhEI=;
 b=HQNtofIfFIy1JHViX28uns/mJwNrSrQfPasxE7JzauuT0GWbj6rXizpsuJru8Eo3OT
 T1QFa8ZgjkQWad2aVNLLDIUqVZ7psQIPKGsGPDN/tToARJKhj/fHy/rWwVnQdfgHtbDC
 ZQ5so8v6+wZCMNo4Y5r+NdDD29GsK7jH3i1eHwL9p77/+G9XwHW/3Hr/Ka0QgXm/i4Ye
 aF/hrRv3dznx3GD2yjqO4bf5d1k6V+LgcX3j4YNi6hFbfgp39Fp7PhicZ24VFYWdZHRp
 ato0874K6qV6iZVN2uTELp5LFpuLOHS0QEq9jdLsFpre4BHn7N9EYE6cS3Xp/EfpQmf2
 e35Q==
X-Gm-Message-State: AOAM531HvU0h00RFaBnVJ4NqWeTjcwkUHymMo143tQoO0WiFy45ZPFnr
 +bKHqi8netDDlJKXCfx8MfvhDg==
X-Google-Smtp-Source: ABdhPJyQsRun5S3rNL5duBxpTpr/a1Gp5a2YescVV60Z6OddDF5QJhLedJb2PM2qArO0TN9684sWRg==
X-Received: by 2002:a05:6402:1778:: with SMTP id
 da24mr50535775edb.144.1641319772444; 
 Tue, 04 Jan 2022 10:09:32 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c8sm14822891edu.60.2022.01.04.10.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 10:09:32 -0800 (PST)
Message-ID: <8481639d-e8cd-89d2-dbf6-8d2ae54cabef@mind.be>
Date: Tue, 4 Jan 2022 19:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>,
 buildroot@buildroot.org
References: <20220103165451.2769-1-florent.aumaitre@medianesysteme.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220103165451.2769-1-florent.aumaitre@medianesysteme.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-pyqt5: Fix parallel
 build
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 =?UTF-8?Q?Manuel_V=c3=b6gele?= <develop@manuel-voegele.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/01/2022 17:54, Florent AUMAITRE wrote:
> This patch fix build of python-pyqt5 package when parallel build is used

  This explanation was a bit too terse. I tried to invent something that is more 
complete:

     pyqt5 uses qmake internally, but is python package rather than a qmake
     package. Therefore, we need to manually apply the same fixup as for
     qmake packages.

     Without this, top-level parallel build may fail because dependencies are
     looked for in the qt5 per-package staging directory instead of the
     python-pyqt5 one.

Hopefully that's more or less correct :-)

> 
> Signed-off-by: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
> 
> Changes v1 -> v2:
>    - Re-use the existing QT5_INSTALL_QT_CONF macro from package/qt5/qt5.mk  (suggested by Thomas Petazzoni)

  This should go below a --- line, i.e.:

---
Changes v1 -> v2:


  That way, it is not part of the git history.

  Applied to master with those things changed, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
> ---
>   package/python-pyqt5/python-pyqt5.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
> index 8f28c90d15..b05043563e 100644
> --- a/package/python-pyqt5/python-pyqt5.mk
> +++ b/package/python-pyqt5/python-pyqt5.mk
> @@ -152,6 +152,11 @@ define PYTHON_PYQT5_GENERATE_QTDETAIL
>   	)
>   endef
>   
> +# The file "qt.conf" can be used to override the hard-coded paths that are
> +# compiled into the Qt library. We need it to make "qmake" relocatable and
> +# tweak the per-package install pathes
> +PYTHON_PYQT5_PRE_CONFIGURE_HOOKS += QT5_QT_CONF_FIXUP
> +
>   PYTHON_PYQT5_CONF_OPTS = \
>   	--bindir $(TARGET_DIR)/usr/bin \
>   	--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
