Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB27C606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m4Yw/k6o
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C53606BA;
	Tue, 27 Oct 2026 19:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fln5tfX0Fds; Tue, 27 Oct 2026 19:46:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BF0256068F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793130407;
	b=V3lRluKSO7O1NeNDSD4BZSLcJrCw2Ht25cWM7CVJC4RrdJj+zOAfNqJiIN38TQsX2O8b
	 LT0LpMiou1R0W17VXf8xpN7l1a5m+VqxS3d8KF6LpvxQVCjt2n6DFcxV+kvET6ZKmPaEU
	 LIkdJpWxuHwf7wkExr65q/fAj4ULwgJSOwr3VlErSLO+YKTXnpXYBWsVweEw7Xwuh01Yk
	 XbFJDDQzurSy3p3tx82+Hz4sn5T5zLwDCkvh3wUE9HVseuTzK4YWYShhTXZi1lBy5vM4s
	 TAnGszWYpoDpSqypFEwsI5aefYPTQInaoAVZShFajbLZrdfZI6Jh9EIrKvkUHnEmDbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793130407;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wC1qAoXsaRTv4vKxYt24PC3EVxh4YVp1uFmCTTpYIAY=;
	b=ExInIHQ2gAJ8wx8bp5pbyKpHD66rEOzv8tkeixBOLJIFOEfQstisLnuhkrrf05mBfkK3
	 fAbX4LgrB5FY5stKj8Hfo9TrNp36Zqvy31Dc4svAoxv3HGIm8Yhi/LzzvH6Flm4JpPjGH
	 C5fckQ3WzvTJD175YbEESAL4ehhqf/qZJM6Nng74/z1smDjfNemhAiQ4shhYeEmHZjpfW
	 YdeNJ6e934POdvxzzjdRLCMnJf9m+pQv+G+2rS28YhzQEWYwVthh6lZWFvaUo77wEyV3R
	 2QrazHc1gV5t4OCAHzgE9evL1nppKA3aAQ5dMo2vtT0vd8PDwj9bXF/2NQIHgz2wzFg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793130407;
	bh=wC1qAoXsaRTv4vKxYt24PC3EVxh4YVp1uFmCTTpYIAY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=m4Yw/k6ox3vb9qa7fBIVY29COgWrrUWJhdNLUqTZPWEFZaxVY7oeK/G8sBJIMcGNR
	 KyBU5ItSyNtlLIXNk87JuWWqu76k89dwrZt8vXvvNC4CUW/XpmGvFK2rqfx9o4z4RH
	 C/ysSYk+xO2nycTTWI7m/+nNatNbxQAIhKubB+GSGskirNoUZjygN1kYf1q5ug/H2I
	 wRH3kUJYWOEbIiIBN81dN1gv2YFCIw8HD8LcIYdcLml2A1D4orEs+9GULJEtnpWY/P
	 hipHI1W/yl4slPHE7Td8O6nD1VoaOZRY8cVljoBNoO9Zqzz+H7zQXrKmJWQ6ZKrYsS
	 u6IrW4nsLmgSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF0256068F;
	Tue, 27 Oct 2026 19:46:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6F12729
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D1EE401B9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uR_Hok0MihS3 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:46:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 20DE14016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793130405;
 b=KrZ6yBYYdtD9Gmngk/l881j/KBYRzg1bj1YygNGpnNfUqT9g0eewI6VHuMoI093qSbyc
 kwbrME0bHolwEJ4wbzsKhxsuSlaFtUU6unSx/9Rnc4jACdYE3HgPhC3jI2yD5lcOI80Lk
 PzDZf1lK03EXhEMGdPbcBrzm6hgcPIMdGKA0sRbcTBs8zYfS827k26Vsu8pM7WRLZ/IVV
 0WHZczT5zn9nYVQI/satZhTd2Z1OwA6uJ5rCOBDo2vYItB45ATZ4erwdZqY2M5Yd5l5nY
 7w4lXfa0JETfpZGovnlkX7m2ku7Mqqa5V42anHznhOYrzhhlFbK0CW6UP5CUZ39TYMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793130405;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=6omrQlbaCfW9EmNg3Jztr7ONowytvSapBM9IoK5iEnc=;
 b=k+pRSpYGRLdAb5PzxRozqWm4Ebn1x3Aa/tnqJfQWLQMemM8D7yA3E2hJzYT6AKZ+HatJ
 p9uiDLG7ceU5H83S7YnUDl2HwXBqaFMNswrnL5XJolQBNDw6PObhh1fkyNkrllFVlNq8J
 vgB0OKT8wFxt7nGxwcVKl0LXzXzXn28JXciPeVIB93SJg3T3vDYBtqaXlR8L/cmsHk5z4
 cpRnZ5QXzDelAZu8l5HE9uxtNEFKdQasvtVTysR5kvi4fI92Zs49YqFuTZf4zsi7K3GnL
 JJ47mWjpdIuGpEHgOjBueKyMhI+T/+2t1vtfnJSTaAZ7HNvvX133hwv4jveiip5DssA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=p+p7g878; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20DE14016B
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:46:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQe9s-1xA9N10KT0-00VQuo; Tue, 27
 Oct 2026 20:46:41 +0100
