From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Mon, 30 Dec 2013 10:12:06 +0200
Subject: [Buildroot] Analysis of build failures, december 26th
In-Reply-To: <20131227103511.2c218d17@skate>
References: <20131227073009.1283F101A83@stock.ovh.net>
 <20131227103511.2c218d17@skate>
Message-ID: <201312301012.06244.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 27 December 2013 11:35:11 Thomas Petazzoni wrote:
> >    aarch64 |                qt5script-5.2.0 | NOK |
> >http://autobuild.buildroot.net/results/5d455148cfee5b804d38822386e03ee306
> >1ac15f/
> 
> No support for AArch64 in JavaScriptCore, if I understand correctly.
> But wasn't the Javascript interpreter changed with the removal of
> qt5jsbackend? I'm not really following between the Javascript
> interpreter used by qt5script, by the qt5declarative stuff and by the
> qt5webkit stuff. Are they three different Javascript interpreters?

There is a bug report[1] for AArch64 with a patch for Qt4. I have started 
watching it. 

qtscript has an old copy of JavaScriptCore directory found in qtwebkit. 
qtdeclarative has stuff from v8 project; but it is quite different from 
others. None of these packages have support for AArch64. We must disable them 
on AArch64 until the bundled javascript interpreters gain support for this 
architecture.

[1] https://bugreports.qt-project.org/browse/QTBUG-35442
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131230/adfa7528/attachment-0001.html>
