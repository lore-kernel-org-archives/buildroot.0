Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC091606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 18:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cOcPQKbo
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA66E80DAC;
	Sun,  1 Nov 2026 18:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEivyjgqezea; Sun,  1 Nov 2026 18:06:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D29E080D93
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793556375;
	b=MGkI4hps9RW88QutYrU1C+Sk3rPA14wpOWoCsbf17C8R0/JLO78u/ug3as7iTvMOOtRX
	 6qt5U6BVmfeWivkQpQyWMIcxhUUG1hsIRxsmmwe6FAjeI/VV1j3I/8xs1h1sVUruOfGH5
	 Bs3GxRISJaGklmEH5P0cBd/v2V16PKPCwZG+eSlqveWwz7ZXq73twt62V2m9BSojTTq+n
	 wAjnV3TPIAc4/dGr313SgZZB5iZO824odUHglUqA4AmV/2Tl38O4/iCVPSu0nycJkCMOT
	 jbCfT9M3KiBn2h3BGZ6Lq+uCTeL6p8dmvOtUzwlOZrHBoHDJ4+DrZqvsFKtvrnz3+YA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793556375;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Injected-Via-Gmane:To:From:Date:Message-ID:References:MIME-Version:
	 User-Agent:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=D/463JpBKxh1TUCLp6/i6sv5bTNnvHhRV6lmAbEMrO4=;
	b=kKkg/AACubN1ffUeSlasCIT7lXubrGdthwMynnKraKvd+g+uSSdx0UlUyDomYQL8lfx2
	 ufcfkKCJcwbY6c09QI7Rgv6CgwACj63R10KcqStkzwDbmr8oPdPipWaixVkHUOnQCjj4U
	 k8cflDBhMc8cAGH0QhTtLClRHmLVa+V0+U5AklPe8YgfZOXeKlFmRUYchTslpvDQkueEj
	 QY0EkwxfH3t19tW4QOFRyBzLMBQwDlkjS07R69gJUBFTxwGn73oO2Xm3iDwvmBgc63Ce9
	 IejxoV8oiUF+mikbN3DmyRkcuf+bUWyLCSugVM8LxPyqnpNgOMqEs5p1gdAwCSzgbJQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793556374;
	bh=D/463JpBKxh1TUCLp6/i6sv5bTNnvHhRV6lmAbEMrO4=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cOcPQKbozJXv+jFShkdp5P/PtUbRIHXoNMKrVHoi1l9poo0NbZZ3QP1Hgy7HFskhR
	 gm3clsvJdltURANmQQjXT7S0u9tOpshqpPtJwHx54Obec1nzNFdTnz1omdFLzecjux
	 jW+6zmfbt4r8hV0AG4gstEKu9cc6ohJ9sBVVoU/G/EGVOB/2jI5d7gizxsHQnamwTs
	 PeOYzf6tkEd+lUT16OzxteAxt1k9GJcYWkNlUv66+rqWxHwCIj7WWWqOQ2fhBeTxiG
	 7Cmw4vUmEJ65z5iVm1FvpwcrOKlW3XnYzg5YqpEIWdugoFZlY7aO+oEVmGMX8wd0tB
	 vw60FGcvAeLbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D29E080D93;
	Sun,  1 Nov 2026 18:06:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8505F2AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 18:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8181940098
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 18:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omMNDe3o6HOg for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 18:06:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1D5034004D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=49.12.148.96
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793556372;
 b=QLfc13TLppjzTnfCbZO0XTD/zQMF4ahDzT641r88kkaNVCZcmsRq/Gij98RqR8Je/KTn
 9pu3J0oX6ReTK8kAmJLUCanh5KpVMbWos43ACYyp3pgQmsDeI3wXQfUi8n19g4D6LQAWO
 5+4evFcUw8nUcmZAFYnmbmGO8R8MzMwPMX/zbOBO7zllWWMqZtFu5LjpEjcoqV/6oSes1
 Gd3/VTYXSkVyl9ijrF2WzaIRFi4V9IbbFNRUlzJqciMcZkivGbDM8YEYVsIOoDUQZ9bCy
 npV89w8oqOT8HH3qfA+ASlw0s7wO68ATY9c7CfElDDr3NFPCZg2e81X71oWhO29JT+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793556372;
 h=Received-SPF:Received:X-Injected-Via-Gmane:To:From:Subject:Date:
 Message-ID:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:User-Agent;
 bh=jmKGsPoVXCwSb51/wyRTLNIpFVCzV1EiT2TODRg4xJ8=;
 b=IEe7zTOZN4ys7q+AqkcBrSoByqHZga5gMYsRg6P658dKYlJBLLZ6Jm+fctmF487iXCr0
 ZdeVgwdwFpD1y80X/UXAEbzdgABEr4Fp55PwizWi9xj0UAjjDlTIXslcI0oweD3VPJuYE
 YxASu92KFIdmnmJDwhku76xKXseyWepJfnk04zxASE59cjledBxWFstZfqIYsSIYLcCHD
 Fpb8bWlCGBP0vLLdW4nm26AJfC4dv3mO8uSjolbJ2KJ0Lob9Q+iRmWhy7BPiJC46sccg0
 Mht6gXwMMaoWMX5TQhuZ2TxosjOqRZGZM+rMPJWXoyNeKJdmOVRm06DxzAac4VIUrMQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=fail header.from=kuhls.net;
 arc=none smtp.remote-ip=49.12.148.96
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=49.12.148.96;
 helo=ciao; envelope-from=gclub-buildroot@m.gmane-mx.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Received: from ciao (ciao.gmane.io [49.12.148.96])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D5034004D
 for <buildroot@uclibc.org>; Sun,  1 Nov 2026 18:06:11 +0000 (UTC)
