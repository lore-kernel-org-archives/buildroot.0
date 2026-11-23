Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6719606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 17:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jG4rXhfz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kRay8efe
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68FBB80D35;
	Mon, 23 Nov 2026 17:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2TQndrCf-EM; Mon, 23 Nov 2026 17:17:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8760B80D05
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795454279;
	b=IwBWAMil/Jv1ypAue1n35XzDJDdi3pEY6Pr/UOiumCT7TkVr4+W3AbPOly6YID8BVqjX
	 +GkmmZRl1bPfgWzyxbJMq8GjNwZmr0dLH5jb6Bz8N2wj2kwLBskKrm6XMqyIeUvt1T/uY
	 am/fDZw4ipqaYmk0kgbZQr5DOUdLAu8zX2NRIYgriHUIaN3z6O6PfSxubZbPvw7Heko89
	 HIbO/Lb35Mrw/Ii9qd9pyx0Vp0vHQFumhx0g4Ih//gi3HKMDBPCkW8iXt70lTfDQ3YKPp
	 FNty/WJYvUHpxjRXFPnlmFZxC91+0BU8GujkqP7vRyahp5kkDZ1tD+7SuaRN9ZV2KbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795454279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=J1qf6vG67yQMfmFGoNf66fZCqEVhb09Vig3eEu2heFs=;
	b=oknY3LmNG5ftYFgyKgZWw/0ajR9k7lmzcZKeUm/dDzaTgTQaDvBSqtApwErWHVXFOXqa
	 3Hi7QjuNDjc/m1c5RCrt/nZuz4O2XkPUCEg7U+rq1e2bIZd3WFzklAIZhyK0bGBaV26Tk
	 ONVszKc/2yedYl1bLq1Csj3VIDpsybfW3Dqn3DVZuhDGZe1649InXr5XOQ7weUuAKO/N3
	 tWQ6s7Qav4BmmZtXUj4ZrNP9RCniUVCmESRUjPFIClDoLZKm64Fek6z0nK/Sid9pl0wTj
	 AxcICRwXapOtSBfjte1vykTKbxwj2RKFUQYL9fKhFqgXewIgsANN2Qfz+WLmxpJc2Ng==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kRay8efe;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795454279;
	bh=J1qf6vG67yQMfmFGoNf66fZCqEVhb09Vig3eEu2heFs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jG4rXhfzPTb1zzSmv1NKG5iXCcVPzKk5CdDsEmZOhJ6+cO4H1nyjJ8AZabXamq6Gx
	 1R+uC9UmcgUKBlHDM2/Uji0eI4F8kdxrEN0TvIcvrQD6W4AmxxqzOLiqdFJRO/KpZW
	 MJINENXiL67v+85CpwfwQnvtYdyN09oO0/qIvq4VQhhsyGikgURWcuvSj0xObJT8h2
	 wp96X3H/YfxiFy90VpVgPL+nJ6PqIRPVKfuGGiFao9ZH5gW4ZGaa9IgHNbFjtnjgRe
	 la60af5PVVQNZxyDsUsIYnNNEdA44sN+0buM4cXkOSlO+DJAyX1Sw01vEpNVjW9Cmc
	 /V/olRiAvh+5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8760B80D05;
	Mon, 23 Nov 2026 17:17:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A6A015D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5AE880D0B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8vO31Rtd2fj for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 17:17:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9587E80CF1
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=kRay8efe
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9587E80CF1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:17:56 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4a357b1c649so2117553f8f.3
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795454274; x=1796059074; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G8EZSexIP5Tw9YMJoxivJGLGgZaoOn1o76Zindbbzmk=;
 b=kRay8efeIVFsyfq4Jh0BpePnoPxhuftBmAC/Tj7P1kHKNQ5GUJYQGYYDwiEemFR0zu
 qc5osM4bXRTgWoQ7ehFSQRasF6Z/VBOHobuH1Rivdkc0vRqRo4NVhbKDxmw8OZiXmh/S
 fW1fgX85HVqPOW6vovhyCu3cfOMMjmTET0SJAXX7izEPXoZqxb/LWXy1PSpzUBRaHHWy
 GB+zYvEWwLA2QSs2ul4s7TAXOq9uMMFG/oOtytxHmCt7VPpABpkVy8oG8VvByTHoDETl
 pK4bSNU+X6EoA0hYar9spJduWUc4JZEMKZoW6RBsbKUICJPc5vBjNHs4ToWXLD9v43da
 ylkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795454274; x=1796059074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=G8EZSexIP5Tw9YMJoxivJGLGgZaoOn1o76Zindbbzmk=;
 b=kwl5QChzNYAPPus9LuMiQWJHHNeDgZah91UZXsn0ZGXZeT23M76HvQrTyWsTErsgmY
 n3H7ci7SHGON1cXo6x6OIwEOETJ1+rXbeWG/98LSfdWqkQg6zcuFrDwjPEzpNAjU5/UO
 +/+r0lcrw7ehibC5rQ8xkAcNAhaovW7h5u5KXK5YOIrLbJQrmD/LDFUiVL0OkSv4CaGz
 dZuyax4mVfVw+JA8CTs97iqt0FAfnUahzWrffOHYG12dHL5yT26CtFGlLVJ1ms1TO8zC
 nhKNFKaKQc29mIP5eEbLdmkyhbkkMUemoeZWLWeE5pvTxff3k/CH4OVmK86zxscy22yC
 +n1A==
