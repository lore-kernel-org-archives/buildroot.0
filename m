Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1CF606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=S8nrjEpg
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 250D981136;
	Thu, 22 Oct 2026 21:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYKbKhFGoF7C; Thu, 22 Oct 2026 21:42:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3633F81461
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792705351;
	b=nc0/w+PhT9lRyQdneerrrm8rPlV4AXZbhxRxZMBGMzBVRc5CR+2rgVOSneH+8SnVgfv+
	 Ze471r3FdpLv2HY6KtsmJW5fMUZ7Y1v41G4HXnQ3FcgkbD3OXs4Xb1/heuJYo81U6RLI9
	 zQMJqbjoUMmaeOs/x8wg4PBssWOq8Md4QIEX99ywomi+gdkxoElcEkZhfiXZ05r2BcPcG
	 WjFq+VH+lgQ2q9+TgPqKq6T5Nmd8nSK0PgVGxBL8KQASAUvt9vhXUxdkgQPDftJeIB0aV
	 I5Dv9v3IY6LQAmJiX8M7Sztsz/syEgHOzG3uuGZvoxgmKTEqTSGHjVUUwPrttD3hEoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792705351;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:MIME-Version:Date:X-Gm-Features:Message-ID:To:
	 X-DetectorID-Processed:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Errors-To:Sender;
	bh=9tjMuiiJlPKb+zloak2skQnWuA8hlfgqttnyPBYIAT0=;
	b=Umqx1nrAbys8yRmpF0iDZcCp+cfyddrSLdTwwnaVoJ76zS7OxnUFFfy905UodYV3Z9o+
	 Q12btj9Pm/eWkoVOthLpC0QPuvGHoDFfpP1M7thdJjWjvtDyCgqg6UkAK3kPfEB/bfNcM
	 vy8CUgK7r06myoxe6B4sPYihsyTCZHOoHn3A0B02IY5cfb4EwIHo2rgBZwOaCjuj2UoI3
	 qh6SRAYb6TfVqxGpJJe70wCdtGl3kM51IjYxN6pQtk7eG5wlswP3TZjqcQtUXzPKebstF
	 7ba6D9hxc7IkiS6Wq6ItQSlCluO2rRG+rlIRGKEY0tmBvwbk0X8i53hFOqFk2pJGQMQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792705351;
	bh=9tjMuiiJlPKb+zloak2skQnWuA8hlfgqttnyPBYIAT0=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S8nrjEpgkR07D4EJNFaPu88LigRFL7ShOP0aAUwlFIsWQTzHY6UJYwoSwdB78LuHT
	 L+7JD8CHyGc+pzSQB6DL8WB2WjpkjcBkRLMdRCdT0Wn9LutNd7SEirrMAHvs9H/PwP
	 /szl3HZquQCJOBY/yFphtoXZCZv0KCtioa2hpHG37V47IFBBOvuZ4jEwMhCIEb8E+G
	 wq1Yu1Hpii/56yJBomMRUqsr3k5GmymkiBYor1LlTLaubgkH32ri5CHekKtzg93FAM
	 2fclAELm1JzyK2c80liynvnup65LQHH1wFO+QX+8Kg2W5SpCQVENJzQJ9qFhBde8z8
	 y1G9GkeggnWNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3633F81461;
	Thu, 22 Oct 2026 21:42:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1729B499
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 077BC608AB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giI6xkOZPj4q for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:42:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 789246087B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792705349;
 b=RT9oTSkL4aqCz/ETY5FyDDkbByodliuKVsRPm5hdU2+chAmqSZr1RejqnyzHrE1QSyWw
 BStyeUKR7oVuSYgqgJ2qOA5QCrtfs8W81diEzB5/NNumEUwM+BmBfDX7uivbawLjhFTUi
 ty36H4tNPSU6XtPClQIsOgya3FHiMV0ns1D9gff8bRXQ56kgz4nNHONRksagSSe/kibgE
 ZKb2BHh+ckP3aX/JXvcr8imGYPhiMKhAemaFMFFctJ7U2Rbq4m9ff1EnWfM4GgvDRKWEv
 8Mk+EQkUOUfBVHDgi5sbOmtN4ONLqNlffC8/EhG0f9zh+VT05m9lAS6JUurjW+UdR6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792705349;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:MIME-Version:From:Date:
 X-Gm-Features:Message-ID:Subject:To:X-DetectorID-Processed:
 Content-Type;
 bh=O0BQ3hyR7j+dLE5qBBBMFd31MWRYG/7Rop2C3PKDhAk=;
 b=WXABeLSuXLcfDNmALyrrg7bI7+aoNOuD95FSVcejRFupZoYG6I6QABX/+dD5Pp854LT+
 SvuKp3QKEEfY+W7XnyVk+Fu2+ykQqOm3meVLMY1BBlX4WupKhG5pPSPwFLgd4Pgy9vMcJ
 RrRfJFjyV6zOlQQideCfpDnbk+eSsIfdVtmnxBaArCBcp72Wt6wovyo9xe++xR205ddkT
 5AV7NZ/tGD55DSi05OeWbmmRZjIPU9Gjle7yotp8bBZfyhZW/pWYysQAJHtNH9Qz4FfwM
 ZLQU233o22wp2mphj2sTlpbVy9dUZIxTiARRtj+7lzyLy5OGFW/3VOm6xT9lev0ZJUg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=Ia7zhQsg; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::561"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::561; helo=mail-pg1-x561.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x561.google.com (mail-pg1-x561.google.com
 [IPv6:2607:f8b0:4864:20::561])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 789246087B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:42:27 +0000 (UTC)
