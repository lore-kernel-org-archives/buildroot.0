Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A8CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 21:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D321E401ED;
	Sun, 21 Nov 2021 21:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Hm5yk15EYB2; Sun, 21 Nov 2021 21:58:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EDDA4018B;
	Sun, 21 Nov 2021 21:58:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C35CF1BF3BB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C06CF4018B
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfOrggBh4aLY for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 21:57:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 076FC40177
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 21:57:58 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id u68so9089855vke.11
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 13:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T0b3LKgkC+pVA75rZnneRd1TyMFFgd2PXT+QWDKKoiE=;
 b=CRa5+WhFG2GW+saxDhiXFyD1VJiqKQMqpGje75hZVLKmM4bAumNST3r+nxTIfBh2nl
 ENd4xJoZkIWgjdRrVQghSVohZ7zbys96y55xX6Ll6TFRZM9Ijl1m6MKZMlwbTFjongOh
 PcPy01nZs1+wXzoVztZWEqXxCk13WSS/U/ijsIriU38uqYYUBcjKdJCRKo3bsT1MLgDQ
 nj+mAZCv2aZAOhY3p5OUKs/2Z000AEZ45oNL47mO++YBkF7BNikldrHeCNcqWTNz7a2x
 B02EBCaHbj2XtXlMpsoczN5RTYEPHUZtIJ7OTb1Gl1QXNZsu39xkEJhE7/YiQjJpm1th
 +VWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T0b3LKgkC+pVA75rZnneRd1TyMFFgd2PXT+QWDKKoiE=;
 b=eyDVMH98BhgBI/qEMj4nYaA37BcA/K4fvq0+XhEWs6+vtUEOfX/RBCmguie0TBg06A
 09FOY3HdsstQf0pWZNMK5ikiNwmrC9detneBKQGIbo7TGSP+KOl7WC+6diUSq7TV5fAo
 AklHULyCx7xjdKG8S4hnEico8HGVXqaZo/+qcGx/aRAl+TcfOKTqGz/OAA7jO1NvBEGu
 S6TnwsnocSb/oX+fNvmKX4eIFkp8h5SlRaTfNDTnTaKNGhShTWX0yqIFa2RcvZwL/PLI
 OXt/2GMPXdJ7dPficfB0YV0KlriB/1qrQWGTULaV8MSIDIpHdc2apUkt9vuwR2cZr0jE
 vKLw==
X-Gm-Message-State: AOAM533XNSYI6DTAM+lNh4ZbpahI3e1IwsUQEuhvhh7rYRBemuUsqhQ7
 FwLB1uDSJovYyM0XOyAcxmmOX50XEiA=
X-Google-Smtp-Source: ABdhPJya9lNSr2ckPi7zuDgiW/x+FtrRMXSMGSuB9bmQLNKLGnAZBup0u1fpGQxQjIV15fvWCOZ45A==
X-Received: by 2002:a1f:9041:: with SMTP id s62mr22046033vkd.6.1637531877871; 
 Sun, 21 Nov 2021 13:57:57 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id 62sm3711385uam.6.2021.11.21.13.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 13:57:57 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 18:57:13 -0300
Message-Id: <20211121215713.4167839-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] utils/getdeveloperlib.py: fix developer being
 reported for unrelated path
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
Cc: James Knight <james.d.knight@live.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, by following the instructions in the manual and querying for
developers for a patch that changes path
package/foobar
the script reports both developers that have these entries in the
DEVELOPERS file:
F:	package/foo/
F:	package/foobar/

Starting from commit "afc112b0e4 utils/getdeveloperlib.py: fix issue
with hasfile()" get-developers script uses os.path.abspath() and
os.path.relpath().
The catch is that those functions return the absolute path and the
relative path without the trailing slash.

When the paths associated to a developer are then compared to the paths
a patch touches, using the string.startswith(), any substring returns
True, leading to developers for package/foo/ being wrongly reported
for package/foobar/ .

Fix this by re-adding the trailing slash after using relpath().

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Cc: James Knight <james.d.knight@live.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
NOTICE: this change makes 'get-developers -c' to return more results.
This is expected, since i.e:
fmt has a developer
fmtools has none
jo has a developer
joe has none
openjdk has a developer
openjdk-bin has none
opentyrian has a developer
opentyrian-data has none
board/raspberrypi has a few developers
board/raspberrypi0 has none

Examples of wrong results *before* this patch:

$ ./utils/get-developers -p stress-ng
Romain Naour <romain.naour@gmail.com>
$ ./utils/get-developers -p stress
Arnout Vandecappelle <arnout@mind.be>
$ ./utils/get-developers outgoing/*-stress-ng-*.patch
git send-email --to buildroot@buildroot.org --cc "Romain Naour
<romain.naour@gmail.com>" --cc "Arnout Vandecappelle <arnout@mind.be>"

$ ./utils/get-developers -p atop
Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
$ ./utils/get-developers -p at
Giulio Benetti <giulio.benetti@benettiengineering.com>
$ ./utils/get-developers outgoing/*-atop-*.patch
git send-email --to buildroot@buildroot.org --cc "Ricardo Martincoski
<ricardo.martincoski@datacom.com.br>" --cc "Giulio Benetti
<giulio.benetti@benettiengineering.com>"
---
 utils/getdeveloperlib.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index f2b36862e3..c05e1f888b 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -247,18 +247,20 @@ def parse_developers():
             elif line.startswith("F:"):
                 fname = line[2:].strip()
                 dev_files = glob.glob(os.path.join(brpath, fname))
                 if len(dev_files) == 0:
                     print("WARNING: '%s' doesn't match any file" % fname,
                           file=sys.stderr)
                 for f in dev_files:
                     dev_file = os.path.relpath(f, brpath)
                     dev_file = dev_file.replace(os.sep, '/')  # force unix sep
+                    if f[-1] == '/':  # relpath removes the trailing /
+                        dev_file = dev_file + '/'
                     files.append(dev_file)
             elif line == "":
                 if not name:
                     continue
                 developers.append(Developer(name, files))
                 files = []
                 name = None
             else:
                 print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, line),
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
