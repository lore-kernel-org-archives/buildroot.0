From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Mar 2013 21:30:12 +0100
Subject: [Buildroot] [PATCH] libcap: Add optional support for libattr
	capabilities
In-Reply-To: <CAG2jQ8gJzTXxWmr085JQAVmypJ4TSJWWQxfqj1SX72YqzjtONg@mail.gmail.com>
 (Markos Chandras's message of "Sat, 16 Mar 2013 19:52:45 +0000")
References: <1363364558-5321-1-git-send-email-markos.chandras@gmail.com>
 <20130316191153.29c28d2b@skate>
 <CAG2jQ8gJzTXxWmr085JQAVmypJ4TSJWWQxfqj1SX72YqzjtONg@mail.gmail.com>
Message-ID: <87mwu0zc17.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

 >>> +ifeq ($(BR2_PACKAGE_ATTR),y)
 >>> +     LIBCAP_DEPENDENCIES += host-attr attr
 >> 
 >> We don't generally tie dependencies of host packages on
 >> BR2_PACKAGE_<foo> options. Is there a specific reason that requires
 >> host-libcap to be built against host-attr?
 >> 
 Markos> Hi Thomas,

 Markos> No special reason, just making sure the host-libcap is built
 Markos> the same way as the target one does so it can support the same
 Markos> functionality.  Should I resend this patch but only changing
 Markos> the way the target libcap is built?

I would say so. We don't even currently have a host-attr package, so I'm
not sure how it could work?

-- 
Bye, Peter Korsgaard
