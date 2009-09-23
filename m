From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Sep 2009 14:54:05 +0200
Subject: [Buildroot] use of HOST_GLIB
In-Reply-To: <1253706849.1618.60.camel@sven> (Sven Neumann's message of "Wed\,
	23 Sep 2009 13\:54\:09 +0200")
References: <1253706849.1618.60.camel@sven>
Message-ID: <8763b9rfde.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Hi,
 Sven> I found that package/java/classpath and package/libsoup both use

 Sven>  ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/glib-genmarshal

 Sven> However HOST_GLIB does not seem to be defined. What is the proper
 Sven> way to refer to the glib-genmarshal binary that is installed by
 Sven> the host-libglib2 target?

Ahh, those must have been missed when we fixed the glib-genmarshal
stuff. The proper variable to use is LIBGLIB2_HOST_BINARY.

I'll fix it in git - Thanks.

-- 
Bye, Peter Korsgaard
