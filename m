From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Nov 2014 22:58:55 +0100
Subject: [Buildroot] [git commit] qemu: fix build when python3 is enabled
In-Reply-To: <5457F97E.7050509@mind.be> (Arnout Vandecappelle's message of
 "Mon, 03 Nov 2014 22:54:06 +0100")
References: <20141103214423.CD179B175C@busybox.osuosl.org>
 <5457F97E.7050509@mind.be>
Message-ID: <87bnoo2bfk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 03/11/14 22:37, Peter Korsgaard wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=1d21e4c397cbd92d03d09daf4fadffaa79959f55
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/04e/04ec455e352319a46dc06def1762c65ad28a12a1/
 >> http://autobuild.buildroot.net/results/f19/f1932657912674af444602ac59211b6caf6841ca/
 >> http://autobuild.buildroot.net/results/18a/18a43df80616280506a44ac3abc327ddf0e7b079/
 >> http://autobuild.buildroot.net/results/44c/44c00b50248018c4e81f4fbb1041d35b78f89640/
 >> 
 >> And many others.
 >> 
 >> When python3 for the target is enabled, $(HOST_DIR)/usr/bin/python points to
 >> host-python3, not host-python - Breaking the build. Ensure host-python is used.

 >  There's another potential issue like this in dbus-python, in python-pypcap and
 > in samba4.

Ahh, ok - Do you know if they all need python2.7 or should we just wait
for the autobuilders to know?

-- 
Bye, Peter Korsgaard 
