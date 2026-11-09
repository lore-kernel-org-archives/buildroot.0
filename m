Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3052606A31C
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Nna250Ve
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ED8480EA3;
	Mon,  9 Nov 2026 07:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UeKOOEYrQfMR; Mon,  9 Nov 2026 07:31:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2EFCB80F37
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794209477;
	b=AjEvCD2g35uigyWjPAr7xhXUZvaCi/WVHuH8UrnhgpDoYcn30L6hMgS1Ympu1/ldufPi
	 FKnyVEtmBACTY67KfSSA4w2ytbqIyD9SWjWAccY3Pir2yfhT7BFEnl8MImsZbIhi8PxW1
	 zz9Yw3tuInN6IIGAGgUzLbnWM3nyFLN65qwwQgqt+H6m8LCyDm+NlBIiGo6fsjLrJkk1k
	 ccKWnfn2f5fHHB25C8TF15ZIIAP2yUmZ1yZxww7f/b5vtQAi45dM9nrEy3yWhW50KSoiB
	 2rnnU0x4RaO2+IS8v3cA8UnjEXpfmGKU2pNWSwlceST660XVUCwsd+LZEln17+XzPTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794209477;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:In-Reply-To:X-Mailru-Src:X-7564579A:
	 X-77F55803:X-7FA49CB5:X-C1DE0DAB:X-C8649E89:X-D57D3AED:
	 X-Mailru-Sender:X-Mras:X-Mailru-Src:X-7564579A:X-77F55803:X-7FA49CB5:
	 X-87b9d050:X-D57D3AED:X-Mailru-MI:X-Mras:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=zgQPbSmSvFm5z/G9LTcmm+2SPK1uasOOrqZzU+vU0lM=;
	b=ps1dd9k5A7WOo/dcGucLy4uH0nvYQ5Q7qnkaQCuNUcsj/ZNBAnG+bw2kS0Yu7nssSa9B
	 kjo4RujTemdbzjxR+tdL+u4WlqqdCANeumLPbHR+ix9mkJU/iFDIJ5EXCpS2ltprMMvxM
	 V8851CibkeZvjXpz6IrxxVNLzl0/P5uSl4dkijfORkxPIBGIWgmiyAi1hzk+DrpCss+tO
	 iPTFOdt/kwynltkBKOqiJ22pha6HM2LOh0b4MoW9FLSvhggumFjKK68ad+OHhYLN19H64
	 zgO36V6xlZAK0rj7lzpUY4Sm0JwjA5VBt21cBDU4j6Bu4oYCqwlcKFGUYODN2TvmO+Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794209477;
	bh=zgQPbSmSvFm5z/G9LTcmm+2SPK1uasOOrqZzU+vU0lM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Nna250VerqW0++2cCJfSUobAWy0eH/lMJfxMV1NpX5pAf31yvNRZTvDjj/GraF99g
	 UEnpkwy0KiuIjT81mZXrWCql0jqX/Nuge2DwmRRlzJ1jN6P39e7Mb+rxeXdVaRxoeI
	 eOp2N1/IK9PxOTORgcZlgjzAqGE8EK1O5o8kg6/t+ACogoIRucY5D3iDdKEIrruX4b
	 LT8qQDKVD5MfrGR+E60fxdARvYYjFW8/La4mzPMMbVNsVDyyi0KKhm5DtummZkFj/L
	 jkmoU3h32YlgHDsbYJ86svDqUlV00wJocx1l1nZmRaaXw6NPY5hcqG5E6tsEICCM33
	 NG4HF/rZEZcjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EFCB80F37;
	Mon,  9 Nov 2026 07:31:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60D60361
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 07:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F25A6060C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 07:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3vJjuWPWBAH for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 07:31:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 40ECD605DA
X-Greylist: delayed 982 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 09 Nov 2026 07:31:13 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.101;
 helo=send262.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send262.i.mail.ru (send262.i.mail.ru [95.163.59.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40ECD605DA
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 07:31:12 +0000 (UTC)
Received: from [10.113.54.51] (port=37498 helo=send36.i.mail.ru)
 by exim-fallback-5677bfc875-4fvjz with esmtp (envelope-from
 <fido_max@inbox.ru>)
 id 1xQJaa-00000000Snz-1cXD; Mon, 09 Nov 2026 10:14:48 +0300
Received: by exim-smtp-canary-10-75cf684ff8-2gz46 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1xQJZG-00000000GKY-02KT; Mon, 09 Nov 2026 10:13:26 +0300
Message-ID: <242d07bb-173b-47ed-b41b-b88a1ca44af1@inbox.ru>
Date: Mon, 9 Nov 2026 10:13:21 +0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
 <20261107163414.560896-8-angelo.compagnucci@gmail.com>
Content-Language: en-US
In-Reply-To: <20261107163414.560896-8-angelo.compagnucci@gmail.com>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD96F2D5E088614A2372B8D188DC4D6F5CA9E1B962CF22E6E0E182A05F538085040D92D6CF1B0C2A9443DE06ABAFEAF6705E55462985481D0D5A8A0DEF0E8EF60A05BBE4D158D2C583B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DECE8D0A5E25C0FCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2638A93700E3EB3812E070BE324C7D3C470CE40DCF3C884D1BB0A4F435E46E6718B35066C979671628AA50765F7900637CA37C9946A8B9E41389733CBF5DBD5E9D5E8D9A59859A8B6B0E9FD5D4288160ECC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE75A9E79F66F1C28F3731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5CB91567A817EDEDF5002B1117B3ED696A5CAC0C1E8546540484B8D70797403F6823CB91A9FED034534781492E4B8EEAD73D4B72E5887FF4D
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F9677DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6596D46633EDA69C8971D1DD4A8D72A92ED47A555B305FDDD291EE5C9A20C5CAFD5D11AB62CC51119AFB8341EE9D5BE9A0ADDC0486CE802D891A178A424EFB817D5594456211751313152EE4E5D9E54FDA427252D6CE92124317F602240D6CCBEE5D3DA9480BB1E7B08C654B4D7A83FC0F143082AE146A756F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWNJKaIyILeVrl/VZul3y37o=
X-Mailru-Sender: 689FA8AB762F73937C9FA53A4753B313EEA962ADF855AA0CE40F3164A54FA2DB78BDA2C98802EB0490DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B40BAAB6146616B44E42D9C5517B97A7D6512DB9800569ABD9049FFFDB7839CE9E8044873A7BD208C039FCFC37D3BABE17E621D93D4955877BF4837EB4F27D3B69C60CDE70AD4EFF9F
X-7FA49CB5: 0D63561A33F958A54D720F3D9997F8C35002B1117B3ED696ED91A0EB3BD940E7733995DF9B28C54002ED4CEA229C1FA827C277FBC8AE2E8B93B120FAD52BA009
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpLaIlvAR6h4id02YH9mgeCTAyYoNlVO8a3EM/1NVggtcVMnRja0Wm/s=
X-Mailru-MI: 20000080020000000000000800
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH v4 07/15] package/postgresql: drop the
 unused install-world options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

07.11.2026 19:34, Angelo Compagnucci wrote:
> Since the move to meson in cc77be28fc ("package/postgresql: bump version
> to 17.2"), POSTGRESQL_INSTALL_TARGET_OPTS and
> POSTGRESQL_INSTALL_STAGING_OPTS are not used: the meson infra installs
> with ninja install and has no such variables.
> 
> Nothing is lost: install-world is install plus the documentation, which
> is disabled with -Ddocs=disabled, and the contrib modules built by the
> world target are installed by ninja install. Drop the dead options.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
