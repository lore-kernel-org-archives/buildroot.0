Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DC0C5320E
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 09:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A18040574;
	Tue, 20 Aug 2024 09:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nAlqW_O4_k0; Tue, 20 Aug 2024 09:13:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CA98403FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CA98403FE;
	Tue, 20 Aug 2024 09:13:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3054E1BF32C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AF3481123
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWeirVltqJLm for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 09:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2BBD81122
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2BBD81122
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2BBD81122
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 09:13:28 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E2F033536740; Tue, 20 Aug 2024 11:13:25 +0200 (CEST)
Date: Tue, 20 Aug 2024 11:13:25 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsReNU/ELx70PBm1@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724145205; bh=7R0rA+u9C19We605HAGKDSTNQyslSpwkkdhUOT8hIFM=;
 h=Date:From:To:Subject:From;
 b=VmuiTqr5whVfqmI8Db27zYZzg4RKuUdSNHMD3CrVGRG8sM6TSQ4oGE4mwFvMwBqmn
 Yi9H/tu+/4IkMV71IeoRf9Ne+fz5/q7jIYGsjh7OmKGLEz2IanOyeAM2DmKemwbLuV
 QvoENRXkyrZqIp84wxujr/7SXhVLz3a6jitJ0Ftfz833eHTYLJrCaBDIctX1FHCaE3
 Em63u5ZwwhtT7l77bYaQSVDb6LRe0hF/Y7z0nJYyAq4+rAYW0QAqFS5xu9MHXf1nd0
 lF/Rrpd56GUgsUiyUhvtTQouLcfDe3qfhbSMduIA3/MFZPb6yx9LBaT7hG49iYKJaG
 2O2HDO8M9bvfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=VmuiTqr5
Subject: [Buildroot] docker package in buildroot
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I would like to test Docker (docker-engine) in Buildroot.

When starting a container I get:
# docker run nginx
docker0: port 1(veth7743781) entered blocking state
docker0: port 1(veth7743781) entered disabled state
veth7743781: entered allmulticast mode
veth7743781: entered promiscuous mode
docker0: port 1(veth7743781) entered disabled state
veth7743781 (unregistering): left allmulticast mode
veth7743781 (unregistering): left promiscuous mode
docker0: port 1(veth7743781) entered disabled state
docker: Error response from daemon: failed to create task for
container: failed to create shim task: OCI runtime create failed:
error opening file `/proc/self/uid_map`: No such file or directory:
unknown.

It is inside Qemu aarch64 system with glibc.

Is anyone using Docker in Buildroot? Is it a known problem?

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
