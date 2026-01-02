Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB04FA3752
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEEC560BB3;
	Fri,  2 Jan 2026 15:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pwmg1AN-I3iY; Fri,  2 Jan 2026 15:57:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4B96608EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767369433;
	bh=LtLYp1ojuLLEbRKjxQ1q27E2OIfcASKjd/klVrVcrjw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F+oGK3oIKs6IRHxHK2Ftgeps8cGBUYk+uhvkaU+lyYuhHRKTp8N6w2wTtH3tCKRq5
	 H8ASo+TwoTp9dUswmYE0xel3swcg4F0u09Mg5s8OSbgtFbq7st9v4dcyE2Gzt9iSIy
	 ocV/hzGfupnNdFG9Ym46NZXN/5dNQgO+OfRS3cnpCFhrOEYfxMMwN6UicB66nWZ9cN
	 6ezAsyCIUZ1qgeiA5mgAdbwsXAzZUhE1QD7cBPvvuCM2yieg9h2LofT7CIFYNsy2dv
	 Zr6MzFlFKz/0FvphonUZPYiLyeWYEJ/ndx+j0BQWSwyGMLJbvlI/bAI0tgE2pniQNn
	 JZEO1d6WVzhZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B96608EF;
	Fri,  2 Jan 2026 15:57:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81542D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 680A74069A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQXU1iwEmuHt for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:57:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 92BB640697
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92BB640697
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92BB640697
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:57:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so78588615e9.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 07:57:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767369428; x=1767974228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sC6n2EPPd2pBN3nqqQykUX2/eXquMw7P02/q35DzPR8=;
 b=kAjO5jx5KKOH6f7gDf1ZYlY4RPfrJS0zQ4O3DO/bVWjzb+XDnq2Ho2ZjpwC+mqBj9C
 Doa1Idcg4tov5U0iRXzGNjesr5iDBd2NlwMzBPzmebMumcdIwyqxibTAFPOFH308u5Gl
 O0VkNuCS+pAPQQx0fuiKWza9YKHZ6etCbUawVpq93gWRLNUjItbPQWnhtBkeSEsItwit
 eO9quf8slutxZItlrx24ue2WUmXc+uuEKjKp5CHbniDfZuCD9bXBKN2lL90JL5dlcxJT
 T9FbC/FW6GWKj3FYejpsjRnXogH+wBIrycFO0h9kNOdWkVTkaWAg3hx1qohY8qju5fNS
 p5NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9UDLhEqE438uw19WjtNVEkQfK2Y1cT6LBeh2CpS8uucfnFlqEqRmHwDmo3nA+uNZSKNoJv//ku00=@buildroot.org
X-Gm-Message-State: AOJu0Yw/sHrOngMk8GxdgMPDHY2YnVF8Q6v/zh3hVP8E0XrRIQOmVrhl
 AGPf4BhM34l+7SLCumYDooeST0NR8nvc9dHgwRjoHpjm9KDnHxCMBTmtyVbkMJkTbunNyGlMFdi
 nHEor1UI=
X-Gm-Gg: AY/fxX7wwYbcLisAlIMAt7VvRuPeDiACZ4lHQVYDM+rCo8TT9lf811OOO0eyasphhzd
 P4a/70WF0bezCuSXTYeMtKUf/ufmLtod+GTq03AjsWpjEsQvkfNdIJkqPZvQvntHbweYD8fXzwZ
 pSr0DS5n4zB9Xb2mRHtEzEpKX92NMzfZHnoKk+JgoMWFshaZqFZ3pQKpqXKMRP0zdUBlZUfzSrv
 BGkf976SvNe56mUfq2iODFuasomE9BHMDWTZkg5v88+jqOZBdHGC+FJRkZfoWGoDDWsf6r1Lce5
 ii84SAiqI2c6wzyxOOUfRNMWPg6dfgj4hbsm+QFVNw55aM6MbaFFjmc+nxiy+eupN8eflmKffzu
 k9Iki+oaYwYm84T9vXRgHgHIPyEhf9DlJWR+cajP6pscNoLtec69fwsjEhPF6CVnXcld7bwiP9O
 //tLgu8FqdeiGmOjBIWou7hQF4K+fBadyySME=
X-Google-Smtp-Source: AGHT+IEKd6SlHEI8Lf1573FIvTUH9Q6L9q4tuxudqZYQHafQ4DnV1KOxhYhKuI83ISLaDVrebYnPDg==
X-Received: by 2002:a05:600c:4e8f:b0:477:df7:b020 with SMTP id
 5b1f17b1804b1-47d1957da79mr459918575e9.18.1767369428540; 
 Fri, 02 Jan 2026 07:57:08 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be274e407sm787898495e9.8.2026.01.02.07.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 07:57:08 -0800 (PST)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  2 Jan 2026 16:57:08 +0100
Message-ID: <20260102155708.709573-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102150757.1480511-4-fabien.lehoussel@smile.fr>
References: <20260102150757.1480511-4-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767369428; x=1767974228; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sC6n2EPPd2pBN3nqqQykUX2/eXquMw7P02/q35DzPR8=;
 b=WrNv/MCdLEElcwzprn/QOyRUqUciKhGqYl6E2pwi7sHZIaNrgC0ZtXyv6tWObwJbcH
 X/YeqEr1rSSuWP97P8ywnZ1kLVMlAk07fCgS+Capa/GJdXQhWQ+BXcTfTZory224MSC9
 Ln1QqkIHmUnczTPPgLhUFUq4X76z8rd3nH6+2J9Iv2QrkhqMj10gyWwshG7GcvU5FEVj
 ulHossyRJR3kPTHyGXoLsgQlB5QwOHfkkaPhdCGk6YepAFLJOJzI0Fsd5gB6OMdUrBSI
 wgEu2KaJLdsdmI4BeLkCxJ6gMIaXQDeDkH9mwLvCAnPYW4zejvAHj0R1ZJmw2kc2EGra
 ds+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WrNv/MCd
Subject: Re: [Buildroot] [PATCH 4/5] utils/generate-cyclonedx: remove unused
 Buildroot dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot is a build tool, not a component or package that should be included in the generated SBOM
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

> ---
>  utils/generate-cyclonedx | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 23176bc2c2..e47b6f2f6e 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -467,7 +467,6 @@ def main():
>              cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
>          ],
>          "dependencies": [
> -            cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),

This is needed if you use tools such as DependencyTrack to use the 'Dependency
Graph' feature so I don't think we should remove it.

But while reviewing this change I saw that there is indeed an error in this
line the dependencies should not be for 'buildroot' but for `args.project_name`
instead.

Does this line cause any issues in your usage for SBOMs ?

>              *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, filtered_show_info_dict))
>                for ref in filtered_show_info_dict],
>          ],
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
