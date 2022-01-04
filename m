Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC006C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 16:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3036860BC4;
	Tue,  4 Jan 2022 16:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RBfgALy-7kmG; Tue,  4 Jan 2022 16:46:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA2A60B74;
	Tue,  4 Jan 2022 16:46:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B84F81BF5EA
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A82F940936
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYLqkeS5-OCB for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 16:46:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B9A44091B
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 16:46:39 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id q14so143007191edi.3
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 08:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tlt13GdHDtD28G4SQtPN2bcIwS2alvE8qXsTEgSwrSU=;
 b=AHE9hqhthnRAItvxugiI+Pcag3MM2G7mN400NFRQPEqYBuB0p0jYDNkmnP5cayzawS
 QZatAiYwncv3d8QL8op1VlM30YTvcVmAeH5BsIzwHZsCDlFy27meHvIRvrnDNTyoVV1H
 zM4AITSd5AyCnZIbhHG3Cgu2wIdAxJMkeEGey1fagMWFYDJFtA7PAxnGsTUteXS/9Dgy
 qcHELYA0LCE8UU8Ac5z+m9Em0zV8P8bSMloHJ995NBZB1sLKbY+WTNoiL3PZrGgB9LpL
 oilRWZFcGZ7MrBxQCO2NTU5QvSmNrb1KdNNpkWvKcipIVmG2O90kcLQryV4Ir6m2LBho
 niqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tlt13GdHDtD28G4SQtPN2bcIwS2alvE8qXsTEgSwrSU=;
 b=gghrOF/4rHR0/k+GBCvpr5nl3Ie9w2y2Cx5/Ce7bxagl1E28QCloJyBAiP8I/lSyz7
 wLlWNaqFpK+K5+AJnoE9pK01AAcku2Ki+kX/WBcVOy0oxHILvO7tOQkIGAB7HPFD/Yaq
 1Ugo6oVj5kJ2zdJgqzqC9h6kU8DEzRY6fsBW/c2QenJxwvfBChTiL/9KcvoKFDwqEWJv
 M9c36CUfznCbOlMq3VpkQ9jacTAExIrTzijMI62QpQ+w82crmYwQW36keux9ItgcjEaz
 Xg5fBcY0yfojBUC8ODpfNu25CU1QaX/N8d2F3ubSbrLT4c6A+CWgHc6sYPtt2ikRQL17
 ClGg==
X-Gm-Message-State: AOAM532pbUWCQ1uQXbnIDYM0KC09A9Nj8+3AduaKJFbdOkGQuICMHKAD
 M89jQS+Gf0lZVQeUCOjXZHM7Iw==
X-Google-Smtp-Source: ABdhPJwYNUt74nA2JVklGEVTHpmhvlVrrebGR3Vki+xsL70UsaVHwkYVuSKUTnwDLyhvCXLmzBFckw==
X-Received: by 2002:a17:907:3d94:: with SMTP id
 he20mr38704806ejc.14.1641314797561; 
 Tue, 04 Jan 2022 08:46:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p7sm14852336edu.84.2022.01.04.08.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 08:46:37 -0800 (PST)
Message-ID: <f9071be2-2f67-a942-149b-5193c94afbda@mind.be>
Date: Tue, 4 Jan 2022 17:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101144840.1387059-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101144840.1387059-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libapparmor: fix build with
 python 3.10
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 15:48, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of python3 to version
> 3.10.1 in commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc:
> 
> configure: error: cannot import Python module "distutils".
> Please check your Python installation. The error was:
> <string>:1: DeprecationWarning: The distutils package is deprecated and slated for removal in Python 3.12. Use setuptools or check PEP 632 for potential alternatives
> 
> Fixes:
>   - http://autobuild.buildroot.org/results//f3e400cbb5b00fbd7f0cb421c993e46b64ec5ac5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...deprecated-distutils-with-setuptools.patch | 244 ++++++++++++++++++
>   package/libapparmor/libapparmor.mk            |   2 +-
>   2 files changed, 245 insertions(+), 1 deletion(-)
>   create mode 100644 package/libapparmor/0001-replace-deprecated-distutils-with-setuptools.patch
> 
> diff --git a/package/libapparmor/0001-replace-deprecated-distutils-with-setuptools.patch b/package/libapparmor/0001-replace-deprecated-distutils-with-setuptools.patch
> new file mode 100644
> index 0000000000..5aed31d0b5
> --- /dev/null
> +++ b/package/libapparmor/0001-replace-deprecated-distutils-with-setuptools.patch
> @@ -0,0 +1,244 @@
> +From 21e5a721ab2abe26bb12b9da7accc39d4fff9804 Mon Sep 17 00:00:00 2001
> +From: Georgia Garcia <georgia.garcia@canonical.com>
> +Date: Wed, 10 Nov 2021 19:50:35 +0000
> +Subject: [PATCH] replace deprecated distutils with setuptools
> +
> +Adds python3 setuptools as a build dependency for libapparmor
> +
> +Fixes: https://gitlab.com/apparmor/apparmor/-/issues/202
> +MR: https://gitlab.com/apparmor/apparmor/-/merge_requests/813
> +Signed-off-by: Georgia Garcia <georgia.garcia@canonical.com>
> +Acked-by: Christian Boltz <apparmor@cboltz.de>
> +
> +[Retrieved (and updated to remove changes on .gitlab-ci.yml and
> +README.md) from:
> +https://gitlab.com/apparmor/apparmor/-/commit/21e5a721ab2abe26bb12b9da7accc39d4fff9804]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + .gitignore                                    |  3 ++
> + .gitlab-ci.yml                                |  2 +-
> + libraries/libapparmor/m4/ac_python_devel.m4   | 36 +++++++++----------

  Sounds like this requires AUTORECONF = YES

  ... which was already set because it wasn't removed when the version was 
bumped and the patches removed. So I updated the comment and the commit message, 
and applied to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
