From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Dec 2012 01:05:28 -0800
Subject: [Buildroot] [PATCH 2/2] netatalk: Make BerkeleyDB optional for
	Netatalk
In-Reply-To: <1352410452-10680-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Thu, 8 Nov 2012 22:34:12 +0100")
References: <1352410452-10680-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87k3swc1if.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 Maxime> As the documentation of netatalk states :
 Maxime> "dbd is the default backend since version 2.1"
 Maxime> So cdb (which is the CNID provided by BerkeleyDB) should not be the default.

 Maxime> Also, this patches fixes a trouble when compiling with
 Maxime> berkeleydb in 64bits where netatalk would look the berkeleylib
 Maxime> in [...]/lib64 instead of [...]/lib

Thanks, but:

- It doesn't apply because of host-pkg-config -> host-pkgconf.
- It doesn't work:

checking for Berkeley DB headers in /usr/include/db48... no
checking for Berkeley DB headers in /usr/include/db4.7... no
checking for Berkeley DB headers in /usr/include/db47... no
checking for Berkeley DB headers in /usr/include/db4.6... no
checking for Berkeley DB headers in /usr/include/db46... no
checking for Berkeley DB headers in /usr/include/db4... no
configure: error: Berkeley DB library required but not found!
make[1]: *** [/home/peko/source/buildroot/testnetatalk/build/netatalk-3.0/.stamp_configured] Error 1

With an empty default BR config (only netatalk enabled).

-- 
Bye, Peter Korsgaard
