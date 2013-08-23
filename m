From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 07:01:13 +0200
Subject: [Buildroot] [PATCH] python-setuptools: Add missing
 $(TARGET_DIR) to PYTHONPATH.
In-Reply-To: <1377204777-8904-1-git-send-email-markos.chandras@imgtec.com>
References: <1377204777-8904-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <20130823070113.122e718f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Thu, 22 Aug 2013 21:52:57 +0100, Markos Chandras wrote:
> The $(TARGET_DIR) variable is required when building
> python-setuptools for the target otherwise the build system detects
> the host installation which leads to permission error problems
> like these:
> 
> Setuptools installation detected at /usr/lib64/python2.7/site-packages
> Renaming /usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info to
> /usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info.OLD.1377005697.88
> OSError: [Errno 13] Permission denied
> 
> Moreover, remove the PYTHONPATH variable for host variant since it's
> not needed.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

Would you mind testing/acking this patch? You've been doing quite some
Python stuff, so I'd appreciate to have your input on this.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
