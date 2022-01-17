Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2590CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 06:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B368606B0;
	Mon, 17 Jan 2022 06:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTNhQF6qHo3e; Mon, 17 Jan 2022 06:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9D8B60674;
	Mon, 17 Jan 2022 06:18:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BED1B1BF3B9
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 06:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD12981320
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 06:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=sigma-star.at
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gup7WPa_QKiv for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 06:18:09 +0000 (UTC)
X-Greylist: delayed 00:06:47 by SQLgrey-1.8.0
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9052081312
 for <buildroot@busybox.net>; Mon, 17 Jan 2022 06:18:08 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4JchPH1Fdlz4x8Ny
 for <buildroot@busybox.net>; Mon, 17 Jan 2022 06:11:31 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at
 header.b="R3XwlcMy"
Date: Mon, 17 Jan 2022 06:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-star.at;
 s=protonmail2; t=1642399877;
 bh=UU/Qbl64hhg0kZkxYwlpIijUKiKTp+N4i9ANE4YKw4A=;
 h=Date:To:From:Reply-To:Subject:Message-ID:In-Reply-To:References:
 From:To:Cc;
 b=R3XwlcMyVnZx3IeUlMBXqZ+Z7sEsFSMhNv2/fsYyx/QEyUspH1XV6dJMKSlYlkDU5
 +NaxXl3WsYfCTx23hS2x3DbnawylsVoZpD0PMdL3+HkVkoJ0tWcbhb1LAKQ/t+N+EA
 Jn+GnNmtwGQb0rxDeueLEgOeFinz0BHe37Wxd4gx3BRAmQIKz2rD4TDP9Xp00WSfxP
 y3PI28h3O8JhTJT38rG+KwlYniJSAhj1x0VGthNshSmt6a4djh2+ompRG0gNtX4ts3
 O9s/7XsRjkS1s8+mWeEueTmF6K+zz7d6FEOS8UfCP/V7dTLiRmnyUceG3FgIPsj1+6
 95UbaneuO/NEg==
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 MTD Mailing List <linux-mtd@lists.infradead.org>,
 Alexander Dahl <post@lespocky.de>,
 Buildroot Mailing List <buildroot@busybox.net>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <816f8625-a002-e3b5-8065-c61e4affa431@sigma-star.at>
In-Reply-To: <20220110121715.GA6032@falbala.internal.home.lespocky.de>
References: <c31dba4f-42a8-ba48-7df2-b56bf4699a4c@sigma-star.at>
 <20220110121715.GA6032@falbala.internal.home.lespocky.de>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1_ciYA4Son1MuKBKCWsbRbc2ld0iGhrUqrMK8eQ80"
Subject: Re: [Buildroot] [ANNOUNCE] mtd-utils-2.1.4 is released
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
Reply-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.

--b1_ciYA4Son1MuKBKCWsbRbc2ld0iGhrUqrMK8eQ80
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On 1/10/22 13:17, Alexander Dahl wrote:
> I tried to verify the gpg signature, but I could not find a public
> key. At https://keys.openpgp.org/ you only get a not working key:
>
>      gpg: key BCE5DC3C741A02D1: new key but contains no user ID - skipped
>

I originally uploaded the key to the MTD Key Server:

https://pgp.mit.edu/pks/lookup?op=3Dget&search=3D0xBCE5DC3C741A02D1

