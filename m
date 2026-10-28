Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5D4606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 23:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d9kr69iC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=om5XCAH1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z0JI/UN4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C64826070D;
	Wed, 28 Oct 2026 23:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9qw0ySqqU7i; Wed, 28 Oct 2026 23:00:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D902260710
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793228432;
	b=gk1ia8RYQBYuRK5EpN/P1qCqJ1MNa9FIZ+sJeww2Id0sExxJp0BtWvBPWiRZ0KR/1oKF
	 oxg9vlap6yzNbulzR1idekzrX4tExHVRrGdxoMxUWc4c6YPCeBO3S05d9/vHvY49VlTfu
	 J8RiFTo9Pg5+k1V43PjjQUFREtgt6LjUW9Q26Lu7yRS2e/Ar+ej1hhU1f+PVCt8wsKyX2
	 URd0jAwPiDKMRc5K7Qm1dr0vvssOtlqR5ETTE30tpSD3IRHpHk+wpRATb2K1a26dTSAlo
	 NMZlg+bTj5vp5LMXiTLqqC4vKwTWMasiiLx1sqPcyueTLvsYFqAy3iU2EvsT88AaJIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793228432;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:MIME-Version:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eiSQfdz+C7enkI/ua6q3uxzyp3GHf4X89TeTVjn4TgM=;
	b=sHerXxJzDVokSW5/1dK5l7TkhJguu0iiPX07ywYEEGvI27vlw3hMnkLet1MPQfq+9r5W
	 hWhb2RBm83mNVN1BO1YTxao46acFCvRQ1iuqsO5znj1ngI5GZKEfEB7LzmJnl4mScSK3h
	 y76/DYrr9pcpLAiQZwsJ5eo+ZMg2SBOnVNpLTtToWCpiRs0r2/gqMWus0xd+K/bk0Yjj8
	 Nn5Au6K6ZN1ioFp3cW4Odh7G43qY9CzbNs2EJOMW5S65XrrmAgU+VDQjV1M/6yxDm0e0+
	 NZmCUUvzx1OxdD8T56ki6bSMp2hq9JZq8Eih4swNgOvLDnQr6wfrJLYmsfsuY5n3BrA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=om5XCAH1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z0JI/UN4";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793228431;
	bh=eiSQfdz+C7enkI/ua6q3uxzyp3GHf4X89TeTVjn4TgM=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d9kr69iC8o8l3RlhLFMyGLGRfgyRI41E6OAxxkozjeGxDYs7a2/C3E9F7ao/xAsLu
	 7ELUCVm2OH7NxWUO8EZdvu97kXSTn5i/sZj2iET6TBoL14rLfnyi8pG0B2RK6dqxwy
	 aJzuVL3C5FfeBHF282Dti6pwA1g0Sg0DGfzpgD+p5OAyLHKjvjh/cyFKH4/u72tgz7
	 EOL/zUd4lLWo22MUzUh2gLyudNOIWxdWD7zi9TgbyDXaS59RPOlkuTZxC5P3h+kR64
	 eoUG0H+sFluf4tufxuo9NgTwJ8U230uHnom3G2k+oj5EzNdRrQRQYBQKJGwzz+lOba
	 nX16DsYftyiTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D902260710;
	Wed, 28 Oct 2026 23:00:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E0113AF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 636A760731
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6G1S9HKr0CKN for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 23:00:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EE35160710
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793228429;
 b=nCqV1up3QPFJBE4iZex2h4iKWfjxK0EhCKhApRASBHyCeHQ+DufQChK7GjycgkIjwtvC
 81RRZ1Wj5MyzG30OPtv3I1hjSjg0KTwV71XySgsUHf2ZK0EjfoVN3YH5R+O6zXH1tEys/
 0R8d6bhLpxHdzspZZnZCKW2J2R1dbW/c6tH+tDgFqZVvGsXt9UMFybebEYdt7ogQ7aMko
 uGosM3eprQ/PfYrP2Jq2XfjDWSWQMcriF08CVSMBe+FD4Y5oFT2ZmeXlSphNc7pJ4B4xO
 VM/7lTTEknywIfHYg0ufunmwxPw8jXd8J1RT95nWxG+xm5rmPSu56Vn/LfQ8ZQ6oi0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793228429;
 h=Received-SPF:Received:DKIM-Signature:Received:Received:
 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
 bh=fcK1OkbmOlsEx3W+ZXyTnh4AGKS9m+ZEEv7D4onhos4=;
 b=Op+eMce9pKg89K2MvGXVp4h1VsY/VrbTcYQcrdpLTjOMKnqIbNxT1rf1lXiqDrJVL5Kc
 WpyEuAEfTvKnyohPX9kvWO5lcrDnvLzUC67E2+9UsmRG/KGeQK+6oHtpLmuQlF6TkOrGU
 JeIw+FS+p6CyBNz/mJBiOMUe+vU2PBIGr9nvtdbzsEHwI07nWhUr14DDGRUEbK6Fk6aUl
 AUofxdscygmqAHnmlvaSYQreDWiTMRbjw+hTB36HygmpDeA5jvNBtIXdrklruVibfyizF
 ibSM9RJsebNnB5VmCeIpbxeO7aV+kJExNmtKEjwQ6RfJRNjECHzeNI7eBQTOCUtks7Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=oss.qualcomm.com;
 dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=om5XCAH1; 
 dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com
 header.a=rsa-sha256 header.s=google header.b="Z0JI/UN4"; 
 arc=none smtp.remote-ip=205.220.180.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.180.131;
 helo=mx0b-0031df01.pphosted.com; envelope-from=chris.obbard@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.qualcomm.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com
 header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1
 header.b=om5XCAH1; dkim=pass (2048-bit key,
 unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com
 header.a=rsa-sha256 header.s=google header.b=Z0JI/UN4
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE35160710
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:00:28 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SMAKEl1333227
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=fcK1OkbmOlsEx3W+ZXyTnh
 4AGKS9m+ZEEv7D4onhos4=; b=om5XCAH1wV1dQkgHiFy1TgDUGoXk/kHpWct5da
 qeohLpG1XRJ3Pgs/cTAYM6dG4BXwky9zb0x+436Pn+ELprXPxBIcg19S7cP+UBPg
 1bxPjf5P6hBZT9i1482XKJWn4BsgttuMdK6qxzQ1isLugFujbue2FQJEdPi0pKz+
 kJWSE6VT6hSpzBEZd0MvD7k/dGiMcJEmlceWc+HLBpteNGHwSzeqZN9ex3MxVqjv
 g0ZpK+04KbDizPmobTvKDPoSah2XtxCUdLdAgjmpfrWeSBhx/wcKKo9/+412JSMy
 WZP9vBXl9BYNP3u6XdrhFzjdzhnkzuwNmfYDI1XspbcGDgLA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp39p9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:00:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91becce058aso31926786d6.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 16:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793228426; x=1793833226; darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=fcK1OkbmOlsEx3W+ZXyTnh4AGKS9m+ZEEv7D4onhos4=;
 b=Z0JI/UN47LPhIi2lwyitnDNis8cUKpWrmo8zl7WCnGCMLepCaEacHiB6zNHNZHfrni
 acwnRXqAjJSRt2Yi+bwZqonva8fhzzrlNercsd+su3hxUJHLxW01De90iPlijXIgIaIp
 uQnsGs7TiKO0Z/Nq1beC6Dp+SnJHgMu0ca6DTqopJM9svRHn8Q47iY6itbHD5CQfKUSk
 C9CeiAAZfWYAyjvsjYuQ+/EW60Ava37LxcVEsAtGYhtR5pdSZZskwIYO+EUnHLjBRgHE
 QztTPq7hdIt8yNGk9PxkZX3I8NGyGs3pRftG5obrs053YIJPLM+kYr8K8IH7M3Af7zp8
 YO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793228426; x=1793833226;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=fcK1OkbmOlsEx3W+ZXyTnh4AGKS9m+ZEEv7D4onhos4=;
 b=Lvw+RXub93yFvNaxR9LVRdpPMox3RNuPoFSYug/xkXih0pTB/0+pLsYbrl9bTJmML/
 ecEpyujmSDObaKCIvQff8AwTQPoQSIVoK4V6++h/1O2luxkR38c9PaVtBz8vm7S6QB40
 gFqFozwB+yEiwLr2WF9DG0arDAibcHRcQnWLP7xwsL0hzhF+ypeRIQ1FGimV2PJoUI2o
 N38zelKtJ4Ye0csNsp2sYGDaDpdVNJuIFCEXQYuaRhV9jBwW5a1zzMa4zZwNiHDEkS27
 Fc+5BMro7LapaYqX6xIHDjG2TTiFxy0+1O3+3cbubC8z7mjPRG8UIxbfUqqV9o/CBuWg
 sUWQ==
X-Gm-Message-State: AFq9FYKT5tYN63TmDZDkToSoiIZeV4OZRC5vdURho6SJNCWGkvUEhzyU
 MojYnn+DYkFrxC2FVTT6v6OFfwufVYu/oxNJ9sNFDeqxetW7kpW2ZBeXtfxHQDzfRBZJY2v2f/f
 LQBnneDqoaHOS3yxmIwM7Lew8XInZ/3HLU9oqzZP8GhlnRjjAw0cgGZFiuzCu5AGcf0HG
X-Gm-Gg: AYBFou1uotBuhvVr8Lu85yzfz3GeRj9hct/iq0SYtclMMFwY0UOfjfiK+gMaaBHrzyo
 b1aBlJCfIeqKd4dEL2KE2DT5ltKwXeWkPFZlfni5vpgOJZxUS5rUOwNMyYPf4DN2Rhf2kc56Sih
 QG+SMHyrvS7HCJ8zUDPEwpQ5eGLyg65fZf2GK0ZBEkKLMfIoJ29romhfT30CnYfYXxFPpuk2d1i
 UEN6y6pECkVJJ7Zqn2Lwg9dEmdtYAimKz7M7CZijoS3BNJCNF82wSfvNn7neCf6SgjmNn/xYs0L
 DZrfe5lVOHRLTScHKIzTYibe7o5PwwIhUS+WH6oL2Y9WJmsu04psCb6+18oyIZ0L4s3+2irrDjE
 LQdu15hkZ9wTyt1rQoa1OsG80mdAQsk/2DYm3KuHcBq1I/uedaHz3+LXnUuXBnw==
X-Received: by 2002:a05:620a:8906:b0:93f:2610:fb6f with SMTP id
 af79cd13be357-94408aa13f0mr535477085a.20.1793228426090; 
 Wed, 28 Oct 2026 16:00:26 -0700 (PDT)
X-Received: by 2002:a05:620a:8906:b0:93f:2610:fb6f with SMTP id
 af79cd13be357-94408aa13f0mr535466885a.20.1793228424844; 
 Wed, 28 Oct 2026 16:00:24 -0700 (PDT)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecdd5b3sm30753429f8f.53.2026.10.28.16.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 16:00:23 -0700 (PDT)
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 23:00:16 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261028-wip-obbardc-package-dtui-update-3-1-0-v1-1-2ff61efecfed@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNywrCMBCF4Vcps3YgGUsVX0VcTJKpjkIbcqlC6
 bub6vKDw39WyJJUMly6FZIsmnWeGuyhA//g6S6ooRnI0GDORPjWiLNznILHyP7FbRJKVawxcBE
 8okWDQqc+GGcHGQ20Vkwy6uf3c739nat7ii97HLbtC8Vu+fuJAAAA
X-Change-ID: 20260822-wip-obbardc-package-dtui-update-3-1-0-e274d0b16ef0
To: buildroot@buildroot.org
Cc: Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=sP/VpCNIzR+ruHde8yYzLCvbn+qMukcUDkxZi9nKUC0=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBq4n6BLdAJQQGUbFgn4qdPkIBc+dGxbpLtFQGKL
 IKffUXgvi6JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCauJ+gQAKCRBjTcTwaHBG
 +CabEACUm6fEva528D59ewUCBoecgOngO5quG4xGKqHvhDnrk5QUUfzrqfPJFVn4MapISwpY3La
 43cQYSn1iX/RgdjGGsf8gbCeW8z3iPxqS59KSBT0YKAWsU3i1SU4tCIpEXbORcDo0gwG+FTR5CI
 +D5tZNUX9StHR3JGIZzp+ETxpcgY+QbSDnCZg9eBR2MX+9q0P9EMOUfTevZIFLjK8MmzReCIK0L
 Ye4qnXX7P/ZHpJegAcnsGtDNQbseqaolqJR3/CEHKfKk1tHNkMWkFhQtgz5QxQhWAa8Z6YFa/CP
 hMcDi19rO1hiB30keNtqlRXeimrL3IG7lJNaq9RO6mY4NmvLRdxgisDI+et88kT73+yMT1vwxvq
 +Vw2ekLpQmEBnIUQIAkb8R3yP7Z6tYH4VaQFFS3enngGzPJRs6A/xTVjLmd+ade80Y7ak4+/Dau
 IoRuBJ3IOlLLGRx715Vkq3hj85xCZrZ5G15Cy4ahfYtK3Xc1D3IgUcxICeepNxD3qzmhdBd/7BY
 Dff5DGOc0r6lJ0vWgFqY6pG6aqdepIVsi2m+UninW0+Rg0xRry746APflGuQVp2FzqED5oSk+RL
 +AAVuJccvl/OE3pIV7yR7t/nPMBNauMku/spTHbEHagRszLL8ZuKZfcq9ZLIr/D3hDdzSZ/c6mM
 j5enCcJVXggg3wQ==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-GUID: ry8hbN1HEo9P7mqzAeiyrAr6rzBYxxEq
X-Proofpoint-ORIG-GUID: ry8hbN1HEo9P7mqzAeiyrAr6rzBYxxEq
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae27e8a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=RaF8BXzzhcKCX23jQAgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA5MSBTYWx0ZWRfXz9lZA7a+/kI+
 Ts8LskKcgo4RyGGLYETHZyfWAw8tHmawVX05jJ7Qk2XtdXMRLzn6GC1tcTRxZO8z1CnvnvHiygQ
 jwFb58nuCMkP2dVJVxlA3dlUmMAJZQXBe9Twbaui1RD5zhRl2DZqOW3qBK5GICaLBFWg4gOkDuB
 rBivfXnG9PVUPMa9OZYE+iSo01gNh6MzFJgTvl5G/lIbdZaIjIXYwmow4PZ/EpdEmLP20qWIbGU
 SjmxwUFZnNLLopaVPRqIF0chf2XhFIFSXvm16xU0LFSLJ5XEaG0rki+RckfJI8dVV5fNiTpVLeo
 z2/uO74enB+elHatWQ5DA55XUzggDPJLIiOxiWVjFL08fPqZlqu5iD9P9NGvXgMGIXawOvtpEdb
 wRA7PJt7n6wv8TQyh599hmbreI1f9fA2WVlVIY9E0wSYeq/LINIx6ssaF9fAVQf+1/JdvvmM+xg
 nvItXibayCeTabq3spw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA5MSBTYWx0ZWRfXwHmRruV5yN7Q
 hvz1p6uvwrdduE3IiZ8yOBTUQ1m7DSwy7ZfkkRh1ZG9EaZ+hNc8E7AcO+gRpL4ixP7o2uoA9FJ4
 8WUTIg96Dzgfy+WyZBtUIChDnQg0CPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280091
Subject: [Buildroot] [PATCH] package/dtui: bump to version 3.1.1
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changes since 3.0.0:
- Toggle tree nodes with Enter
- Bump chumsky dependency to 0.13
- Regenerate stale Cargo.lock (3.1.1)

LICENSE is unchanged, so its hash stays the same.

Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
---
 package/dtui/dtui.hash | 2 +-
 package/dtui/dtui.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtui/dtui.hash b/package/dtui/dtui.hash
index e45f979934..b042812c73 100644
--- a/package/dtui/dtui.hash
+++ b/package/dtui/dtui.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  57bcf3a8b6681be2695762da17c20d2efb7c121131138868ba7a4485fa08c335  dtui-3.0.0-cargo6.tar.gz
+sha256  cff3895576d31a321e82ca63ac45f8a7dc2ae902ae2b9a3efa68438cc5d8aab3  dtui-3.1.1-cargo6.tar.gz
 sha256  b7b3cd0d92fc6638f0a7bd2306d715c747d040c6d851ed821a45c5538663e57a  LICENSE
diff --git a/package/dtui/dtui.mk b/package/dtui/dtui.mk
index fad5f818b4..86bb0fa213 100644
--- a/package/dtui/dtui.mk
+++ b/package/dtui/dtui.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTUI_VERSION = 3.0.0
+DTUI_VERSION = 3.1.1
 DTUI_SITE = $(call github,Troels51,dtui,v$(DTUI_VERSION))
 
 DTUI_LICENSE = MIT

---
base-commit: 727b904c13bbc2a9a7a530b1f8e47d7d180c2768
change-id: 20260822-wip-obbardc-package-dtui-update-3-1-0-e274d0b16ef0

Best regards,
--  
Christopher Obbard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
