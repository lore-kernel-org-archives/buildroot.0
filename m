From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Aug 2019 19:01:21 +0200
Subject: [Buildroot] Various runtime test failures on Gitlab CI
In-Reply-To: <20190810135216.GI21314@scaer>
References: <20190810151945.5ed664ea@windsurf.home>
 <20190810135216.GI21314@scaer>
Message-ID: <20190810170121.GJ21314@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-08-10 15:52 +0200, Yann E. MORIN spake thusly:
> On 2019-08-10 15:19 +0200, Thomas Petazzoni spake thusly:
> > The last Gitlab CI pipeline on master
> > (https://gitlab.com/buildroot.org/buildroot/pipelines/75533041/failures)
> > shows a number of failures in our runtime tests.
> [--SNIP--]
> >  - For tests.init.test_systemd.TestInitSystemSystemdRwFull, we're
> >    getting:
> > 
> > Traceback (most recent call last):
> >   File "/builds/buildroot.org/buildroot/support/testing/tests/init/test_systemd.py", line 157, in test_run
> >     self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
> >   File "/builds/buildroot.org/buildroot/support/testing/tests/init/base.py", line 38, in start_emulator
> >     self.emulator.login()
> >   File "/builds/buildroot.org/buildroot/support/testing/infra/emulator.py", line 92, in login
> >     raise SystemError("System does not boot")
> > SystemError: System does not boot
> 
> This one works OK here:
>     [  OK  ] Found device /dev/ttyAMA0.
>     [  OK  ] Started Serial Getty on ttyAMA0.

I was however able to reproduce a similar issue with another runtime
test, tests.init.test_systemd.TestInitSystemSystemdRwNetworkd which
failed because it too was unable to find ttyAMA0...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