Received: by mail-pg1-x561.google.com with SMTP id
 41be03b00d2f7-cc758830601so168475a12.2
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 14:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792705347; x=1793310147;
 h=content-type:to:subject:message-id:date:from:mime-version
 :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O0BQ3hyR7j+dLE5qBBBMFd31MWRYG/7Rop2C3PKDhAk=;
 b=H6Cih6wPUjY51TCx0fvBNTwGXFMke4mi0OKxQ23HWgUDIwfQkw0yc7Ma50pp6bxkYr
 sT5ZxW4M+++Nu0/yxB/mjIPRUWQy8LdVEKCC91jmCdCmtPMS01Hl45aiTeG2CZMexRdg
 6KR/S6NMmqCThkb6GM+dYITCR2AtqAWlexwMIpEN5+ZTYeMJfghnDRGND6Zfra5HXGkF
 FIH5N/Y6x3+AC+q9h4icO1nGqHLx9oHwwUUgBOrBU6ViFvnIed3f//hJAzaXCWXau9Lp
 ynTRznXoil58F4pQAswUKrIxcB+3m6l29Exloqja8as05pxA/w7c/zoHasx/YPGxC5n2
 c40w==
X-Gm-Message-State: AFq9FYJ73Q1IFu/WCWXmceV3Fp2suKN42STVQFFZtVUJ237bcz+I2E79
 BYTh/uCpDyU3TRKW/MDf6eoyvuxxX/V34Bh//YSiOg9wv2CNEW8tRmwOiQWJlxzDPzK8lizgWtN
 5oFO3uLo9eEQz5gdh7mFCn2AOKWK8dc6g3Sz9a1ah8YC5dx356zBewxWhSrZqQrXpWsrB9njAKf
 jDSS0XZ13HHNGhGIPI1g+A16ECwmrRrW0lYfLqMtH6/s+tRVP8FOQEpYVyp1M3ex1HQNp+ZIfDf
 IgISqN3wC03zng=
X-Gm-Gg: AYBFou0T0N7etqh/R1lrUZGS4/gwqZY0ID7w5HWLWgW84Lqw2Ams5p75wXVGof4Y3zz
 VaUsolP5SNRrND1xm5Ch2fYXcl5YtMWqSKntifsLPltTzmaRblk9HpNTwKxWyAus+Jfw5Cji1p+
 qafPCpcFEivM/Lk+IBar+BaWQrTl2ahO2WKRDIO9CreI0u6kckRErB6dRxR+WCb4pqHQGxd6INz
 vH2+6p4PfXT1UVz5gWzaa023W/fHRFAPbkOoUFWRFDGUyvOIanFrAzdWrsMvmp8FFTjrThs+VPj
 I134hRMI7r+ZZiHFoqLKx5Aj4AhIQ1SYokjKKXW6F7JS95FkqTMOFzurq0AZigVLMaU4NJ4vcS6
 dfw+4YFSsFiOLzrjjWZwyD59Hnw0OQSiTv4ZhoIT2jbVBkgTbOsgbeNFCI8SueBULuJNyizsf++
 Jw288XQGUAG3B4mexf4/xLQS2Y9zEaTD6CKiQ=
