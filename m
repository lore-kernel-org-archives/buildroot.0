From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2015 17:21:01 +0200
Subject: [Buildroot] [PATCH] apitrace: bump to version 7.0
In-Reply-To: <1440406490-15855-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 24 Aug 2015 09:54:50 +0100")
References: <1440406490-15855-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87h9nozp9e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Our current apitrace version can't detect the host-python version
 > correctly, so if both host-python and host-python3 where installed, it
 > will take the last one and it will fail with an "invalid syntax" error.
 > The latest apitrace version has this problem solved and it detects the
 > host-python version correctly.

 > Fixes:

 >   http://autobuild.buildroot.net/results/22a/22a73b4ba0adcc874ecc153917ae6edcfd4d37af/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

So then perhaps we shouldn't force people to build host-python if they
already have host-python3 built?

E.G. something like:

APITRACE_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)

But that can be added later - Committed, thanks.

-- 
Bye, Peter Korsgaard
