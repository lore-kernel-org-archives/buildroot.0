Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC2EC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 14:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 885FD40E83;
	Thu, 22 Aug 2024 14:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJM3B723fe-L; Thu, 22 Aug 2024 14:00:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1879040E84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1879040E84;
	Thu, 22 Aug 2024 14:00:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B79881BF34C
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 14:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3C8F409EF
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 14:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9dxpksTA996 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 14:00:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E372E409EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E372E409EE
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E372E409EE
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 14:00:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.217]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VHG-1s5JjX1zru-011mSS for
 <buildroot@buildroot.org>; Thu, 22 Aug 2024 16:00:49 +0200
Message-ID: <95399e85-29dd-43e4-86e6-632333eb3da2@gmx.de>
Date: Thu, 22 Aug 2024 16:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <ZsReNU/ELx70PBm1@waldemar-brodkorb.de>
 <20240820114501.185c9857@windsurf> <ZsRya7Q1XFeVaZT3@waldemar-brodkorb.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <ZsRya7Q1XFeVaZT3@waldemar-brodkorb.de>
X-Provags-ID: V03:K1:/ggeKsvF8hys+qKeUEDLDWTvZ6AFyty85OR/IfV2l+6/MyW/MG7
 MN5XuRrDxyNOnXoVeDpqyvvlb0E29V1BPmOWKcPvLiF1xi6pr8QwKHT2bvmSXiJpVXpuiVY
 GQeAdOOBx1t6bn6j5zTR3Y/gOD8LeVuXBaFWfRrkphiujEo4CMA0Jt1odDyWzgdK7bsqbsW
 /4XFsIDfV3A6AVZ5j8NMQ==
UI-OutboundReport: notjunk:1;M01:P0:+yvqyelqDbY=;Lyq5vUn1Gi7XsA3XRJDXsSw0gBA
 O9JRoGcnSI/1YQMCJQspISI1mzmsiDgU4vDuTwiH6JuD24yzPiM/ZPCPKG8Era5xFBSmZAiFR
 wOORTgGyoPTy/RfgVD+F438G/mEyydh0L+PorhbHBGo/Sb+bbA9fL/BkoQpjtJhUUcTDFr7TV
 L7pWqKa7BfWOui0A4ujLqOcdN26enKMqomT/SDCCpgAyVdhVMQB9fn4/HKyuR6PVDt29ua9Fv
 J5RMH9QoDd17XKJdeZFC6yt4Ba+dwFX9GdqZ8a5BreSiDYAhW4yjPorv7cEcJjHuFT0i5DocZ
 m+N4+VP9jJ+/Rrhe3uX8l2iFnvwX7x1+6ll8s4JUUT7i1Gdo6ThugVKHfsQk90yWmdS2mW6Fx
 MeC5Kn5UF42T2/+v39q/WlmqcpnOOCoUHiyyJHXcSp9mySHGOHI2uud4SQc66pdb4kZ6UuRfD
 E0SoeNwRlP9GmoYuVKViiEgoEdXogK4yeubeG7cRXMYLPbEpW5UA8+zSlHWgtaHCqQOej+dSv
 1JZgPFrwlIaDouy1bBIX6s9meatVjrR3lCA/sDif2Jqc4nmWByo7iD/iUp+fu+QnR1kK5n+TW
 N3R+q8CposRVc0j2eKzF3AmjxSCek1IrER0njp86CMzM8+NgmTIFA2OMY72tfBtydWoFayNnl
 osaROsBxpWR65J7+sMTpweQp8IYAbSGv/PeLtcDV7SFw83NCNHxwSL0HiHMFrkPhAHDWkeLyf
 NaMrbsD1iKN6r40KmzwT6FiLGa7CW8JVO2KKDe8jihhAa77Cyy1coQdDW3MAyQ633yEnHzx98
 qXNDJyL9adlB8HWCKAGrlgcg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1724335249; x=1724940049; i=fiona.klute@gmx.de;
 bh=giAk+RiUNSRELt3g4kze3FpCTxGs+BkBrLEivUGLutw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=QhTTdvD+y4/F6bF00W3A46l1uvxcg7jhd2hLsoQoxVTyB8R9UWYSMxGfYKDOEWab
 3skEMaLYeAHmw4YfckWiMclVBSdC74awOmDd8IFrmbddb33mzV9k3tXsrxNZs5nUL
 4iaVWE3UvH3IiwhCMjldpQWto4+gop6rRKPfWty3XrQks0EuKme1KYQ/6YZ+nyX8w
 tezJdkDaqrROi3sbcee96ldTgYVJkxDp92pU6VjVBA+qLqetPOrj/evQW+33CSDp1
 a1Po83wQnIePGWC0lGzNu01isPXC/YjUs4myA91zkg1gy5if8m1HNRBg6/gVIYgg/
 atcMC4gFRW4rtjhggg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=QhTTdvD+
Subject: Re: [Buildroot] docker package in buildroot
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 20.08.24 um 12:39 schrieb Waldemar Brodkorb:
> Hi Thomas,
> Thomas Petazzoni wrote,
>
>> Hello,
>>
>> On Tue, 20 Aug 2024 11:13:25 +0200
>> Waldemar Brodkorb <wbx@openadk.org> wrote:
>>
>>> I would like to test Docker (docker-engine) in Buildroot.
>>>
>>> When starting a container I get:
>>> # docker run nginx
>>> docker0: port 1(veth7743781) entered blocking state
>>> docker0: port 1(veth7743781) entered disabled state
>>> veth7743781: entered allmulticast mode
>>> veth7743781: entered promiscuous mode
>>> docker0: port 1(veth7743781) entered disabled state
>>> veth7743781 (unregistering): left allmulticast mode
>>> veth7743781 (unregistering): left promiscuous mode
>>> docker0: port 1(veth7743781) entered disabled state
>>> docker: Error response from daemon: failed to create task for
>>> container: failed to create shim task: OCI runtime create failed:
>>> error opening file `/proc/self/uid_map`: No such file or directory:
>>> unknown.
>>>
>>> It is inside Qemu aarch64 system with glibc.
>>
>> Quick question: did you build your kernel with Buildroot, or
>> separately? If you built it with Buildroot, did you build it with
>> Docker already enabled?
>
> Yes, I built the Kernel with Buildroot. I used the
> qemu-system-aarch64 defconfig and enabled docker.
>
>> Indeed the docker-engine package enables a shitload of kernel options:
>>
>> define DOCKER_ENGINE_LINUX_CONFIG_FIXUPS
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE_NETFILTER)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_CONNTRACK)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_IPVS)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_VETH)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
>>          $(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
>>          $(DOCKER_ENGINE_DRIVER_BTRFS_LINUX_CONFIG_FIXUPS)
>>          $(DOCKER_ENGINE_DRIVER_DM_LINUX_CONFIG_FIXUPS)
>> endef
>>
>> Maybe some are missing? :-)
>
> And who knows which one's are missing? :)

My guess is CONFIG_USER_NS. With its default config the Docker engine
doesn't use user namespaces, I guess you enabled it in your config?
That'd explain why it works with the default setup but fails for you.

I have Docker running in Buildroot on aarch64, but my kernel config
contains CONFIG_USER_NS already. ;-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