X-Gm-Message-State: APuU4Z8Pc9gS/i/JhNXw3kaKrWZPjh/EkqxxNuINdPIdfdT5qRjCHJkQ
 +k89Fy9/VlT/DuA+Fb8pe3G7aoqQTDm+sTmRz4ZVTzi4sB2HdgCsvYIa3Vd7yod5
X-Gm-Gg: AZFdTZe+AeMC7epfYJB2y2sfvlTkrg7EUO76aneS8d+25p5zFPuRfQicPzDK4Ou+Tl+
 xdHsghplk+TjiY5gF7dHLqg9getTdEywJ/PUVUnMMotV9s8PZGF7zbUsUeHCWhger7NCuKszdg1
 lJfglhdtGqRNnPoQm0iAnSBZanrkU5JN4N4ljvSI/hwfNk+3X5WKKCdLz75fvBr4HxRDo403Daq
 nMGys7OeSiuKQasl9gsns2dtvqHkBQoVuJ4XJ/0Zn/fDZVYefzzgof6vyUwtO84UwXp7HZJ4Asm
 +Gn3NBtHmfUttyz3iojgMlJPLYrYjBxAw54SH4kjGsc8c8SIYMdsbkQSIeAKC3HIDgKNcFEiNy5
 ClFFbmUp5HQdCOb2DULG2lPL8ips18det6VsBbe4KFCMa/bYlKR8aVXOEd48HNvt0dF3yyxscOM
 mDheua8LPRJEkJf0MELuPpP2mJfimQWi02Yb36rDsxpdEib7zxk+Rn4SJRM5GGMYXT4ADdrsGnF
 sW+4fAoucwLYoThulO/FlLGOTjX3+VbR6o1nWkyaveZIoR+v6Tk0eJWSGomdzrhZfdv3gHENNH5
 lb3rZlkVJ070N/bqHYvgVlvaxdum5AlWWAeFEr9bL/cFPZ1PCVc=
X-Received: by 2002:a5d:5f93:0:b0:48d:fd4b:cdd6 with SMTP id
 ffacd0b85a97d-4abb0a70fabmr22610757f8f.25.1795454274152; 
 Mon, 23 Nov 2026 09:17:54 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bc8ce06sm22827412f8f.47.2026.11.23.09.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 09:17:53 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 18:17:51 +0100
Message-ID: <20261123171751.2226383-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20240228145013.411919-3-christian@klarinett.li>
References: <20240228145013.411919-3-christian@klarinett.li>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/googlefontdirectory: allow
 generating static fonts
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Hitz <christian@klarinett.li>,
 James Hilliard <james.hilliard1@gmail.com>, Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Hitz <christian.hitz@bbv.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Christian,

On 28/02/24 15:50, Christian Hitz wrote:
> Google's fontdirecty started to include variable fonts. Some components
> (notably Qt) do not (yet) support these variable fonts. In order to still
> use these fonts they can be converted to static fonts at build time.

I think this series can be dropped.

The series is meant for Qt5, which can't use variable fonts. Qt5 has
reached its end of life, and only KDE still maintains it, seldom. It
will probably be removed from Buildroot sooner or later.

Qt6 supports variable fonts. In qtbase 6.12:

- the fontconfig font database registers the named instances of a
  variable font (Regular, Bold...) as normal styles
  (src/gui/text/unix/qfontconfigdatabase.cpp);
- the FreeType font engine selects the named instance, and
  QFont::setVariableAxis() sets any axis value
  (src/gui/text/freetype/qfontengine_ft.cpp).

So with Qt6, a variable font like Roboto[wdth,wght].ttf works as it is.

If another program needs static fonts, a new patch could add the
conversion for that use case. Some notes for it, from a test with
fonttools 4.68.0 and fonts of the current googlefontdirectory version:

1. The output name only depends on the font directory, so the upright
   and italic files of a family (Roboto[wdth,wght].ttf and
   Roboto-Italic[wdth,wght].ttf) overwrite each other.
2. varLib.mutator fails on static fonts, like the default ufl/ubuntu:
   "Missing required table fvar". Only the <name>[<axes>].ttf files are
   variable.
3. varLib.instancer with --static and --update-name-table makes the
   static fonts and writes their names from the STAT table, with no
   need to edit the ttx dump.
4. As Thomas said, host-python-fonttools doesn't need a Config.in.host
   entry. Patch 2/3 never reached patchwork.

host-python-fonttools is also added by a later patch, for
python-fpdf2:
https://patchwork.buildroot.org/project/buildroot/patch/20260504151620.1877-1-frcomdev@gmail.com/

Not Applicable: https://patchwork.buildroot.org/project/buildroot/patch/20240228145013.411919-3-christian@klarinett.li/
Superseded: https://patchwork.buildroot.org/project/buildroot/patch/20240228145013.411919-1-christian@klarinett.li/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
