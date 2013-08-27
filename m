From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Aug 2013 22:33:46 +0200
Subject: [Buildroot] [PATCH] python-setuptools: Add missing
	$(TARGET_DIR) to PYTHONPATH.
In-Reply-To: <1377204777-8904-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Thu, 22 Aug 2013 21:52:57 +0100")
References: <1377204777-8904-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <87a9k2kh5h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 Markos> The $(TARGET_DIR) variable is required when building
 Markos> python-setuptools for the target otherwise the build system detects
 Markos> the host installation which leads to permission error problems
 Markos> like these:

 Markos> Setuptools installation detected at /usr/lib64/python2.7/site-packages
 Markos> Renaming /usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info to
 Markos> /usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info.OLD.1377005697.88
 Markos> OSError: [Errno 13] Permission denied

 Markos> Moreover, remove the PYTHONPATH variable for host variant since it's
 Markos> not needed.

Committed, thanks (with the double '))' fixed).

-- 
Bye, Peter Korsgaard
