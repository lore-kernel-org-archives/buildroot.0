Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33737C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC26360F2B;
	Mon, 18 Dec 2023 18:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC26360F2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftFqpLfkR7cO; Mon, 18 Dec 2023 18:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEC2A60F31;
	Mon, 18 Dec 2023 18:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEC2A60F31
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2D61BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EE3841685
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE3841685
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M73WWrLeoNdI for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:31:50 +0000 (UTC)
X-Greylist: delayed 569 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 Dec 2023 18:31:50 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD2341523
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BD2341523
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:31:50 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Sv7TN5Wsgz9sbC;
 Mon, 18 Dec 2023 19:22:16 +0100 (CET)
Message-ID: <7f309df0-ae17-419b-8bca-c52d9ec48442@lindra.de>
Date: Mon, 18 Dec 2023 19:22:14 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231212160112.94272-1-hypnotoad@lindra.de>
 <20231212160112.94272-2-hypnotoad@lindra.de>
 <20231217230704.003200c7@windsurf>
From: Ralf Dragon <hypnotoad@lindra.de>
In-Reply-To: <20231217230704.003200c7@windsurf>
X-Rspamd-Queue-Id: 4Sv7TN5Wsgz9sbC
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1702923736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z0y7IkHQsmaZTa5PguXWKfombRoYWKc7viD6prR2gi4=;
 b=Ah97vZIrBV4TkC4iqt1h9Rm6czQ6wBerRHeH5enrfH/hjcNhq0w9al5Px5N2ZEtc9UITEv
 Ep+yC9noaZ6Ms1OLaG6ghQKePhWUPYKRPTAH+N+fkJyX2PDvS4H3rr6oPAbORQKQIk2MiW
 a8UR+QhcTd0JNbviPqoz5e5TVYGPUtufEv+GsgFzEwR7ptc1prEF0/xcH174FtK2cFNLAq
 3zRcrVR3IrI1foEOoy2TkVcLiO3S5/lMoUPEmm6+o+Lypz2y6kixy8CFwgiqwjDzjz9HRq
 cbQZKapuDuyPBXl6vHaTmAlM+0PR9QLEkk7iQb94SGpc6SQP6cl/ije+nyA/ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=lindra.de header.i=@lindra.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=Ah97vZIr
Subject: Re: [Buildroot] [PATCH 2/2] python-qt5: add PyQt5.sip module
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
Cc: Julien Olivain <ju.o@free.fr>, gwenhael.goavec-merou@trabucayre.com,
 yann.morin.1998@free.fr, asafka7@gmail.com, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7936397088694055920=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============7936397088694055920==
Content-Type: multipart/alternative;
 boundary="------------sdekewnaVlUIo0dkQ6Pdqch2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------sdekewnaVlUIo0dkQ6Pdqch2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Thomas,

> So it means that python-pyqt5 requires this new python-pyqt5-sip
> package? How come has python-pyqt5 ever worked?

It worked for our community firmware [1] in a buildroot release from 1-2 
years ago. When we switched to the 2023 release, we had problems, but I 
could not imagine that it was a problem for everyone. I think that 5.11 
changed the location of the sip module to PyQt5.sip [2] and required 
building that in a new module (the build instructions [3] do not say 
since which release that was needed):

[1] https://cfw.ftcommunity.de/ftcommunity-TXT/en
[2] 
https://www.riverbankcomputing.com/static/Docs/PyQt5/incompatibilities.html#pyqt-v5-11
[3] 
https://www.riverbankcomputing.com/static/Docs/PyQt5/installation.html#building-the-sip-module

> But, but, according to what you described above, it seems like
> python-pyqt5 needs python-pyqt5-sip, but here you have a
> python-pyqt5-sip -> python-pyqt5 dependency.
> So with your patch applied, it's still possible to enable only
> python-pyqt5, so we would still have the failure you're mentioning in
> your commit log.
>
> Could you clarify?

Both can be compiled independently (when I wrote the patch, I assumed 
that PyQt5.sip can only be compiled when PyQt5 is available, but it 
really seems only to depend on the sip library). During runtime, PyQt5 
does not work without PyQt5.sip, but it seems that PyQt5.sip can be used 
without PyQt5. That is also how it is modeled in Debian 12.

