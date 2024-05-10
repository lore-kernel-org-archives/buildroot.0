Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD02C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 13:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F38E424C9;
	Fri, 10 May 2024 13:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTW-hrqXMzLY; Fri, 10 May 2024 13:26:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CF39424B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CF39424B6;
	Fri, 10 May 2024 13:26:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 004111BF360
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 13:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E103C42AE5
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 13:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uz6KBT5QXYCc for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 13:26:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D699242ADD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D699242ADD
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D699242ADD
 for <buildroot@buildroot.org>; Fri, 10 May 2024 13:26:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.48.46]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGr8-1s62Sr16tS-00Vhpb; Fri, 10
 May 2024 15:26:03 +0200
Date: Fri, 10 May 2024 15:26:02 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zj4gahaQITx-QUA6@probook>
References: <20240419-ztext-v1-1-a8d5c2cfcf57@gmx.net>
 <20240509174057.1234e233@windsurf>
MIME-Version: 1.0
In-Reply-To: <20240509174057.1234e233@windsurf>
X-Provags-ID: V03:K1:rtmEv6dr5D3MHG0p+uH96irU1S6Ev4aJs4NaCCRYsQG90vCvVuc
 0WKLkmpZUK1SaVjnNi5IvQPTrYvMUt/kk9Z5fBNcuVxoKpgZd20jBLGoQi6Zo/4TYRw2y4Q
 jS8RQbXTIkdadumr04OTZHFDM6lt/z0Dg5bvFL8tqSvH4b8lD0iazEXLGjItdR3lXR9YDPN
 aQSiOuEZ5xV6aUUt2u4/g==
UI-OutboundReport: notjunk:1;M01:P0:DTYlCRMNJLg=;3I2tOFHGGZLjq3zpbm1mAQ8l3Uz
 itpc860x4Km38LC2L1PW0oR9edrPF6rxU+ctQbwq/oEGf4zB5WnsnedBJvv9tZaJSUZ0G8gq6
 bIvOCZeLzyXF+8/pGhKk1PvRy3w1XaUuVx5dsje/kztLFgwfIOWzkhdHQxkgJkVsEjzsiMkuU
 tFxMl9Xq3sYncrQ36vleJasb1/Ex1pT7JsXwNNk6OCV6k3JI4NqMfsmmTHVnof7ihlxkDupGC
 K4wdGmjp7HVYY/RVBBhy61V50bUEMLTQzeBKey30CeW0ATfIYaHYXav1pQEq2EsuYO6pNdO9v
 rA1lsfDZZCX65PEAV4rsPwWSlE3zsgUya2Drmccl5pS26zEbdkMtAT6HQ8B9j75rM7XqbXngW
 bmp27Q6ZWTI3enkeU4VAwxLRodt90osLSoH83Dp6b0jkeQBm5qmQCbxjeFyph913Iunj7Na94
 7EZ6apIbKbbQJuiuX+GNt236/PPNJmQuv2/sR9vs6QWVl6QmcNlNRDWzXFV8OlLQEkyvLYjBG
 IpEXpQF7k8v26hocPPjO2JUkTFS1mq1Oqq3L8EbH+k0y2FG0pj3EIflYSxjxCLb4BrWjRRZ2D
 xNJc3T7lOi48aR1cnVhc0lUnKuetDLs5lzatNapy8jusVLLLVjyU0VhMu//UupbbH274LfgJ0
 ws42Dud6L+WNOIDnY1TG07jOF3AdWhTsadq9eoHEnPMw8ZRw7qO1Uvd8BrOUjfUNRPH1gqsQH
 v26/bvXF81mTvN1qq2ttC88l/idEcWezjl+ymvw4M4a3TqVLERNvmqStsYcR/cQI5F9VoGQpw
 +AnUj+TSOw1Q6dbHKl4LzA/Dw2bSmArcstev4+SJ69DMQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715347563; x=1715952363; i=j.neuschaefer@gmx.net;
 bh=jlOJHvScah3P4P7oe4Vd6xjXTVgOM6aPHXBiD93siis=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=heY8dWODkU8jk8ErUwc01yW6wY8vk4PmtXTvEUL3yxyadYooykl3bL95ASb+0Af5
 tFHykK6WxMsl+N7kjgzXJhhNS3VuC9MSQwJLjO8vh8PH3J4fODzbAyxIB2luoB3Vi
 i/z2wFv7AUsjj/inmGLX9wyRc2jjzb3nYWoZ4eQ9jFbiiS1cto8BnElAzaXBrZIAA
 aeEbbZ+5HExP2NOPeqLHN0TLElJrg1+ixI/vz4RWj7DQzbCotRHlsAxcANlSyY5Kv
 yPdRuzKksLxreV1mW+lCOxTplJQTrth/EOLzeke2kqZFmoUJhkDlAI0FGGwrE9Z10
 LNJjMDqTYbPc2u0rRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=heY8dWOD
Subject: Re: [Buildroot] [PATCH] Config.in: add option to ban textrels
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8049151425937151124=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8049151425937151124==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K7RXqtuzccipP8CO"
Content-Disposition: inline


