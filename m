From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Jan 2016 14:16:19 +0100
Subject: [Buildroot] [PATCH] qt4: fix static building if libglib-2.0 is
	enabled
In-Reply-To: <1452724063-12582-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Thu, 14 Jan 2016 01:27:43 +0300")
References: <1452724063-12582-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87twmg1eu4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Here we're seeing another issue with static builds.
 > Problem is Qt's configuration system post-processes output of pkg-config
 > removing duplicate entries. That's fine for dynamic builds - all symbols
 > will be resolved in runtime but for static builds we need to specify
 > explicit and correct list of libs.

 > See more explanations in the patch itself.

 > This patch was sent in Qt's Gerrit for review and could be seen here:
 > https://codereview.qt-project.org/#/c/145967/

 > Fixes a couple of qt4 build failures:
 > http://autobuild.buildroot.net/results/174/174c6e47eb761f9897275b6fedff742ace2f3081
 > http://autobuild.buildroot.net/results/273/273676f1deee986a205b63e92cd6042c29ba1578
 > http://autobuild.buildroot.net/results/4f9/4f92d1316e786d8bb3c16b748f1ab731562540e3
 > and many others.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Lada Trimasova <ltrimas@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
