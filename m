Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F75BC282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 11:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7902C41422;
	Sat,  8 Mar 2025 11:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymgvruIBNflo; Sat,  8 Mar 2025 11:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D671841123
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D671841123;
	Sat,  8 Mar 2025 11:08:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81F3671F
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 11:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 637E160811
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 11:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hYQq5aldWlr for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 11:08:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF8FA607C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF8FA607C2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF8FA607C2
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 11:07:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9539019F58A;
 Sat,  8 Mar 2025 12:07:50 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 08 Mar 2025 12:07:50 +0100
Date: Sat, 8 Mar 2025 12:07:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Z8wlBkArxK3Qh4WB@landeda>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <745bdcacbdff342d7e37dd1003a03923dc03b935.1740841539.git.yann.morin.1998@free.fr>
 <8fb79f2dfe7c9cedca2e2e854e4b3c48@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8fb79f2dfe7c9cedca2e2e854e4b3c48@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741432074;
 bh=bTDwHk3Bmi4CHBJi62b9FYFfqKSCpOwDgp7b5c36kN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fJp/2E+mG7cI2YIoyi5sJx9doEr87lT5EXcwz8CzGcgpakbgQBUbKoTWha0KfD1e8
 +0/rN/q5glG8vHExndYNEC6X+uYXIlWxZSZCzc9AUHpkmapz0LlyD6rz1G3IKts2jr
 IDubeLuMEEUT17HCrRZrmSs0bvJrREhIdPYJtkpiIYWpb9G33m0eCqhDkxli181azH
 Q2u13nTucWlQa2InQLUDoNYT0Zs+nqJzS6kIa1kmhof90usSsf5W4QizC4PmqXa2+H
 Q+PkjXXC7cknOjp9ok4irclPFBRGkBopt8M1PrLE+pkyAA0gvReocuXHnweSikJciD
 jZ5stig6fZcaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fJp/2E+m
Subject: Re: [Buildroot] [PATCH 1/9 v3] support/testing: set date in
 emulated machine
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2025-03-07 19:49 +0100, Julien Olivain spake thusly:
> On 01/03/2025 16:05, Yann E. MORIN wrote:
> > When time comes to check certificates, the date and time in the emulated
> > machine should be close enough to the actual values, so that certificate
> > validity can be checked.
> > 
> > Set the date to the date of the system. This is going to be accurate to
> > the second, which is, by far, enough for our purpose.
[--SNIP--]
> > +        output, exit_code = self.run(f"date @{int(time.time())}")
> > +        if exit_code:
> > +            raise SystemError("Cannot set date in virtual machine")
> > +
> Is this really needed?

Yes: the skopeo test added in this series would otherwise fail with
(lines wrapped for readability):

    [BRTEST# skopeo --version
    skopeo version 1.18.0
    [BRTEST# echo $?
    0
    [BRTEST# skopeo inspect docker://busybox:latest
    FATA[0000] Error parsing image name "docker://busybox:latest":
        pinging container registry registry-1.docker.io:
        Get "https://registry-1.docker.io/v2/": tls: failed to verify
        certificate: x509: certificate has expired or is not yet valid:
        current time 1970-01-01T00:00:11Z is before 2025-03-05T00:00:00Z

> Arm and Aarch64 qemu machines includes a pl031 RTC.
> x86/x86_64 includes a mc146818 RTC.
> RISC-V has a Goldfish RTC.

The skopeo test uses the bundeled kernel with the "default" virtual
machine, and in that machine, the date is not set on boot: there is no
RTC regferenced in the kernel log, at least.

> If we revert this patch, the podman runtime test still succeed.

The reason to introduce this patch was not for podman, but for skopeo.

[--SNIP--]
> I understand that it is not always guaranteed that the qemu machine
> has a rtc and the used kernel has a driver for it, which is why we
> would like to set the date like this.

Exactly.

> But this could be left to the
> test implementer to make sure this is properly handled. And in the
> podman test case, you did.
> 
> What do you think?

I think that setting the time is a generic topic, and that tests should
not need to do that.

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
