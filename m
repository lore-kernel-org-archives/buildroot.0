From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 20:19:21 +0100
Subject: [Buildroot] [PATCH v4] gst1-validate: needs python
In-Reply-To: <1415908952-4866-1-git-send-email-ps.report@gmx.net>
References: <1415908952-4866-1-git-send-email-ps.report@gmx.net>
Message-ID: <20141122201921.1a07715a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 13 Nov 2014 21:02:32 +0100, Peter Seiderer wrote:
> If host installed python version is < 2.7.0 gst1-validate compile will fail with
> 
> 	checking for a Python interpreter with version >= 2.7.0... none
> 	configure: error: no suitable Python interpreter found
> 
> Fixed by adding host-python dependency.
> 
> Target tool /usr/bin/gst-validate-launcher is a python2 script
> 
> 	$ head -1 /usr/bin/gst-validate-launcher
> 	#!/usr/bin/env python2
> 
> (and not easily upgradable to python3) so add python2 dependency and to fix
> the following runtime error
> 
> 	$ gst-validate-launcher
> 	Traceback (most recent call last):
> 	  File "/usr/bin/gst-validate-launcher", line 44, in <module>
> 	    from launcher.main import main
> 	  File "/usr/lib/gst-validate-launcher/python/launcher/main.py", line 26, in <module>
> 	    import reporters
> 	  File "/usr/lib/gst-validate-launcher/python/launcher/reporters.py", line 29, in <module>
> 	    from xml.sax import saxutils
> 	ImportError: No module named xml.sax
> 
> add additional BR2_PACKAGE_PYTHON_PYEXPAT select.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/e8c/e8c27db2a0935c2daef173d5650f6a2b3a219493/
>  http://autobuild.buildroot.net/results/723/723fe3036e8f0af2a90ff9e98173387466655000/
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Patch applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