To: buildroot@buildroot.org
Cc: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Oct 2026 20:46:38 +0100
Message-ID: <20261027194638.2165377-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:FbP3ge/Q5uAReFsV5t/FH5+hGPoZsHiEFqfq5PLuv9bSkn1xu7v
 c+tPFb4ERHj2AB386sq1YdlVl6fYqo2YcEEemAL9yUIRG9EGHwCaeqyUGz28bwd/A1TNgZN
 +HHML1kqjP/Uu8kSaOM3pep/aiYH64oSVID0yheKJZTzsvlHA5jJE+vn1o6vZx9RT9kcRkt
 OClM9E/dO4LCxvuuBKfpw==
UI-OutboundReport: notjunk:1;M01:P0:wAwSLIFPUyE=;9ImG+8O7tjJHUv5pamk4gOS8j6P
 JBvLzdz504MuQS0RzqJSVvyOm9qSNjKtqnXImlhNiWYRim+KdzNGiuYVnjzJ/nH+CJtf+ja7q
 3poSGC+eUk51rtc3dOyladFIz7YbNOT2G/4kHudDu1zXFxw51C/Jy1Hat0V2VcLiXVblle3mn
 QYzhG2WpbTXIabpa9WU5iyqIzM5umVIAPJkHrhub/NVuGYF8Pzhx8GRtWrYQeO9QsIGulsdwA
 b683XARtLwoNJDwNMEtgbA5gxS5FiSXW/tKiiVohs9/rX5lf8P7fi/yhbV9B1hzqz/ZTaL3rD
 V7rqyUsBLoba25IRoFFqEcwKlCpHEno1rbTqhQUOJHBwIdGGM25Ps8mVBwjrVmjxFND0miB2/
 /1E0op7pBQOn9I56fGeAdUBx2oU6XiwWNEOsQIpydwT63srsSUtkLglnryyc+dxt2ELqmwP0L
 RYRRp0uxgiqEiMZ0EpHrCOAOT/35r7R6F8jW7Ap9nUxIdsOGYgz7SJXKZ3mIY/qMbC1JEdqI0
 pDfEoHH6Ftk/EYveyGyDW7W8Fqzld57l6HSJ1EQVGJ1JxiPfPgn9QgumWYU787OW/qH24Ue4i
 Xhjs5tuTnMhsGaZkliShDdlXWOTFTfgpGO8lTOu60x0HqyK23RsU/rfSJYDAfBN26bYOcYO1h
 EPXwi8UtZgW/rdosX0OmG/m8UX7rOK93R/UL4d25eS6ltCJ97w01xkBce3g6WCx5zzi+tE1us
 zKGhP0mn+gxMisbcxDQikPbq8Xhu7zetAL4zyIFF8AnLrJroc4wQLYYKCx5BIrO08YtWn7HwT
 zCJjeZoKjvMobNVds/3eeUBb2cFgZ6hqKzztalVQ1+uBqLJzgcaUqicuxffLZqahBII7Vchun
 Xq4QF8STgPfDn0s1dgW///KIZyLa8RmuHLb0thCOs/x3QamDozOLV6fJMv1CT7qOzeD1bU6ZG
 4DDjHj0nEbHOYuE9zoPqE19NzMXh1Ln6DMoETokCbRuhSETxOAHQPxfc3ZB0iLCA+xDI72oQu
 XAxoYFVcgTiJkgIsmn7XYQrBIkX6xfM325VH+SSS2esJ0jPnqct9/hrv8BEeDhPb0ac267To0
 rM7T0zxkMqEAuYCn9+6YBS18i1UzUR5mu6MPedCWEHubPPF+eJrOAqB/8EwXxatFQUqP4I22C
 2XXK/MlE2hFJ/YLKzvFvJDv+UZ8fWMzfYXLmfmQ/TM6FUzGzVHtGxET7V0c4dQqDm2gp++hhe
 6SxjgH9kmRQGvWWHoUDGPr0O4pNUbS9T2nqfj32pUi20coqg9P3XioHBwGaBhCMqwvw/McXD8
 AD4fiaWSb7XEdJdGHM/6LBtljYlstZi2opkdK7TuYO7nZgGcVRQyDNx5/Y3MVoZ3VNUedHwcT
 U1ovYBr+APSbBpWB9Ao6NPRUiiLylSVUBq4E8ZE0dqFeNRHob0uyI3kl5h8r54dinUalE767a
 1xfXvKfCiuSgfy9Pw2P7rj6akyAaQ/qXlhfQy+qVNic4FLA3BUPPkZ8IPdVqqYzcxdSeCxXjM
 uElNo/zVA+YSFbbndoPczNmvLfjbMIPD5a+d8ZVWsnpsUh0l9XkmL4x7+kOd76raCIXpAym5J
 9Hof/i33r9uN1WWp4w8+vRwWpOzQxkfPzHCrIiEZCIfjXx8ufHHgI0/+mX/8ZzdjkDOcNoONK
 uchmwi3cqGXB//TGk+TPN4rqRYdJfhPe9bqqPy1kqtfL7AEKRYUaauD+qGKtzYzpW8ArIDvpF
 A2XotqxGVwqHpnx6PrA7oA+4T86REE93zBDtDpQXquKmVcRf7Ioe3x826wi27jOCoOPOEquN/
 E+SlKTOiaYO0nqHdIuFXAN/Y3aeJ+5x8kwMuArT6yABRb3cOgYdHLNXCTE4z50mGjXqM+pO3r
 i4zd8lq/7jlaic3Wc6DYempXvKZMZMrP1v4ewLEojx0bDc7lENHBX0VXjGO87ZFNcxL49H+O/
 3pB73rZnZAn3BtF4Vnu+N8+EUrYglU2+EmF2ywm+O1eCNmOX68JpDVUoREGKU3uyhft7SU3FP
 ooCPD4XcMbuBAB2U8sf9YTu1vzf4f1Xz4+yJYP6+FRaV4Fz0FAlJ4OS7loawKORiIhriPr77a
 i5F9MXW3CY6j9KyYncN8EaAFKunOcvAB9ZXrfrdwJd8VvPf1qubft/S7aNw22LwJ9/1G10asT
 ZB/QG18Mxc/TkYG872IeMY6w2NduOYszmj5guQ/UGsH2AoysxEHNMLdhfRfKgtQRmc65xNsmU
 Wxu9va4sIuhXYpEfVItsC8Zgba+5GiE2+omEbMxyn/vcCTbAFx+a83Cyqblr7psRqgtNqgAiY
 gR16MovAtMxTl+eUVHA+FaHs2oY0OckZI+/+krHjTbic3dFz6M7z7QAnYnWD8w8PXiI+M+NjO
 jR2RekkI1K8uqb16Xu0zw4sJZIX9xbGav0othHUjjtHG9BEMEM8APYPK0B2pAilyM5UhZLYfs
 dLYeOHMwV29zOcphdMSs6NODXqFJ29MGeEh/pOu85cFkaQ29XZZ59ANH8gKWbdXxP1Rr/ySBG
 PWIbH8PCneS1TJNyYCTWnLoiuC2pSW9r9TC5EFVVZtW14WuP7LRPhKDSV2Vo03wLMWnXm2nCo
 w1/PP0jpP4Pe1tk0ymJjnPULvO2vhWDkU9uzbuf01zkYeuWjDlqRveOCGhzS9gqj8gpKHyOTQ
 Pqxfi9tl8fZQJMfj8eYNQmCaCdyR083IksXp6yWtGVmwUYnDmgvQ5SuBd34yU8J3RTe3U8w3t
 IYimtTtVrWBj4mJi1qrE14OJHchBpiFzAao2uFvbIgpCRSbJsQR9yJwJIim6++JaX7LceVm4J
 h996CnJ1Z3PyjDO3pRcz658wk66x2+4pcB//mVUBsfOnsE/sh/eVMITErloaBR994mWveBC2/
 NIa0VPFjICHNQ0BdzdrQoJnnzKy15wOf79Un8MBffkcmW90/lAdhIo/l3AkXlVaaR+WXbhroV
 YmgC3KBK5iyJE4IaLIoFjWWKaGILkIDQ6h4OT8ULt4+5rX07OYFvC9/ZCWjjaKSuI+xS5tbL0
 vEIrBG194cdbGvj72wsQw7+7HepAvL25QYS36Adx5a9q74FSEbcEiv4tiDmzOo9606FoVvNFV
 R967pHwtfMwqZrJXCh9u40lU9Q8fQNq5nx6E8B1hfDloMhjduGMWYv0tXTqMOi4itvkYJZsx7
 bVYK5hTICrphmtTLl+pbrx4oxtS0AjkE/i0gx6R298Pgk9rvg0QykY76JsABBnoWWsLTEFsf8
 4qKIDkwwltWjw3kT0O8gYowC3IpCXP9B5Ve9i3ZhgEolfPeVC979FhFoGtEK4lM6XGdjXvdLv
 MSQIYsHgZIDxjA6Is4vAOT1GCag3d6CfQolrudufbDy/VoZPF7jMBKwcZrkAdFX87VNrjiyE4
 PjrTLSZb4yX04qJvFeBNc0qlRjURJbhl5fjCXqEV8QgsbUbi7LRz6fCeV/wFo3lYHpQxeXdg7
 2/1qQWYEWOHn5UIKGw3Yrx4GgjhbHUK7b1wpkiJ2Qr1KwJyyMZcN+hoWuBE45SAQIOg7aJcfH
 ViD8hHV+/CqyIUwxvA71yMF+SMyOq1FoyL6KHftq5bDSsWSnbbsdRetqR3QObjjwqkDYtxvk+
 jaI3OaViAwPcLcbqEQkVbIQ//VvbFhznxinvpm1/kCxn7q/X/LuAUf3K27nVhwfjstwych/ss
 iizSi4kniUaiegcEtNmgougQPS2hCnCsn894d0IFVL+d2jxuinHI664qRTvr69hHY0YwWOgik
 WozGAJNgZEzgL3wJFbTg8Fiqw5pEbP6Q+SZwputf30/7CC7LIxCuSIzBgLRiFulJyE28WFxOP
 b/FvPwmPpJ0RCvJXM1l3DVh/NpwOToboSXS9ru0c35tIv58te6fXwP8R3d3LGSdMP5uAAhW3+
 SmSZtKo6cnBPhmMKuSgA5FsuFz82AJDkjW8YMdXK9YxfPHCwbLNsjA5qvhLBhWPI4Z/agQ+jh
 KGEQ3Ei8aG2QS3pNKhHqnMVdj79modYIqD11mwu7CDuDNz6XY79YRR4sXwLjd3XZxlu2hHbRh
 oBv8sIE29eThAXzLqJAdv8KYTPDDuKMFGoLtJRP+ANz/j87IeJqQpqoSYCJgeuEqYMTKNyUok
 H72pYrRVA1mobg3O4IwiVfn/zeQJdKQlhHSV2IxDLO+Utk4CKRDDHbsVaaMltYx5I0tXkdBej
 LpWWBX1OzRBIjQX4Ta9oSzuh+0un9vXX/hHr8Mt101CoyPTV90CXlv945fCMTlWKfIYJJxNOC
 JnQRcXstU4cM84EUaltvd6bB3iL0TSD5/oiSkAApDEkSTjSw1bP7rv3UH5IFucrhinIHgeGxe
 6aZeAoOaa8d0LRwZHnQ+RpcsJXuabJHDtrjBz684WsWRHXdJHJZLJ9IywEGZ1V6YrfRQs724P
 UMyYGbt2H6HSERjNAZM7avWwjGPsn4gYZnR4rIQ7mK5O/ENI3zq0+xKmywJHvDyycp8CN22wT
 n0JF44TolPpZWOl12B5awPmxQeu5k0Af4hQwEcOECYwT+6kWK4gJ+bJ5hvKCdoqGkNaYKNitk
 Df9nUXeAXaJjn42P/kblb/v81uwCpQFZAeylpos8cPGq6E55eX/GMBAtjrVacvL9wSjxdZ9HK
 NES6Hs4i0SKHNGMce0fDD5I0xBAWslrpkIu/JYD8ij8B3RnqYQGnR1qiYLUmKMbDNc5dc8HZs
 yedZx71oe0efsdeCAj3RaOwurQOoTBvYzigO1Cs7XFWglidCVUZyjS6y58PUsb+ESiWPuDWLn
 969OnlXT5mLIprg+xizTtaxLRYf2uWaVp/Gpdu0gq2SELYmGn5FOyex0lR7ruSaZGEaoRQzZb
 bjYzAgfTx9l1zErxJ+h2nSfoTmFNRXaVQpwVEkWQV4SV0jr6BzwWrs/u1EzHzARHwgu/9UKbp
 1maJ/zctJ2DO/VL2Ik7lOW4z1WWLZvmPutfkKohZ3NhkZjQlACJ50DAk+EnPPvlPBGvGihbmy
 VKChjcbeU8s1GXCZnUD3VtkYm/Wuq9W6yqg9o9lvRJjlvg2j4uavj50Oc0DBMEv8x3S55/BSM
 /LDIBD+UpD+RF3d0+6rT3FO9b909VhlH76lDWv5lWWg77Bfauei1EJlTODTJ6f7Nn68QxcGi7
 DBUbL8Fp++/aPVNgyTDoM2x+7gKlLIJ95VJyGBr9RphbCYvTzKPrBX3NiLfJIiVh/6ecqoI19
 6+bU3unVBvxr85oR+78sjVu6tvr3S/WpPMIxQGP35XUfi7QGfboPfsrcTrrWwyFIAjO19N+M2
 fwY/6yzNgdTWMKjPSchDckZBien7bkjUgP9RRqY7qgvVu7/QhtlFAm5djQxTmgtGQ9PfxBZTq
 4yPyvfGj0Ri6QynNUBhPKePSPurr6l8apPnJEfy6avgIoIiTy7Bz2u2y/BIe1M93rT7OYVyjv
 j+TLYiUDTjmBxYlqQzFh4iwGUBKRXkepB/eET1JLYn3gLrodJvvyCuiSy14RkP/WKfPVYpj+V
 fM0mALPzqrKJzfhSdQtCksFRfgrYSW0OCdyJnUxGza8XFWO/ughCEBqAUJC8XdC2eJ8yuFnmv
 xg9G3n8eBrXegkMmaYvn/ICuwplK3sLvYpUEWjQQw99eXRhzw5WtsCJABdmpZSxrSuNgYgjIR
 dNruyLtKTG2fewx7EUOKB2fUjszz6oEIhAX+JlkPw3ZjMl9LSvagXd8UuUOOf6SaK5kbP05lW
 FkEMf8FnEy+8GXe5P0NCHQfxpwSMtaakawK+cg1CFKMxMmFKqQpxkjQemO4vFJJlFBoWEk13U
 P8ELCgI+/Y7u+QBt74qHUsO2Ec1PKwiDN/andkiaKlKwJ+3cBPHf1o/XBpwGwMi2Bg/HCRclC
 d15BBflKvRp7+0Cu+IoN00FniZS+98fG/4AghhknsJ7R8k54j9d3MMft/SwK59Ejm9UpvVDe/
 U5Ezl2KEBAKWHWLTE9szvucDs0OKwQydbk7fYQhVpZDRgnuP/hXr4WQpQ1spRxFOgf47JrR76
 QiWe/93jHR0Q8qePS9XtQ2Eu9ucHQgp3m3Ytucmx8NQB3PHZlcaI4ezcMPk24kseJcHL579dD
 kyQIow7GdzdfVv/Nz4jaaRQEEaSw+p2jMftJsX1F/eYqkRtiJQ6sb9MSyckk/etXW3C4tWm7O
 8Z4M7EeSM0IoVN2zeKUbkOVo7oCI8beVIHiMiKf8bW+GCPf0sMeW7ksmgMUdsCWiNavRAoLzM
 Jf49VUsyTC9eR8ir38/x8slQ58rAfVzydahe4nw/B1Yynu8QbjUnhdGUCjTFyEBV03jw3ggv9
 4XFgDpqB+aMjg4gyYGhINiHntXUMBIf+w6DATDEXwa7ygrvrHvnNzSElGbsOMgYY6n9ZSAvro
 baluOQmBAYGD7OJKa2jS8On2xQzbFib9wVBghmjM+P4IkeRDszzwEytLw1EiEGx55sdVYMEQg
 MRm7+OXNit6ann5iK4QGc6Q3lzGYCC5E/aNcRtieeRKSWvp8TB0WPRFcnk1QK2aYz7yWsqlOQ
 dnu3ELoKW6ZXSBYy4IBNN9SvOTOU3oJZXLnbY1Qsdr6sHgCvuWgP0iOf9HFSDxxWxkeiXd7gY
 nJCphr1xk9sgLMIEKOH6dZx+c+mf6JUbvlCrOyUJpyz8JxWOs1+bWy/xY9H2jhwmkJ46kjLQz
 L2mIVeJTTcwKref5MBvvwGE3EeBAP0uNuyfnUIkOu
