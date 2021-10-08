Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA78C433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 17:07:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A41B60F9E
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 17:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A41B60F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F34F840192;
	Fri,  8 Oct 2021 17:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVhx3uxNcZdA; Fri,  8 Oct 2021 17:07:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18855404BA;
	Fri,  8 Oct 2021 17:07:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A4261BF2C5
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 17:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89BF64061D
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 17:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oR4nTpbkftu5 for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 17:07:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F41D405BE
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 17:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633712844;
 bh=PP7HuBzUcen+6CuCMRGHo7JWLlhRNeCMecUNEAMeUfE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ahtL6q8i9I4FQUjOufNYhOUk2fasn7KGsB98bFb8uEeJ/Nr2snx5BaMvIIopc4Gts
 feBWtCr7MdTu67c6y0WuhpuwuprIvYadDst/MmkZtyPwhl9gMwfZg8mGtXjYCpvGst
 Ye0kHQZyvCi7yjYYGU64CP3p92FjN8RCzHyM3TlY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.214]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvsIv-1msUDz0kfX-00swyi; Fri, 08
 Oct 2021 19:07:24 +0200
Date: Fri, 8 Oct 2021 19:07:22 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211008190722.5a269507@gmx.net>
In-Reply-To: <877denztb0.fsf@dell.be.48ers.dk>
References: <20211007210844.4901-1-ps.report@gmx.net>
 <877denztb0.fsf@dell.be.48ers.dk>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:mv3DsZrRM6NnyCSAE2V9BoU+mw5Q6DFM+dYvBucOHQ8XEJMRhnJ
 yRDTUmWqoC3usjNkHE+qSKNchb3aZDxZVWztgvueBsSBvIfKrMJwCdv4VOC4JSNdH6NJvUV
 OApsF5Mg2B9VZw8J1KkY7J+OvOqJ9VFaLoAZ97LdVm9u7CLw8bB5SwE+I3Y7azN5QAVWgTt
 OpS1gOFHAwtfGYFnDHbew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FgDsJ6H1UNI=:hz7owgb4ctPxKU4o3Dv/zi
 mYoH3x80vxOaUUvrdbO7pGdFRAfe9ZJDN9T6qmmOWnacRxp/E5Z3OtzVUtLiHnsDO/oFyqsA0
 13M398qDjlgAPmRwYeUURNKrxya2Ct6h+DtYYjiPn9Kp1JflS+yx5ZvD4syWV8ejtWqMlaLbp
 4rXIW2PG/NJmUnzyqGQ8po0QgznbB+NpVILlBkFI16DAUETyolmC6vlj4lP7bpBIV5yvO6qiA
 A9oeuTi/0DQ8Ipf6tkYBQLL5SoDN6/LaBJxtuj63XWSzaJgHLQrQaFWYT86SZAYt5lr92CBKM
 5bABeGHU5RocuCTQsUsZ1id1oeDesnA4oGr2pQA0SHCwd7JT2vxLWXvU8S5QJfNbRjMdaOYj8
 e0st9gWmCl3nswt+m2nP04Sb0uZd268A0c1A3VTJxe1zR1BssDZtPfhRo7ToW/qLHXalmwwIw
 SxszZn29CvGnnxUaCDR1T8hpcj0VxKo539gu5Bn2OXVjXajaZlXyiwJd7aOmp7kP38GYaJ4q2
 h8f6zrPzD2aEZzMTrPYN4KkWUnIzi2xf1LkM1xe9dNTWpmshpJCIabaS7eJR/Y8E+q9aptcrw
 9VPXcI5z1hlGcSIOt9m7Xsll1vMUm2RhkEIcG951ZdMQ7uURKfUjLGwQXyLOv2i46h8xvIQ2I
 L/MaS15m1WFKKGQ1bi8AfClB3MQMQV6/46s91ex3nusUT6tpvLl7lBdf/JYJ+5NIjQSsYd/dy
 Yx7rHSL7aniIZ6cdlbBQhqWmAyZ7VpqbCArGy2z442Rn5XyX5tujNz/0Z9sPCbVVGnXpNNKZm
 OvRqk+tPiS7InCVzNgNu4Hpv+yuvlGAvgSixBasUzLoWzXBVUX9rN5SORwKGOhM+ZtXtaF1Gl
 G03aPV0doedqRRPIWMsYswe/C1YgKib8jiI3gswYYuf9ib8CGgRTBo0+8iE++ZsEstlCpzGoK
 4EnPi0vRUHOYBWwC2cwozobDBEpjC1o+9pbiekgsbMGhn0UoOThghMI3TJ/aqy73oVIo8Vg0j
 r0Zwy8W881dm6CuUKsPfli5GAGNUytEzMIc3julBFvli+safDAHB5B8p/7xTTO0HKCW7/Bvdk
 ZT/belC6kk4Ke0=
Subject: Re: [Buildroot] [PATCH v1] package/wireless-regdb: bump version to
 2021.08.28
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
Cc: Dimitrios Siganos <dimitris@siganos.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

On Fri, 08 Oct 2021 12:48:03 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
>
>  > Changelog (since 2021.04.21):
>  >   47007d0 wireless-regdb: update regulatory database based on preceding changes
>  >   e983a25 Update regulatory rules for Ecuador (EC)
>  >   a0bcb88 wireless-regdb: Update regulatory rules for Norway (NO) on 6 and 60 GHz
>  >   cdf854d wireless-regdb: Update regulatory rules for Germany (DE) on 6GHz
>  >   a4468e8 wireless-regdb: update regulatory database based on preceding changes
>  >   86cba52 wireless-regdb: reduce bandwidth for 5730-5850 and 5850-5895 MHz in US
>  >   6fa2384 wireless-regdb: remove PTMP-ONLY from 5850-5895 MHz for US
>  >   9839e1e wireless-regdb: recent FCC report and order allows 5850-5895 immediately
>  >   42dfaf4 wireless-regdb: update 5725-5850 MHz rule for GB
>
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> Committed, thanks. Given the above changes, this should presumably also
> be applied to our stable branches?
>

Yes, would be nice to keep although the stable branches up-to-date ..., but I doubt
a lot of people will notice the fine details ;-)

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
