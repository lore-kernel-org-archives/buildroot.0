From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 May 2010 10:59:18 +0200
Subject: [Buildroot] [PATCH 2/3] libxcb: fix path to Python modules
In-Reply-To: <ea5d9f4196b6fdcd1fc55428c058b1d83b430591.1273096504.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Wed, 5 May 2010 23:55:16 +0200")
References: <cover.1273096504.git.thomas.petazzoni@free-electrons.com>
	<cover.1273096504.git.thomas.petazzoni@free-electrons.com>
	<ea5d9f4196b6fdcd1fc55428c058b1d83b430591.1273096504.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vdb19zix.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When building libxcb, the variable XCBPROTO_XCBPYTHONDIR must point to
 Thomas> the location where the Python modules needed to run the c_client.py
 Thomas> program are installed. The path
 Thomas> $(STAGING_DIR)/usr/lib/python2.6/site-packages was hardcoded. However,
 Thomas> it doesn't work when the version of Python installed on the host is
 Thomas> Python 2.5.

So we depend on python being available on the host? Shouldn't we just
use the hostpython stuff we already have and E.G
$(PYTHON_VERSION_MAJOR)?

Alternatively we should probably add a check in libxcb.mk and print an
$(error if it isn't there.

-- 
Bye, Peter Korsgaard
