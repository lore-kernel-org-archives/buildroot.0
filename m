From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Jun 2013 09:47:32 +0200
Subject: [Buildroot] [PATCHv3 2/3] Add proprietary libraries for Hantro
	x170 HW decoding
In-Reply-To: <51BCE84D.9070605@free-electrons.com> (Alexandre Belloni's
 message of "Sun, 16 Jun 2013 00:18:53 +0200")
References: <1370945921-23444-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1370945921-23444-2-git-send-email-alexandre.belloni@free-electrons.com>
 <87k3lvxeig.fsf@dell.be.48ers.dk>
 <51BCE84D.9070605@free-electrons.com>
Message-ID: <87y5aawl7v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <alexandre.belloni@free-electrons.com> writes:

Hi,

 >> Presumably this doesn't do much without the kernel modules, so I changed
 >> this to select on2-8170-modules.

 Alexandre> Hum, Is that really a good idea ? I can imagine people
 Alexandre> building their kernel out of buildroot and then not being
 Alexandre> able to select on2-8170-libs.

Well, it's consistent with how we do it for E.G. linux-fusion and the
recently proposed ti-gfx. But if people agree, we could change it to
simply do:

       select BR2_PACKAGE_ON2_8170_MODULES if BR2_LINUX_KERNEL

E.G. you're on your own if you don't build the kernel in buildroot.

-- 
Bye, Peter Korsgaard