So correctly it would be: python-pyqt5 needs python-pyqt5-sip during 
runtime. I would model that with "select", not "depends on", or?

> Also, it would very, very good to add a runtime test case in
> support/testing/ for this, as such Python issues are only visible at
> runtime. I have added Julien Olivain in Cc, who can probably help with
> this, as he is our resident expert in writing support/testing tests :-)

Just python3 -c "import PyQt5" would probably be enough to reproduce 
this error.

I will push another patch with the dependency clarified and the other 
comments.

Is it possible that both patches get integrated into the 2023 lts branch?

Thanks,

Ralf


--------------sdekewnaVlUIo0dkQ6Pdqch2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p> </p>
    <p>Hello Thomas,<br>
    </p>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20231217230704.003200c7@windsurf"><span
      style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap="">So it means that python-pyqt5 requires this new python-pyqt5-sip
package? How come has python-pyqt5 ever worked?</pre>
    </blockquote>
    <p>It worked for our community firmware [1] in a buildroot release
      from 1-2 years ago. When we switched to the 2023 release, we had
      problems, but I could not imagine that it was a problem for
      everyone. I think that 5.11 changed the location of the sip module
      to PyQt5.sip [2] and required building that in a new module (the
      build instructions [3] do not say since which release that was
      needed):</p>
    <p>[1] <a class="moz-txt-link-freetext" href="https://cfw.ftcommunity.de/ftcommunity-TXT/en">https://cfw.ftcommunity.de/ftcommunity-TXT/en</a><br>
      [2] <a class="moz-txt-link-freetext"
href="https://www.riverbankcomputing.com/static/Docs/PyQt5/incompatibilities.html#pyqt-v5-11">https://www.riverbankcomputing.com/static/Docs/PyQt5/incompatibilities.html#pyqt-v5-11</a><br>
      [3] <a class="moz-txt-link-freetext"
href="https://www.riverbankcomputing.com/static/Docs/PyQt5/installation.html#building-the-sip-module">https://www.riverbankcomputing.com/static/Docs/PyQt5/installation.html#building-the-sip-module</a></p>
    <blockquote type="cite" cite="mid:20231217230704.003200c7@windsurf"><span
      style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap="">But, but, according to what you described above, it seems like
python-pyqt5 needs python-pyqt5-sip, but here you have a
python-pyqt5-sip -&gt; python-pyqt5 dependency.</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20231217230704.003200c7@windsurf">
      <pre class="moz-quote-pre" wrap="">So with your patch applied, it's still possible to enable only
python-pyqt5, so we would still have the failure you're mentioning in
your commit log.

Could you clarify?</pre>
    </blockquote>
    <p>Both can be compiled independently (when I wrote the patch, I
      assumed that PyQt5.sip can only be compiled when PyQt5 is
      available, but it really seems only to depend on the sip library).
      During runtime, PyQt5 does not work without PyQt5.sip, but it
      seems that PyQt5.sip can be used without PyQt5. That is also how
      it is modeled in Debian 12.</p>
    <p>So correctly it would be: <span style="white-space: pre-wrap">python-pyqt5 needs python-pyqt5-sip during runtime. I would model that with "</span><span
      style="white-space: pre-wrap">select", not "depends on", or?</span></p>
    <p></p>
    <blockquote type="cite" cite="mid:20231217230704.003200c7@windsurf">
      <pre class="moz-quote-pre" wrap="">Also, it would very, very good to add a runtime test case in
support/testing/ for this, as such Python issues are only visible at
runtime. I have added Julien Olivain in Cc, who can probably help with
this, as he is our resident expert in writing support/testing tests :-)</pre>
    </blockquote>
    <p>Just python3 -c "import PyQt5" would probably be enough to
      reproduce this error.<span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">I will push another patch with the dependency clarified and the other comments.</span></p>
    <p><span style="white-space: pre-wrap">Is it possible that both patches get integrated into the 2023 lts branch?
</span></p>
    <p><span style="white-space: pre-wrap">Thanks,</span></p>
    <p><span style="white-space: pre-wrap">Ralf
</span></p>
    <br>
  </body>
</html>

--------------sdekewnaVlUIo0dkQ6Pdqch2--

--===============7936397088694055920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7936397088694055920==--
