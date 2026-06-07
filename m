Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9695CD8C8C
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 04:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C88847DF;
	Sun,  7 Jun 2026 04:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63ctB7N2T7m9; Sun,  7 Jun 2026 04:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB560845A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780807305;
	bh=LjBTUZ6N+nW757ceXKgdsw4V877A/wQ0Z93puT5NV/0=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T1mIjrbpnhpjRLWSQ6/JHXQh07JRjjJ65dI23GSOiBoz8xU5FG/FK97e/4bm3zPIt
	 vt6g2AZ77US7Rc+X2fiRhSz9Pww5MM94VfC6Sn/IQD3F41Rr/Dgj+03dAGXj+Yh/v/
	 ZHvS8jI5LD7d2ltCjgihJRvjrx+LYg4Ydw9Z9kJD2rsWgGEHeM48pUFmOHuPjFHWe/
	 d9n/T3/+DxkVgJlwuW9kkXMGRgEksKYc+qbGWX8fmWxkyqMjxqQNdI+jOEzRDoHrGu
	 /RPkPpBLb4XmmXRoHuJTtculE/1UZN+tTxm8cfff/vLSGH6CP0lDTFLcabOhAaHMio
	 n13mCLD5UV7Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB560845A0;
	Sun,  7 Jun 2026 04:41:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AE912C1
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 04:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8131561319
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 04:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itB06B8FWFLF for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 04:41:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 26B6460F7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26B6460F7E
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26B6460F7E
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 04:41:41 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id F1641440887;
 Sun,  7 Jun 2026 07:40:36 +0300 (IDT)
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Quentin Schulz <foss+buildroot@0leil.net>,  Thomas Perale
 <thomas.perale@mind.be>
In-Reply-To: <20260605125009.272558-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Fri, 5 Jun 2026 14:50:08 +0200")
References: <20260324-qt5-5-15-18-2025-02-x-v1-5-9d25b343a6e3@cherry.de>
 <20260605125009.272558-1-thomas.perale@mind.be>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Sun, 07 Jun 2026 07:41:37 +0300
Message-ID: <87bjdn9d32.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1780807237;
 bh=eGUUzIJtk6r0t9W5ZLLeHxSCN7mK5Z1OGtJbek2ul3o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jyONy6s6tqApfNIPSr3AoiMITovGxVrBEIB50Qe3tfLjngfhpmO7khzuxBhF10YXn
 Ra+wnD52KMpsk7r7tED/s6UR5zEsX2j0VHJE3pm52yS8V6SKZXYPIpmKE7QDbNADsg
 7Ax1dWecVy46Nam+ab/LpZ9X1h136uCcU2WW1TFH5i92EA9ChRhs/eGIpQIpe7mAKk
 +HFgbyKedrr8DaEA7oZMo4Ly3M6n3JcaOXn6BgX9hwb9d97u1kWskAt90tYXN78SuU
 Dp6BNHhI8jxzYMqgdi/nEgpRDC2lLazwAQ7/j9d9Oyc7aAH24mXu1QguFg3HmubY8o
 xi4TCOe5QZscQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=jyONy6s6
Subject: Re: [Buildroot] [PATCH 2025.02.x 5/5] package/qt5: bump packages to
 latest 5.15 kde submodule version
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Fri, Jun 05 2026, Thomas Perale via buildroot wrote:
> In reply of:
>> Bump qt5 packages to latest submodule versions from
>> https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
>> 
>> qtbase repo is a few commits after a tag named v5.15.18-lts-lgpl so
>> assume it's now 5.15.18.
>> 
>> qt5base patches are updated to make them apply silently and cleanly.
>> 
>> For qt5webengine-chromium:
>> - 0001-Add-python3-build-support.patc is removed as commit 68302c9ea158
>>   ("Enable building with Python 3") contains similar changes,
>> - 0004-Migrate-presubmit-to-python3.patch is only partially kept as
>>   commit 68302c9ea158 ("Enable building with Python 3") contains similar
>>   changes,
>> - 0006-Fix-build-in-Python-3.11-invalid-mode-rU.patch is only partially
>>   kept as commit 68302c9ea158 ("Enable building with Python 3") contains
>>   similar changes,
>> - 0007-Replace-imp.load_source-with-importlib-equivalent.patch is
>>   removed as commit 68302c9ea158 ("Enable building with Python 3")
>>   contains similar changes,
>> - 0010-Fix-building-with-system-libxml2.patch is removed as commit
>>   c98d28f2f0f2 ("Fix building with system libxml2") contains similar
>>   changes,
>> - 0012-Include-cstdint-for-uintptr_t-uint8_t-etc.patch is renamed
>>   0009-Include-cstdint-for-uintptr_t-uint8_t-etc.patch and contains more
>>   file patching to make qt5webengine build again,
>> 
>> For qt5webengine:
>> - 0002-Add-python3-build-support.patch is removed as commit 2294cc4ed5fd
>>   ("Add option to chose python version for building 5.15 WebEngine")
>>   contains similar changes. It now supports both Python2 and Python3 and
>>   defaults to Python2 if found first. This can be overridden with
>>   -webengine-python-version python3 in QT5WEBENGINE_CONF_OPTS but this
>>   was unnecessary in my tests as Python3 was properly selected from
>>   $(HOST_DIR)/bin/.
>> 
>> qt5webengine-chromium is updated with qt5webengine following the logic
>> stated in Buildroot commit c53455ea4ffa
>> ("package/qt5/qt5webengine-chromium: bump version after qtwebengine
>> bump").
>> 
>> I am unsure whether qt5webengine-chromium-catapult also requires an
>> update.
>> 
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> [qt5webengine-chromium/0011-Shorted-printed-cmd-when-long-commands-fail.patch
>>  doesn't exist in 2025.02.x, file renaming not done]
>> [qt5webengine-chromium/0012-Include-cstdint-for-uintptr_t-uint8_t-etc.patch
>>  is named 0011-Include-cstdint-for-uintptr_t-uint8_t-etc.patch in
>>  2025.02.x, adapt renaming]
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Applied to 2025.02.x & 2026.02.x. Thanks

Not in 2025.02.x as of a20dafe5c190a7 ("package/pkg-generic: Add
/usr/share/info/dir to $(2)_DROP_FILES_OR_DIRS"), or in 2026.02.x as of
commit 2121a13066e52 ("package/redis: update CPE vendor").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