Received: from list by ciao with local (Exim 4.98.2)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>)
 id 1xNZwU-00000001BI9-3qEE for buildroot@uclibc.org;
 Sun, 01 Nov 2026 19:06:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 01 Nov 2026 19:05:54 +0100
Message-ID: <pan$fc49$3eb48425$dbc85d03$3c246fa@ID-313208.user.individual.net>
References: <20261101104535.1696412-1-bernd@kuhls.net>
 <20261101104535.1696412-6-bernd@kuhls.net>
 <audvr60n62pCGzCb__2095.99053939513$1793552489$gmane$org@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Subject: Re: [Buildroot] [PATCH 6/6] package/ffmpeg: bump version to 9.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FSL_HELO_NON_FQDN_1,
	HEADER_FROM_DIFFERENT_DOMAINS,HELO_NO_DOMAIN,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas,

Am Sun, 1 Nov 2026 18:00:30 +0100 schrieb Thomas Petazzoni via buildroot:

>> --- a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-
SSSE3.patch
> This was submitted in 2020.. but apparently not merged, what's the plan?

Wait for upstream to commit the patch.

It still is in state "New" along with ~30000 other patches
https://patchwork.ffmpeg.org/project/ffmpeg/list/?state=1
and I would feel bad being the guy asking for an ETA ;)

>> +++ b/package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-
slices.patch
> Same question: submitted in 2019, not merged.

Same answer ;)

>> +++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
> Same question :)

Same answer ;)

>> +++ b/package/ffmpeg/0004-configure-add-extralibs-to-
extralibs_xxx.patch
> So why do we have it?

Added by buildroot commit f30bd1eb69c44793485e9f013249d020e3e19fc3 to "add 
-latomic to pkg-config files". A patch addressing the same problem was 
committed to ffmpeg 5.1 several months later: https://code.ffmpeg.org/
FFmpeg/FFmpeg/commit/2f0a214a6202516b4dda2bb22b6b3ac20e465d6d

I will check whether we still need patch 0004.

>> +++ b/package/ffmpeg/0005-avutil-arm-fix-armv5-build.patch
> If these are ARMv6 optimizations... why are you enabling them on ARMv5?

Upstream asked me to do that:
https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/25624#issuecomment-78683

>> +FFMPEG_EXTRA_DOWNLOADS = \
>> +	https://github.com/xbmc/xbmc/raw/refs/tags/22.0rc1-Piers/tools/
depends/target/ffmpeg/001-ffmpeg-all-libpostproc-plugin.patch
> This is a huge patch to re-add libpostproc. What's the plan
> mid/long-term ?

Use it forever... FFmpeg decided to remove libpostproc and created a 
plugin mechanism so it can still be used:
https://github.com/xbmc/xbmc/commit/
587f3a6e936d487552d002bd63a0e4ff74bee433

LibreELEC carries the patch as well:
https://github.com/LibreELEC/LibreELEC.tv/tree/master/packages/multimedia/
ffmpeg/patches/postproc

Kodi needs it for vaapi-based hardware deinterlacing
https://github.com/xbmc/xbmc/pull/5253#issuecomment-53122885
applied to content like many 1080i DVB-S channels.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
