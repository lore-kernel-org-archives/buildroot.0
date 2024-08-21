Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B04C52D7C
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 13:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8018403CA;
	Wed, 21 Aug 2024 13:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dC6DuYUhmEMz; Wed, 21 Aug 2024 13:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BA214033F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BA214033F;
	Wed, 21 Aug 2024 13:38:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B538E1BF3C0
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 13:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE32680F3D
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 13:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjKY4XryomQH for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 13:38:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66E5680F34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66E5680F34
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66E5680F34
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 13:38:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.124.145]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4s4r-1sfwC72rsl-000blC; Wed, 21
 Aug 2024 15:38:16 +0200
Message-ID: <507c7a96-a19d-409c-ba88-f10844863133@gmx.de>
Date: Wed, 21 Aug 2024 15:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <44f9f8a3-9ebf-4cad-acd8-1b6331581c72@gmx.de>
 <ZsOrdr_Wyujsgqh7@landeda>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <ZsOrdr_Wyujsgqh7@landeda>
X-Provags-ID: V03:K1:awIdqy1w8goFKfRDuielCKB1tYWCx8YGS8Yq2T7Ypex7dphM62+
 uh1M4nHr5zrmZnf1lNwthPNe5000TGZdAc1LeTJW4omv4QPlsPDoqqy/8R7BdmIV3AdNUEA
 WWE4SxHamdCC4L8EGrVDmOwN3fwu/fgHqlJWVvLMQA0l9aQKlf+6eXYj7EzeaNcixqQWo3F
 ifxJd5ew+cFKpjJy9HMGg==
UI-OutboundReport: notjunk:1;M01:P0:5+pylhDVOgg=;mgHZ80XiqkNR/H/wltvafB+qc7z
 FrA2x/a9yYShiPlM33p+kKqaSEAl7muzQHmauHSn5aLEbw2qpSknEP2xAYBTdhcoypqyQ+tnQ
 jS9BQPn0jtbx9PkRmznJfBOpphl12zTCIj67rccle/GbxSlRcfrSfiwKGYyrjWiyWWYDAM3Ts
 zd6maH0gxziWYp6qnS3m3FxwyRsitIeY8jZgvLp2dWROXE4sa+uPWyjOukp0eHpFkXflp5RKe
 eQkd12Ba3wWUnFkiPH/Xkuu5f1XvRs6fp5aYuDE2sv8pUUp5Nz1haicZlTb3deG9Ao9JBOcD0
 bmpNezVFAFdkyGJLHeiDvjGrZfCi82io1XWB5p4HF1P2aTY/elcwSJZ/pkhiVl4yvHRaLM2v0
 7+rueUtisjDbwILijDvWCAXwWV5g4roVILIoqGktJyG6BL5fm/JNEamzh4u1LwUtrT4+t7rJh
 YPMVWjPVXOl+s8IglklgNo1rkaFlW6dqL3A/gUk5cuBlolbGTm2R8u2vim7np2pz2ez+7ce8O
 DaqUHDpc8DFuZbtQvw9yZUJevh2I6isKxeHGKElos9dTGyC/2A7p19wwH3b0TL01aDunN2ac1
 grA5Z8k5vL1zT/6YZebjdg1MJHDhLqyzBVAYGWFbVC8D6t1ClNNmvz3MMatxvPhrRwG76L4jy
 BM4z5RPyeKFgDYQYwoZpz1HTVXdUzMAodUQSz6c+u7QMdbiKw/SNpg8UeuEWtNts6Zw53tgrK
 XKnGPZ5Vi5R9/EaK9/pHPn+4+wqJJryi4fJZQMnu39Lhp8U5aun0vlsYDXOn0BcduXvd5UsQd
 hsG14iTauG7RJNrd2Q7G7cnQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1724247496; x=1724852296; i=fiona.klute@gmx.de;
 bh=CXEbgAut+Yt2gy7NpBLfX2GR5xVq5pLJPqwV7HUu/FI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Vzja53dfeGrwdwpQj3wrVrT21MejpD4XWJVgrs0VgPk686GF5iNr3GyOcBbwof0c
 GlZ2TrzL1HYagbqtjVRCCqWhaGCnQebGiL4k9g6/zybaK/V+cP2oWRqdV+vkM59VA
 LHh2nyiJSGrRUDxMl2IENNo+EhQlf0xu7mPnQSsRDUQsvw5e5Xwk3BKqLMj/T4gQ5
 wHr5y/2BlpBHU0eLDgvYlZj3iH0/dCkBBn57CamKxuQcKm2YSGapYQqXOgOFD/Q3J
 ER8T/wPHIrkt7w8QMs5oSVcdIzraZPJ2AC/8ItLzwZSQSGCquJQ+eF2gf50aatpwg
 3w/NfTFnOZcQqVGC7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Vzja53df
Subject: Re: [Buildroot] GLib/GObject-introspection bootstrap
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, Marcus,

thanks for your replies!

