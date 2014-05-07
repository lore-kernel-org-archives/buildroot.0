From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 May 2014 22:24:19 +0200
Subject: [Buildroot] [PATCH 1/1 v5] qdecoder : new package
In-Reply-To: <1399379703-24061-1-git-send-email-sagaert.johan@skynet.be>
 (Sagaert Johan's message of "Tue, 6 May 2014 14:35:03 +0200")
References: <1399379703-24061-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <871tw5e3rg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 > Features:
 >    Supports parsing a request encoded by GET/POST method
 >    Supports parsing multipart/form-data encoding.(in-memory and direct disk)
 >    Supports COOKIE handling.
 >    Supports Session management.
 >    Supports FastCGI
   
 > Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 > ---
 > v2:	Changed License to BSD-2
 > v3:	removed QDECODER_CONF_OPT and created makefile.in patch
 > v4:	renamed the patch to qdecoder-0001-install-header-and-lib-in-staging-directory.patch
 > v5:	-added !BR2_PREFER_STATIC_LIB dependency.
 > 	-changed Config.in help link to http://wolkykim.github.io/qdecoder

You still didn't fix the Makefile.in patch.

Looking closer, we also need to patch configure.ac as it hardcodes PATH
and /usr for includes and libraries.

Committed with the patch dropped / two patches added.

-- 
Bye, Peter Korsgaard
