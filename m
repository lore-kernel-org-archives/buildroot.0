From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Sep 2018 15:55:54 +0200
Subject: [Buildroot] [RFC] testing: add python-crossbar tests
In-Reply-To: <5a8630f052ad0_2a8f13e76e012768@ultri3.mail>
References: <CAGm1_ku_EsWrA-qCxkgg6xe-HkdVLB=x_10BN2fNYDAcKk7eng@mail.gmail.com>
 <5a8630f052ad0_2a8f13e76e012768@ultri3.mail>
Message-ID: <20180917155554.05aa9b43@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Feb 2018 23:16:32 -0200, Ricardo Martincoski wrote:

> On Thu, Feb 15, 2018 at 11:41 AM, Yegor Yefremov wrote:
> 
> [snip]
> > 
> > I've tried this test locally, but it always timeouts. Even if I
> > specify an hour as a timeout.  
> 
> I confirm that here, both test cases fail by timeout, so it should not be
> related to the host.

I applied Yegor's patch, and ran he test. It doesn't time out here.
Here is what I have in the TestPythonPy2Crossbar-run.log:

Welcome to Buildroot
buildroot login: root
# dmesg -n 1
# echo $?
0
# python -m crossbar version
Traceback (most recent call last):
  File "usr/lib/python2.7/runpy.py", line 174, in _run_module_as_main
  File "usr/lib/python2.7/runpy.py", line 72, in _run_code
  File "usr/lib/python2.7/site-packages/crossbar/__main__.py", line 36, in <module>
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 479, in load_entry_point
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 2703, in load_entry_point
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 2320, in load
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 2343, in require
  File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 782, in resolve
pkg_resources.ContextualVersionConflict: (txaio 2.8.2 (/usr/lib/python2.7/site-packages), Requirement.parse('txaio>=18.8.1'), set(['autobahn']))
# echo $?
1

So it doesn't work due to some dependency issues. Is the timeout
problem going to appear once those dependency issues are solved ? Or
should I have already seen the timeout ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