X-Received: by 2002:a17:90b:394:b0:3ad:ce24:acfa with SMTP id
 98e67ed59e1d1-3adce24ae68mr96553a91.20.1792705346918; 
 Thu, 22 Oct 2026 14:42:26 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adcb1c92fdsm325256a91.6.2026.10.22.14.42.24
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Oct 2026 14:42:26 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-c3f04e0e481so23522066b.1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 14:42:24 -0700 (PDT)
X-Received: by 2002:a17:906:7309:b0:c41:8e21:4d60 with SMTP id
 a640c23a62f3a-c46a8d5e8e4mr78905066b.1.1792705343099; 
 Thu, 22 Oct 2026 14:42:23 -0700 (PDT)
X-Received: by 2002:a17:906:7309:b0:c41:8e21:4d60 with SMTP id
 a640c23a62f3a-c46a8d5e8e4mr78902766b.1.1792705342621; Thu, 22 Oct 2026
 14:42:22 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 14:42:10 -0700
X-Gm-Features: AclHuK_8bX4M3MwCl8BOWpG4HZ2iAZQaLw1OfNC38W-aj_CDcXAIcxpmnPxmiAU
Message-ID: <CAGt4E5sTu_c5K+j58Jx8NXGZccX8PQbyTTZJ3HKt6wktgjYHTw@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] .mailmap file for Buildroot?
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <markus.mayer@broadcom.com>
Content-Type: multipart/mixed; boundary="===============0129256203635115015=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0129256203635115015==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002e5e71065e74bd5f"

--0000000000002e5e71065e74bd5f
Content-Type: text/plain; charset="UTF-8"

Hi all,

I was recently faced with the misfortune that my long-standing e-mail
address dating back to 2012 (mmayer@broadcom.com) was discontinued and
no longer works. Of course, I can adjust my submissions going forward,
but existing patches are stuck with the old e-mail address, which can
be confusing, since messages sent to that address will bounce.

The Linux kernel has a .mailmap file for this purpose. This is a
standard feature supported by Git[1] that helps with remapping e-mail
addresses in situations just like this one. Would it make sense to
introduce this mechanism for Buildroot, as well? Surely my e-mail
address is neither the first nor the only one that has gone away over
the years without the person also disappearing. So my feeling is this
might be useful in general.

What are your thoughts?

Thanks,
-Markus

[1] https://man7.org/linux/man-pages/man5/gitmailmap.5.html