--K7RXqtuzccipP8CO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 05:40:57PM +0200, Thomas Petazzoni wrote:
> Hello,
>=20
> On Fri, 19 Apr 2024 16:52:50 +0200
> J. Neusch=C3=A4fer via buildroot <buildroot@buildroot.org> wrote:
>=20
> > Ideally, this option would default to yes when a musl-based toolchain is
> > used, as musl doesn't support TEXTRELs[1] and programs with TEXTRELs
> > will crash on start-up under musl.
> >=20
> > However, to avoid a large build fallout, it defaults to "no" for now.
> > After this option has been enabled in build tests for a while and some
> > of the fallout has been fixed, the default can be changed.
> >=20
> > [1]: https://www.openwall.com/lists/musl/2020/09/25/4
> >=20
> > Signed-off-by: J. Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>=20
> Thanks for the patch. I am not fully sure I totally grasp the issue,
> but I'm wondering if making it an option is really the right thing to
> do. If indeed TEXTRELs don't work with musl, then we should simply
> disable them.

Fair enough. My intention here was to soften the blow somewhat with
regards to how much breakage will be seen in the autobuilders, but two
points run counter to that idea:

- Any binaries built with textrels on musl would be broken anyway, and
  the current situation just hides the breakage by deferring it until
  runtime.
- I'm considering to try an allyesconfig build locally to see what breaks.
  Not sure if it's a good idea though, given the sheer number of packages :)

>=20
> One thing I'm not entirely clear is that
> https://www.openwall.com/lists/musl/2020/09/25/4 states "I recently
> discovered that musl doesn't support DT/DF_TEXTREL in the main
> executable", while passing -z text will disallow TEXTREL everywhere,
> not only "main executable" but also shared libraries. Is that intended?

Hm, that's a detail that I haven't thought about.
I'm not sure if textrels in shared libraries even happen in practice.

musl's situtation is as follows, as far as I can piece it together:

- Version 0.7.12 (released in 2011) claims support for textrels in
  shared objects[1]. The code that added it (in commit v0.7.11-1-g9f17413c
  "textrel support, cheap and ugly"[2]) is still present essentially
  unchanged, but I don't understand how it works[3].
- The email from Rick Felker states it's only for legacy reasons and on
  a few architectures.
- Commit v1.1.9-20-gdc031ee0 ("add rcrt1 start file for fully static-linked=
 PIE")[4]
  states: "all libraries being linked must be built as PIC/PIE; TEXTRELs
  are not supported at this time."

In summary, I think it's safe to forbid textrels on musl in general.


> Do you have an idea of the amount of breakage enabling -z text would
> cause? Which particular package/situation did you encounter that was
> using TEXTREL and shouldn't have in order to be compatible with musl?

I haven't investigated the total amount of breakage. The package that
prompted this change was micropython, which I recently fixed upstream[5].


Best regards,
- jn

[1]: https://git.musl-libc.org/cgit/musl/tree/WHATSNEW#n272
[2]: https://git.musl-libc.org/cgit/musl/commit/?id=3D9f17413c753030811761d=
576fdb95f200bd818d7
[3]:    for (i=3D0; ((size_t *)(base+dyn))[i]; i+=3D2)
                if (((size_t *)(base+dyn))[i]=3D=3DDT_TEXTREL) {
                        mprotect(map, map_len, PROT_READ|PROT_WRITE|PROT_EX=
EC);
                        break;
                }
[4]: https://git.musl-libc.org/cgit/musl/commit/?id=3Ddc031ee0b1ba11baa00cd=
7f0769e461a5f396c71
[5]: https://github.com/micropython/micropython/commit/7b050b366b7dacfb4377=
9c51702a892d8f1873d0

--K7RXqtuzccipP8CO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmY+IEAACgkQCDBEmo7z
X9sQ5xAArhPHhBMq0rnkuMTGoHl7UWCaRsYooXJzKbGHCxOl9clwDDVIvebh35fK
enYskoHlBkdF5pSWuWO7es+qhVXE6mCxl7yL69UXAnyjov/Hbjup+85CnLHYIOBj
31fpjS3QwSoHAqw5f7Kk5NZHE3MMVmEL8ftcCIW06webvbUA4rJbK581OvsFNbyY
shLyLIEyc83qF8WXS0ZtTHeKN6yn2t9x9Tnk4+akfVwX5Y03PJtic6WT/mzqS8jv
nvLn1LKteCwj1ooUEpmSxSx7lZsv/ewEDfHk7w82SgyAJZvrYV8vePFtKR88jCx5
Jq7tthe+8c1pYRzHL+dKxoainSuyqPgmKtvw+kpaDtKfw2ScZ86d2LmpwwW6yIsE
9E6GDYY64r8n3/mauR39/Rls1Wr3ILVsn/M7rAs2l5GxyrNPVCD0/mAdvvRYgsgy
jzOkZPsrhg05yil0pWxhdtQNyEUcglEEcOevCIsoD6063oveNBBZkZ0P7I43psM9
UbR0orF0ay++0J4YKrCoV8awOwL6eQ8aQzIt1egYrq7U4JK+Lql5YgcbWEpzgXEf
/7xGMZQrI2P6/LiNH3jUSQ6DnO1ti8b979GeA/eLPNfTMXTtphBw2waGBlIwQc0G
9fA28VFq+dTObG4qsh8jWQTtMdccBC2yjwzZcouAQMdVjPsAphQ=
=VXB9
-----END PGP SIGNATURE-----

--K7RXqtuzccipP8CO--

--===============8049151425937151124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8049151425937151124==--