Am 19.08.24 um 22:30 schrieb Yann E. MORIN:
> Fiona, All,
>
> +Marcus
>
> On 2024-08-19 19:52 +0200, Fiona Klute via buildroot spake thusly:
>> I'm currently trying to upgrade GLib & GObject-introspection to their
>> current versions (1.80.4 and 1.80.1), not least because those work with
>> musl without patching.
>
> Not a small task you started there...

Thanks, it definitely looks like that... :-D

> There was was some previous talks about that on IRC, but I haven't seen
> anything materialising so far... Marcus, are you still looking into
> that?

You've probably seen Marcus' separate reply that sounds like a no, and
also suggests a bootstrap package is the way to go. :-)

> So, for the records, here's my suggestion below...
>
>> The difficulty is that GLib now needs a sort of
>> bootstrap process:
>>
>> * Build GLib with -Dintrospection=disabled
>> * Build GObject-introspection
>> * Build GLib with -Dintrospection=enabled
>>
>> Description in the GLib NEWS file:
>> https://gitlab.gnome.org/GNOME/glib/-/blob/17d1bf3c4962d942feea0830aeee6833104fef5d/NEWS#L429-438
>>
>> What would be the preferred way to implement this in Buildroot? Is there
>> a built-in way to rebuild a package with different config after building
>> another package for such situations? Or should I include that bootstrap
>> build of GObject-introspection in libglib2.mk (like Alpine does)? In the
>> latter case the GLib package would share the source archive with
>> GObject-introspection and I remember reading on the ML that there's
>> support for that, would be great if someone could point me at it if
>> relevant.
>
> So, the way to go would be to introduce a new package,
> libglib2-bootstrap, where the no-introspection libglib2 is built.
>
> Then GObject-introspectionGObject-GObject-introspection depends on
> libglib2-bootstrap.
>
> To share download, you'd tell libglib2-bootstrap to share its download
> with libglib2:
>      LIBGLIB2_BOOTSTRAP_DL_SUBDIR = libglib2
>
> Note that there is also the case for host-libglib2: do we need an
> introspection-aware host-libglib2, or can we do without it? If the
> former, then we'll need libglib2-bootstrap to also be a host package.

That's a good question. In my builds so far I haven't had any issue with
host-libglib2 without introspection, but of course it's possible *some*
host package that's not part of my build (or a build that uses features
I don't use) won't break.

That said, having libglib2-bootstrap as a host package too seems to be
the smallest part of extra complexity here, maybe even smaller than
having libglib2 work with/without bootstrap depending on whether it's
building for target or host.

Is there a supported way for the packages to share Makefile definitions?
In end LIBGLIB2_BOOTSTRAP_DL_SUBDIR and
LIBGLIB2_CONF_OPTS/HOST_LIBGLIB2_CONF_OPTS should be the only real
difference (I don't think it'd be very efficient to dig into what else
we could disable in the bootstrap build). The host-go packages seem to
have some shared code, but I didn't get to dig very deeply into that
yet, so I don't know if that'd be a good example here.

>> Also, when I prepare patches, should I just drop the glibc requirement
>> for GObject-introspection, or add musl? I have no idea if it works with
>> uClibc.
>
> Just add musl.

Will do.

>> Likewise, are the checks for (ancient) GCC versions still relevant?
>
> Not sure what you meant here: libglib2 has no dependency on a gcc
> version. gobject-introspection does, however, and I doubt they would no
> longer be releveant; they may even be more stringent. Ypou'd have to
> check what libglib2 anf goi state they require.
What I meant is "Is there any supported GCC 4.9 any more anyway, or is
that check obsolete because any supported compiler version passes?"

If you mean that we should require significantly newer versions you're
probably correct, the changelog for GLib 2.81.0 [1] (so in the current
dev release series) mentions that a C11 toolchain is strongly
recommended now and will become required later, the linked MR mentions
that C99 is currently required. Can I check/require that directly in
Config.in, or would I need to look up which GCC version was the first to
support a given C version?

On additional detail question that I bumped into: GLib requires that
target (or host, in Meson terms) binaries can be executed during the
build when building with introspection. This can be solved with Qemu
user mode:

LIBGLIB2_MESON_EXTRA_BINARIES = \
	exe_wrapper='$(QEMU_USER)'

I have confirmed that build and resulting typelib files work in my
aarch64 build. However, it ignores BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS,
and the Meson documentation states that exe_wrapper must contain the
binary path, there doesn't seem to be room for arguments. Is this
sufficient, or would I have to introduce a wrapper script that adds the
arguments?

I'm also wondering if exe_wrapper might let us avoid the wrapper scripts
currently set up by the gobject-introspection package, but if so I think
that should be a separate patch series after GLib 2.80.x. ;-)

Best regards,
Fiona

[1]
https://gitlab.gnome.org/GNOME/glib/-/blob/3d53902fc39e0ecdd03e5088cd6e009872d62471/NEWS#L105-107
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