Subject: [Buildroot] [PATCH v1] package/ntpsec: security bump version to
 1.2.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- bump version to 1.2.6 (for details see [1])
- fixes CVE-2026-102486, CVE-2026-102483, CVE-2026-102484, CVE-2026-102485

[1] https://lists.ntpsec.org/pipermail/devel/2026-October/011062.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ntpsec/ntpsec.hash | 2 +-
 package/ntpsec/ntpsec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
index 768ee75a86..4bfe81aaae 100644
--- a/package/ntpsec/ntpsec.hash
+++ b/package/ntpsec/ntpsec.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  48717ea84a8c89bfa082ab5d0dc58b44e6328158632e77d2a74c85b7a509e498  ntpsec-NTPsec_1_2_5.tar.bz2
+sha256  c82f213532d2a5b5e9c368127287ba69a20e3116bc134e64a5c767f7c96565d8  ntpsec-NTPsec_1_2_6.tar.bz2
 sha256  074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff  LICENSES/Apache-2.0.txt
 sha256  991d8a58e0b4be84a174a9bd333a8ca33807a0c1ce6d23a2e25a21f7ece482d0  LICENSES/Beerware.txt
 sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2-Clause.txt
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index 0fa8a3f527..a67308af4a 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTPSEC_VERSION = 1.2.5
+NTPSEC_VERSION = 1.2.6
 NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
 NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
 NTPSEC_LICENSE = Apache-2.0, \
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
