From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Sep 2016 09:18:58 +0200
Subject: [Buildroot] Stripping kernel modules for ARC
In-Reply-To: <20160915084753.4717445f@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 15 Sep 2016 08:47:53 +0200")
References: <1473852437.3766.15.camel@synopsys.com>
 <CAE2F3rCBwysRFrMf4CD6uLevvfw0TNaZGyptOj6MLDQvGPPwFg@mail.gmail.com>
 <20160915084753.4717445f@free-electrons.com>
Message-ID: <87a8f9fx5p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 14 Sep 2016 14:29:35 -0700, Daniel Mentz wrote:

 >> I believe there might be a third option where we pass INSTALL_MOD_STRIP=1
 >> to the kernel Makefile when running "make modules_install". It would then
 >> require a change in the Linux kernel Makefile to run a different
 >> strip/objcopy command for ARC. This would contain the details of stripping
 >> .ko files to the Linux kernel build system. Otherwise, we'll have this
 >> cross-dependency between the kernel and buildroot. As soon as the kernel
 >> switches to .eh_frame, buildroot would have to change again.

 > Exactly my thinking. I discovered INSTALL_MOD_STRIP only recently, and
 > I believe we should use it for the kernel instead of having our own
 > logic. This would remove the need for special logic in Buildroot to
 > strip kernel modules, and would leave it to the kernel build system to
 > know how modules should be stripped in an architecture-specific way.

Sounds good. When was this introduced and what about external kernel modules?

-- 
Venlig hilsen,
Peter Korsgaard 