--0000000000002e5e71065e74bd5f
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVWQYJKoZIhvcNAQcCoIIVSjCCFUYCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghLGMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBS
NiBTTUlNRSBDQSAyMDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn
26Zn9VtoE/xBvzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlc
hatYqyORVBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYj
ytEdvfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk6tmG
71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03lVxiA1xyf
G8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMDs/rWyQ64v3mv
Sa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFkxoGc1ckM8ZoMgpUc
4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7dEW391KKxGhv7MJBcc+0
x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0CLDdMNgoxgkCAwEAAaOCAX4w
ggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQB
gjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsGAQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOFGLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi
1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0wLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
YWxzaWduLmNvbS9yb290cjYwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjYuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yNi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IC
AQCRkUdr1aIDRmkNI5jx5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcn
bHUStur2/nt1tP3ee8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79Y
IgbYWATB158tvEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1
Q3BTNKSrHrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXr
dJPKadpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3uw75
AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKWMI0hL0b4
mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOgOgYL4QIqNULb
5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0q1jXWLyrpgP7Zcnu
CzCCBYMwggNroAMCAQICDkXmuwODM8OFZUjm/0VRMA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpH
bG9iYWxTaWduMB4XDTE0MTIxMDAwMDAwMFoXDTM0MTIxMDAwMDAwMFowTDEgMB4GA1UECxMXR2xv
YmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
bFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDK
RN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEG
xb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndhfuDq
jDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MY
vms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptO
TloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4L
sgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiD
D9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo2MwYTAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUrmwFo5MT4qLn4tcc1sfwf8hnU6AwHwYD
VR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwDQYJKoZIhvcNAQEMBQADggIBAIMl7ejR/ZVS
zZ7ABKCRaeZc0ITe3K2iT+hHeNZlmKlbqDyHfAKK0W63FnPmX8BUmNV0vsHN4hGRrSMYPd3hckSW
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGjzCCBHeg
AwIBAgIMGoBpiBwWw4nLX59TMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYxOTA4MzMxM1oXDTI3MDYyMDA4MzMxM1owgdcxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEOMAwGA1UEBBMFTWF5ZXIxDzANBgNVBCoTBk1hcmt1czEWMBQGA1UEChMNQlJPQURDT00g
SU5DLjEiMCAGA1UEAwwZbWFya3VzLm1heWVyQGJyb2FkY29tLmNvbTEoMCYGCSqGSIb3DQEJARYZ
bWFya3VzLm1heWVyQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
AMRv3xLmKpe4KtMK+84rC9k3QeEqIWLjlbFMxGPy89Igb8Y8dUeA00x0OPSEviqGZ7tI4zwZP/AN
CO6BIthxg6DZxe8QX7fU1/ze/Sfit5oGfwL5pIKbrf+45WC0vcigdGUipnqp8EJDtevB1R6VyX6I
Zwzw44IetO/pVOR4+ccsGluBLOYeCnBYXGVnoxQGlsjd9mt6r9cXEGbXwM3CefzkcZnl3guI4mZ+
QmID/IhGR+pkBsCMJ+m6L8P+EwwzpcLq2HOZDW+bGs4XoKQSVEv35tF8ZZ3tWjN4tJqvBuM47Szz
xfFXu3n8HzhnIlJ3kOtVEouFwXPHqd48PWE2oe0CAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZbWFya3VzLm1heWVyQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUOhY3qGryWd+4u9EfO2uy5VJR
TegwDQYJKoZIhvcNAQELBQADggIBAEYNARwWmBV6+jK7b4Ni6bK4HJYmv+j6oCRxBij6iDZaGi7t
ViT+cW5+6CQx+JH/ZLneBeBBBir+/bPwSVWiGq8+0MY4qmp5/s0OwW6HOlQInfUkRP2rmPXcxXAQ
csa3zZV3BpulKUy5m1xQ0aBPMYOPYM8j8xLjDTGPNLIzcdulWKp1Z3Vkch47t6i+F85X7BNLXStL
QYiiBWWfeVBdnN0lQY4qZzOr/cVzt9ckbbg/MeLn8XLKp6XqDXq4/Wm9zjciCCI6aD3sBhseuHGT
AE53XLDow8sjpLzbuDNuEfWRdMQ2HJ+jV4NdR4ziLEhhffacZ3jyjOXrJukxgRAi7o2ExYBZXGgC
eAbzLptOlSQ2n612ee5XzEcokgO0dJYH2Rw7IJi2C4EkTgAv9tgM5AdNumGesD9Ey9e9wdifHym/
99EUGUsRG6XRN8blWs2TULS+EYIKeZ07ymNC4ORz7WOgbYO0qfoXPmof4PE2ufbdvWtaczaV45Oi
WAsoCFjYD5lF9atG2EbUCp+4//SxcuCE98DJWnEQqywur73mdf6hbrOftTBHjup5FjTqqzRI9Lwc
2+6v81FYpZqF4j1yLmnl4mucGv50e0CCBk3oU9qKyrhe9gS+eeOwqXXfJqpHhHS0qxvIQe6crT5C
P5+fkA6kPvUERR9U3F/kaj2PE9t4MYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMGoBpiBwWw4nLX59TMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAQDEl5
8DeTKLRLNAs8vra1/HRCxjPFxQKpF1KG8nE9dDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjEwMjIyMTQyMjNaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAE7L1eMF5/FyRsKlqFYKU0AIsV9W6ZJi0owf07/VUg
OIan89Fspq7g2l0xQoRy5ED3YLTOCRvQCkyPS7eqOeCD6iVG07YtT3CFRbnrGcRx4HU67TtYn7Ry
K/eUKBkeQMirZSUzpy2Sxa1cnvTu2e8G7HyTQ6aSxyNY9uJaUvVeZ1UJbldu0uuzZbr8E4DKd3Br
0alYpfoAtevV0O3DIrLvVyEZm9sjoEBdBgA1l93kr8c2KwEe3xdk6YM1NCBjSUFTCI4EJjaO0/BU
cHJTXbDkD6WYgfmTyDOhGh0mymCBqnU5ffEk6x5V5eQAa8cwMxDsnktEAjDYRVRSBBtvSU4k
--0000000000002e5e71065e74bd5f--

--===============0129256203635115015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0129256203635115015==--