using the key from there I can verify the tarball on a clean Debian VM.
If I managed to tickle the new Thunderbird GPG support the right way (and
Protonmail doesn't mangle it somehow), this mail should also be signed.

> I also searched at http://www.linux-mtd.infradead.org/index.html and
> could not find a key, could you please point us to a recent version?
>

Yes, that sounds like a good idea. I will look into updating the
website and adding the key.

Greetings,

David

--b1_ciYA4Son1MuKBKCWsbRbc2ld0iGhrUqrMK8eQ80
Content-Type: application/pgp-keys; name=OpenPGP_0xBCE5DC3C741A02D1.asc
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=OpenPGP_0xBCE5DC3C741A02D1.asc

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tDQoNCnhzQk5CRlp5ZjBZQkNBREh5
S2hBQmh4dGhDQzluNDhwdnN1azVwM0lFZFlYTXM4QXBlbmgxTi9aNGNWaUF6L2QNCi9uU0NaK0ZH
RlgvUFN1YkV6cThBaWxaTGVqY2hBbHRhT1JDdkExWTZGZ1RscGNkSjZnSERmU3REYkpML3ZrNU4N
CjhhTDdZTkY3VmZqVFJudEJ0S2JoS2NyRzA1bmJkTmpJaW9BbTA0cHQ5cng1bVY1S01iZjIyL0Zk
WnBPU1NzQzYNCi9ON2IvY0ZIOStmeDhrd2k0cE5GdUp3ckJrV1J1UTdyRXRDb1NwZDIydCtWaDlx
QTdreW1XOWdXWTQwNTI1OGoNCm5ONjVqQk83RWxxVTJDQ3VHUlBnNnVyeUFIVjNSVkNCOWo5QUUz
SExhY1FSZUZ0dDV5bHl5ZFNRYmFLNEs5YXMNCm5kN1UyL0MxMXZJdXVjaVhDcHBYNGJQYXAvcE1u
R3B6dzBVTkFCRUJBQUhOTjBSaGRtbGtJRTlpWlhKb2IyeHMNClpXNTZaWElnUEdSaGRtbGtMbTlp
WlhKb2IyeHNaVzU2WlhKQWMybG5iV0V0YzNSaGNpNWhkRDdDd0hjRUV3RUkNCkFDRUZBbFp5ZjBZ
Q0d3TUZDd2tJQndJR0ZRZ0pDZ3NDQkJZQ0F3RUNIZ0VDRjRBQUNna1F2T1hjUEhRYUF0RnUNCkVB
Z0FyWE9oYW9hVnZDTVZDYTVOMjVRLytRNksxd3JWcFBta0g4OXloUXFDbWZNNmYrMlZNNU1HRkRQ
ZmFTSjMNCjVmQkRIMGl3QlF3bFhJYjdOU1hXdHpkWFg5ck12SmtKcXY0NVRnZUt0SkFwZi9zUmht
Y04rY2xyd3pQOG9aUWINCnhrUDFZV3pvVndvNGxPYjNLdjdhWTl5ZUNqcU5iZEpKNTdOcHZZT1Vy
enJDcEdrckRQQkJRT3ZLRjN3YnEzb1UNCi9vM2RUMjNORGVRMjBqWGdxdUpmL1BDdzZXQ3pSeHFn
NTh3SDAyTWRNRFFlOHZCeXpWaWcyYk0yZTdERXJ0dCsNCmhQSy9EbWRzcWducytaK1NyUWNPdlJh
M0dNQUhBdUhCMHUyTGhZTzZOeWFOQ2d6ZGd1dG9yaWxZY3E3RkVLcjgNClhxd09uZlZtWmRDVzNx
R0ttTGJuNnFNRWRNTEJYQVFRQVFJQUJnVUNWc1docFFBS0NSQm0rVm1GNnhpN3dWV1UNCkVBRExo
K0IrVnkrMzd2SjQ1ZTRmUVhTQUo4ejRyQlVrZ1AzU2REeFRLamwwNUZGRHVLaHg0NmJ1TkxuU2tt
QWwNCmYzOXRrcFJOdityMmlXS09QR01kVm1uYlNvTGlrNlU5c1J3WVZqUjRwUHVQanJtUldCTkhw
Tml2TWlrL3VPRmENCmtUcFAreE1ibk1rM3h6YWxsRkRJcndxaWNxYlVISzF1RkQvdk1NYjR1ZXVX
R3ZvTWtMZzZGM1VGMzVhcjBlQnUNCmJoSm5hZG5TMHFLN29vTVZCVUZhK0RSMmF1ODg1ZUk5ZXB5
Z1RjK1dpd2c3QkFVbjRtbldNQzRvRlJCdTRGcFkNCk1jVE5Yd2RjQ0xQSE5Gbk0xWElwcW5BaGRE
V2xsZjM3dzNTcyt4NVhNZzhFSVdLNGhKdk4rNU90TmtPeERwWGUNCk10QVRYWlozd2V4b0V3R2RI
OVhrc0pjMnp4Ym4yZVNIUUh2TFNwdTFXdjBLdW1MMmRKSTZzNDlNdWd0OXRBTk8NCktaelJ0RG5a
eGwzYW0ySVNRVzJ3clUzMmk1cEw4Y1RLcTVMZk1SMS9OQjU3RDZleUdaT1RNOW1UeCtoNXRja2oN
CkxuYjQ2QjNUYzh3NFgrRnlRZVZjRXlYZ2tpV1ZNendwcU1TUzEvZWw1Z3hrSVBjVHFwQXVLSmFa
SGtVaXpOYWoNCitJQ1pTVHNvcWs0RkZLN2p0dmd5NFFQUE5ITGFuaEJGdFVOT00xQzIvckJDaUx5
UkFEQkJGeitEL3dqVTNpVVYNCnBuamUyVGFGR3N1TmFCRENzREJON25xd3lmbGdBWjBoZTNPdnJC
VndvU1pyL293TWttWUd4d2JLV3A3cHhBZU8NClRTQWVaY2FIMG1ZQVFwelNlT2lDTURaTDBlOGQ4
VjFuNzQ4ZjRLN0NuVWRTQjg3QVRRUldjbjlHQVFnQXZ1Z0YNCjhjRmp2MlpzNEJCYjQ0U254R2F3
QnlTQzFiTVJhcy9NakE5RU1IVUF4L1N0Y2VjUW14bmw2QnpFeUdwcitUUm4NClhJemNiNXhJOFN4
aXRCRFU1TUx2d3NIZ052cFlwOWZzY2Q0a1dQN29NaXI5dGEzUThTdlQ0T0xiTzRGWkJHYVUNClJ6
R1BhazhKbWpNTXRPb09CaDRtZU9qejZHckplOVVJR3hUOTRhQjAxdzdZb2hmQkFOeks4eHlrNHlr
S0M1T3ANCjRYZ2FhTUtPRVFVYWg3d2FqY29qWVNsdmdPaVhxRWlzTUhsUkRBVzZzWEwyc0VNN1RJ
cHZZaHk5dHhNTGxscGsNClliMFB1MUJ2VXBZL3Vuc3liV0tBRnlpVG1laVkrbkV2ZVV2cVg2RWY3
QldkQ2xCZUNrMlVhUnZ0Y29MZDIyVngNCk1sS1RuaUhRY05NT1hsUlJhd0FSQVFBQndzQmZCQmdC
Q0FBSkJRSldjbjlHQWhzTUFBb0pFTHpsM0R4MEdnTFINClB0Y0gvakQ2cm4yK1ZJS2dySGR0M2Fv
M0FicHUyZnFZZndiSXlQQXRwWE9kZERwdFZxKzBBLzJhclhUMVk4K2oNCk5TWnBiQWc4SytiTGFF
QWNTVUVqdmlLTXBmSTdwcFRVQnVHS3JwZ2M1eHNpVXBLa0pDYjdvQjFacmFJQk5CUHQNClBQVlVo
YndMaWU0dVcvTFZ0KzhyQkt6M1c5S0VET3NUMFpDRy9wVzhMZCtFcERSOWwwZm1xb1ZIYXc4UGhM
QXQNCmV6K0I3SFM3SHY3aUpQRHRYODVrRllwdWQ4a0lQRU5YVm45RWpadWR5TVdnWmIyTGhZbGNh
dk5jc3pnUjdJbjYNCmlmdDVTTnlTb2pDT2ZBVjBpS1piOFFVWFdrdExsZVk4a1E4amx0T3NTUlR1
TzRQRGZ6dnRDUURpeFV3NHRRN1cNCkx3RFRxeVVwb3Qwb0cwM3Z0U0c0TElSQ2R4ST0NCj1VLzll
DQotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0t

--b1_ciYA4Son1MuKBKCWsbRbc2ld0iGhrUqrMK8eQ80
Content-Type: application/pgp-signature; name=OpenPGP_signature
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=OpenPGP_signature

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0Kd3NCNUJBQUJDQUFqRmlFRUV3WS9janll
V0VycXpWdWJ2T1hjUEhRYUF0RUZBbUhsQ0hjRkF3QUFBQUFBQ2drUXZPWGNQSFFhQXRHdA0KWFFm
OUVMeW1EcnV5dDRrRGsxYXUvM0RSWk9HY3g0Mi9xWUhPalNDNVg3MTExdTZxTkZIQ2Rrck5TT2dN
dzNsdnByb2h0MkdiN295Lw0KbWNVNi9GUmIvZy9GdFJPZTRHc3hDTG50ODV5N2ZoaEg2OStkaEsw
bGJmVVdxNnRqQU9HMy9Nd1ZqWGpqeVdYWm5DUlVZWmpNUW5pUw0Kbkg2bnBtZStxWkZKZXErbFRL
WnFiT015dUkzYmxuZGZTUHNhb2NNazBCVXZ3SHZDVWhSNVVSSmUvU0k0N3FRUVU4aXNhcGpieEZU
Rg0KNXE0Rm8yRGtBck5yakZrM3J2RUVST1FpVXBLa1MwQWJ0d1pWMlFGUGx6Yk9NWlU0WW5KZ3Qy
L3dINnZiRDdPOStjQWE4M1crZGk4Mg0KRXlteEhIYThhc2lwVFQzQ0lzWThlV0cxbSs2bnNwcVJR
YkU2dnpCUzlBPT0NCj00WDJDDQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg==

--b1_ciYA4Son1MuKBKCWsbRbc2ld0iGhrUqrMK8eQ80
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--b1_ciYA4Son1MuKBKCWsbRbc2ld0iGhrUqrMK8eQ80--

