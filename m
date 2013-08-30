From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 30 Aug 2013 10:31:44 +0200
Subject: [Buildroot] Build reproducibility
Message-ID: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I noticed a problem with reproducibility of build. If I list targets 
(using make show-targets) on Fedora and on Ubuntu, targets are on 
sorted on same orders. Indeed, result of $(wildcard *.mk) are not 
the same on these systems. 

It seems Make does not sort anymore result of wildcard since 3.82: 
http://comments.gmane.org/gmane.comp.gnu.make.bugs/4260.

Following patch should fix problem.
