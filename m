From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 23:12:02 +0200
Subject: [Buildroot] [PATCH-2020.0{2, 5,
 8}.x] python-scapy: add upstream patch fixing python 2.x
 compatibility
In-Reply-To: <20201011084314.16335-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 11 Oct 2020 10:43:14 +0200")
References: <20201011084314.16335-1-peter@korsgaard.com>
Message-ID: <87eem4v55p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/829/8293529a72ac4c8e93919b8bc0ea758fbb4bc444/

 > Python 2.x gets confused by rb"string", but not br"string", so add an
 > upstream patch changing the former to the latter to fix a pycompile issue
 > with python 2.x:

 > error:   File "/usr/lib/python2.7/site-packages/scapy/tools/generate_ethertypes.py", line 23
 >     reg = rb".*ETHERTYPE_([^\s]+)\s.0x([0-9A-Fa-f]+).*\/\*(.*)\*\/"
 >                                                                   ^
 > SyntaxError: invalid syntax

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > Fix is included in 2.4.4, so not for master

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
