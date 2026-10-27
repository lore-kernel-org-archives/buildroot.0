Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14629606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oYh98Ecp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D539B606BA;
	Tue, 27 Oct 2026 20:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8sh95VRWAiy; Tue, 27 Oct 2026 20:46:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0DBD560687
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793133994;
	b=r0ysLk7g3Proes6jgFikSZT866yco6GXeG6oWeP1hzXorxBASe71vEgtKnNhZ0mpKSz0
	 2D/XPFTA76VACNSwBEDngYU2CPkSTUwR/7i8rITFvORYQW6VJ09pQZhgAGM+QtKaS79Ad
	 oc82+zOUxxOpkIZhA+qrmineXffDwTYABiZe+Sb3eGigDnlrI0ikzUB2MNtv0u7coi+h4
	 BljkfVukohr3mHHZKkme5psDq6aRN/kt9O1mk1LSopT6WEj3ws4zn92ClnA33W47vDwbL
	 lbamKeUq30lSDW9Zw4yV6HpblvEj+rC7UNbaRDhC3WAFZiPNAKjverVekkzcgERIqcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793133994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ziPC/HN1BIrt9R0fIYU9zjGn5fwJmlFcrvpBYoxnvNs=;
	b=e/z3TibC7XAIo3COLcTh0sas8EgULL2sjzbEFvypyiCUtUGDTJ1UfG5IajjKRmHokQJg
	 YNEQPvpGZc4iKq1gfLQYdLxpuZ9Qckj+9LGNJQnB+S1/t0g5/PiIi6aW3QTF7WcbfOj0i
	 KvpXpEwTWehqqvcGSYggUDu4Sh3OaI4EIU454rnYKPSYK4Ot/QNNJ7/pJBC3rmeWeGREP
	 1hypar+5yzRcOn9F52614zymLsDMAdmmA3tXDA7awMb0MIPg19TL/hCP/ySGbY6Bp243G
	 znanU7olc1yiJBI6hhZLHOO5rvCBh1ast5QUKPw0Qk5saIQpEuOikRAUCOHp7ePUmsw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793133994;
	bh=ziPC/HN1BIrt9R0fIYU9zjGn5fwJmlFcrvpBYoxnvNs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oYh98EcpdoNAWNRHJzCUdujE3A4iLa/B+1R0O/txz1/w/tDySISF3pAHpFOnHK4X1
	 grbFrwdauWG1/Oyf0KHb8YW6FDLy+DgbeSMBpwOA7Bm2MkEatFc1VnNd2Aw/teGPfq
	 Cenqk3MiF9vI2MbkWB/seqDxV8Kp+P1b1S6aQmbrhqdwshA2gfHxlrL3StoOUXTc3I
	 XOuLNGuL8UpVq0NzJMqWcKBQJ+oNtQqT1yiEg0XzrNRQ8KG7LQHdbhEDO3NdffEHMp
	 N3aEt5QG6/xAvt7d077pCpmIJlecCmM/0LyWRN9tJ1d4SMjfa0jM96RrbkclSfhGeZ
	 Yk4Rzom/ymgHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DBD560687;
	Tue, 27 Oct 2026 20:46:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E23B4BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43EDD400B1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKH0e5n4N4oH for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:46:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C7CF64006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793133991;
 b=j9eLf14IH87TGFKU3tCZ2YTS4aWHf+upsAwFs3gcosPNP44Tb8VHEi/+l5tOnhzyiM65
 QuqI9io/h6TTXTB9C/+PIGJuEgR1tv/aApJbNLDVmPmUeNoIw0ogFPj9wGRnYnOK4o77y
 0Lt9QellJ2Zwqbfm/L+VwXSJOHS1okYrFSUDwNUsq9LyXwWfXtj0T9JYYAK06587jGAr1
 jijOX+EyBVmA2bDF8QkirDJk0hEhBdcwAPgbONSrdk3Xgteqg0Kw615cV7Bla18ctZhSY
 nPiRtMaxIvqi7MaytTdjz45T2j+FByA1EXboe8I09D71TII8fn62OL+sRKR1YPcLcWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793133991;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=V3Wb9whEDnDtc62dhlKJ/C5zVevEDiEEJX+yEdbkgUQ=;
 b=UDRwAvP8Mgz/pBzVYKgOTM3mt8NMi+h6gN5jLs/h16TvNQ+PiZqC/pLydUU2xoZKOOw3
 w7MTqD6wuXDHSpFuE0yLWearb1qKnfQSN/oQ4Kc9V8iX0kZ3Ujo1WcMUgJse8q4jVUU/a
 GxxFyq+KEsWlY7ZCO1xKAG/7fMg+t18VA2H6S1uIu3oW4zKhRhwY5yYCXoWCWmVVVupnl
 cGUDeo88ZAaYb6ew5nxoeJH0nlr85A3EDsjI1yGTvthkdCGOLc7c0SILj7vwHBgvpBSX5
 /v2LbzGhIUc5keWkU1TfDasF98zKID4xQ2peX42gp1aeVYa7RBDBoKxavK++CUEUbiA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=yAyelh0U; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7CF64006F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:46:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 70A1C1A1369;
 Tue, 27 Oct 2026 20:46:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3EBC8603BD;
 Tue, 27 Oct 2026 20:46:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 18E411032907F; Tue, 27 Oct 2026 21:46:26 +0100 (CET)
Date: Tue, 27 Oct 2026 21:46:26 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auENX1oKCkhARuFe@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-10-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-10-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 10/14]
 board/mender/x86_64/post-image-efi.sh: do not prepend artifact name to
 mender image
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 05:40:07PM +0100, Adam Duskett wrote:

>  # Create a mender image.
>  generate_mender_image() {
> -    echo "Creating ${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
> +    echo "Creating ${BINARIES_DIR}/${ARTIFACT_NAME}.mender"
>      "${HOST_DIR}/bin/mender-artifact" \
>          write rootfs-image \
>          --compression none \
>          -c "${COMPATIBLE_TYPES}" \
>          -n "${BR2_VERSION}" \
>          -f "${BINARIES_DIR}/rootfs.ext2" \
> -        -o "${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
> +        -o "${BINARIES_DIR}/${ARTIFACT_NAME}.mender"

I've applied already, but doesn't this require an update to
board/mender/x86_64/readme.txt which currently states:

"""
The mender artifact is created in output/images/buildroot-x86_64-1.0.mender
"""

I assume it is now just output/images/1.0.mender ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
