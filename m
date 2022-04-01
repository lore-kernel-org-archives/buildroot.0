Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8C2C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 08:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E988284471;
	Fri,  1 Apr 2022 08:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id seyL1GaHHwPI; Fri,  1 Apr 2022 08:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14C0584445;
	Fri,  1 Apr 2022 08:12:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19CC81BF35E
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 08:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07E06424FB
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 08:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ObmT4bwpSVZ8 for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 08:12:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B4C3424F5
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 08:12:33 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-231-wzJq5MbWP3qrVXdWwX10Cw-1; Fri, 01 Apr 2022 09:12:30 +0100
X-MC-Unique: wzJq5MbWP3qrVXdWwX10Cw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Fri, 1 Apr 2022 09:12:28 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Fri, 1 Apr 2022 09:12:28 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Peter Korsgaard' <peter@korsgaard.com>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Thread-Topic: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
Thread-Index: AQHYRSJozS72cv7q9kGHCbtoXkDsoazatK7g
Date: Fri, 1 Apr 2022 08:12:28 +0000
Message-ID: <2949fa8776db4c96800e1df8e39a8ec2@AcuMS.aculab.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com> <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 <87bkxm2gix.fsf@dell.be.48ers.dk>
In-Reply-To: <87bkxm2gix.fsf@dell.be.48ers.dk>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I used the following small program instead of dd to credit the entropy.

+#include <linux/random.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+#include <fcntl.h>
+
+/* Just writing to /dev/urandom doesn't credit any entropy
+ * so the crng remains uninitialised.
+ * So use the relevant ioctl instead. */
+
+int main(int argc, char **argv)
+{
+	int fd;
+	int len;
+	struct {
+		struct rand_pool_info info;
+		int buf[4096];
+	} rnd_info;
+
+	if (!argv[1])
+		return 1;
+
+	fd = open(argv[1], O_RDONLY);
+	if (fd < 0)
+		return 1;
+	len = read(fd, rnd_info.buf, sizeof rnd_info.buf);
+	close(fd);
+	if (len <= 0)
+		return 1;
+
+	fd = open("/dev/urandom", O_RDWR);
+	if (fd < 0)
+		return 1;
+	rnd_info.info.entropy_count = len * 8;
+	rnd_info.info.buf_size = len;
+
+	len = ioctl(fd, RNDADDENTROPY, &rnd_info);
+
+	return len ? 1 : 0;
+}

Seems to do the trick.
Something that size is probably a candidate for busybox.
Although it does really need to run before udev is initialised.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
