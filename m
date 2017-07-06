From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 09:08:21 +0200
Subject: [Buildroot] [PATCH 2/3] testing/tests/package/test_python:
 refactor to support better code reuse
In-Reply-To: <ba95e326-7229-d4a1-3e1c-b4aae54a4f5d@mind.be>
References: <20170704185807.27189-1-andrew.smirnov@gmail.com>
 <20170704185807.27189-2-andrew.smirnov@gmail.com>
 <20170705125959.09d059bc@windsurf>
 <CAHQ1cqEHAaVa5rp=gJ=UdjQS0LMc2iaESjB=gftux9Ar3UQ=TA@mail.gmail.com>
 <ba95e326-7229-d4a1-3e1c-b4aae54a4f5d@mind.be>
Message-ID: <20170706090821.64b4948b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Jul 2017 00:09:10 +0200, Arnout Vandecappelle wrote:

> >>> +    def login(self, timeout=5):
> >>>          cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> >>>          self.emulator.boot(arch="armv5",
> >>>                             kernel="builtin",
> >>> -                           options=["-initrd", cpio_file])
> >>> +                           options=["-initrd", cpio_file],
> >>> +                           timeout)
> >>>          self.emulator.login()
> >>> -        cmd = "python --version 2>&1 | grep '^Python 2'"
> >>> -        _, exit_code = self.emulator.run(cmd)
> >>> -        self.assertEqual(exit_code, 0)  
> >>
> >> I'm not a big fan of having a method called .login() also start the
> >> interpreter, it feels a bit weird.
> >>  
> > 
> > I'll split it in the code into custom "boot()" and "login()" in v2,
> > unless you have something else in mind.  
> 
>  I *think* this is a mistake on Thomas's part, that he thought the login()
> function would boot, login and start Python. I.e., he missed the - in front of
> the line. For me at least it's very natural that the login() function does the
> boot + login.

Ah, indeed. My bad. It's perfectly fine for me if a .login() or .boot()
method does both the boot+login.

Sorry for having misread the patch :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
