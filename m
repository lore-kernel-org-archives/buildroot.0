Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353EEC25B47
	for <buildroot@archiver.kernel.org>; Fri, 27 Oct 2023 18:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E6084EE7E;
	Fri, 27 Oct 2023 18:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E6084EE7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sFx1IB2Bj5DD; Fri, 27 Oct 2023 18:23:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0FE74EE4D;
	Fri, 27 Oct 2023 18:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0FE74EE4D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93B4B1BF344
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 18:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A4456FCA7
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 18:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A4456FCA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hSW5BXPNy-Ll for <buildroot@lists.busybox.net>;
 Fri, 27 Oct 2023 18:22:57 +0000 (UTC)
X-Greylist: delayed 8862 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 27 Oct 2023 18:22:57 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09D547080C
Received: from 19.mo582.mail-out.ovh.net (19.mo582.mail-out.ovh.net
 [188.165.56.177])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09D547080C
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 18:22:56 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.4.132])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 1BDD82808B
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 15:55:13 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-6x278 (unknown [10.110.171.23])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E85D11FE69
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 15:55:12 +0000 (UTC)
Received: from etictelecom.com ([37.59.142.98])
 by ghost-submission-6684bf9d7b-6x278 with ESMTPSA
 id QU4UNWDdO2UTcAEA2cZ5Ng
 (envelope-from <fabien.nogue@etictelecom.com>)
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 15:55:12 +0000
X-OVh-ClientIp: 81.1.9.132
Message-ID: <514a891e-7d31-4592-b050-d9d9402152cc@etictelecom.com>
Date: Fri, 27 Oct 2023 17:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: buildroot@buildroot.org
From: Fabien Nogue <fabien.nogue@etictelecom.com>
X-Ovh-Tracer-Id: 15952031358855102325
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrleeggdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurheptgfkffggfgfvhffusegrtderredtvdejnecuhfhrohhmpefhrggsihgvnhcupfhoghhuvgcuoehfrggsihgvnhdrnhhoghhuvgesvghtihgtthgvlhgvtghomhdrtghomheqnecuggftrfgrthhtvghrnhepkeeigeetleetgffhiedvvefhudefjeduteehffekheffueekgfeuvdejiefftddtnecukfhppeduvdejrddtrddtrddupdekuddruddrledrudefvddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeofhgrsghivghnrdhnohhguhgvsegvthhitghtvghlvggtohhmrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002110c0289-c65b-427a-93da-d14a9db43f40,
 10AAD37FFF663CF44E05A212DF217F937A11705A)
 smtp.auth=fabien.nogue@etictelecom.com
Subject: [Buildroot] Low performance with python3 compare to python2 on the
 same platform
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
Content-Type: multipart/mixed; boundary="===============3478360548855420583=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============3478360548855420583==
Content-Type: multipart/alternative;
 boundary="------------vwd0s0p1FRwe9Rgb8ksZednr"
Content-Language: fr

This is a multi-part message in MIME format.
--------------vwd0s0p1FRwe9Rgb8ksZednr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

My bad, I create a bug (15832)  instead of sending a mail to the mailing list...

Hello,
We are passing from python 2.7.18 to python 3.9.7 on buildroot 2021.11 and we have a big drop on the performance. On our platform (arm-cortexA8), python3 is 2.5 times slower than python2

Our searches on the internet never spoke about a loss of performance as big as this one.
So we are thinking we have a problem about our python and the way it is compiled, this is why we post here.

We create an image with both, python2 and python3 on it, no other software is running on background, and run the following test:
```
# cat test_python.py
#!/usr/bin/python

import sys

n = int(sys.argv[1])
while n:
         n -= 1

# python2 --version
Python 2.7.18
# time python2 ./test_python.py 10000000
real    0m 21.23s
user    0m 20.73s
sys     0m 0.48s
# python3 --version
Python 3.9.7
# time python3 ./test_python.py 10000000
real    0m 51.39s
user    0m 51.34s
sys     0m 0.02s
```

Our `./configure` are almost identic. And flags used during compile time as well.

We tried python 3.11.5 on buildroot 2023.08.3 and performance are as bad as 3.9.7.

Do you have any ideas about where we can lead our research?

Thank you.

Fabien Nogue

--------------vwd0s0p1FRwe9Rgb8ksZednr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="bz_comment_text" id="comment_text_0">My bad, I create a bug (<span
    id="title">15832)</span> instead of sending a mail to the mailing list...

Hello,
We are passing from python 2.7.18 to python 3.9.7 on buildroot 2021.11 and we have a big drop on the performance. On our platform (arm-cortexA8), python3 is 2.5 times slower than python2

Our searches on the internet never spoke about a loss of performance as big as this one.
So we are thinking we have a problem about our python and the way it is compiled, this is why we post here.

We create an image with both, python2 and python3 on it, no other software is running on background, and run the following test:
```
# cat test_python.py
#!/usr/bin/python

import sys

n = int(sys.argv[1])
while n:
        n -= 1

# python2 --version
Python 2.7.18
# time python2 ./test_python.py 10000000
real    0m 21.23s
user    0m 20.73s
sys     0m 0.48s
# python3 --version
Python 3.9.7
# time python3 ./test_python.py 10000000
real    0m 51.39s
user    0m 51.34s
sys     0m 0.02s
```

Our `./configure` are almost identic. And flags used during compile time as well.

We tried python 3.11.5 on buildroot 2023.08.3 and performance are as bad as 3.9.7.

Do you have any ideas about where we can lead our research?

Thank you.

Fabien Nogue</pre>
    <p></p>
  </body>
</html>

--------------vwd0s0p1FRwe9Rgb8ksZednr--

--===============3478360548855420583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3478360548855420583==--
