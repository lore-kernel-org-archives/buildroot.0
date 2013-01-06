From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jan 2013 12:14:25 +0100
Subject: [Buildroot] [PATCH] Fix installation of crosstool-ng libraries
	to target
In-Reply-To: <201301061206.37057.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 6 Jan 2013 12:06:37 +0100")
References: <1357449105-14780-1-git-send-email-bos@je-eigen-domein.nl>
 <201301061206.37057.yann.morin.1998@free.fr>
Message-ID: <87hamuh8by.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> -	$(Q)CTNG_TUPLE="$$( $(call ctng,show-tuple) )";                     \
 >> +	$(Q)CTNG_TUPLE="$$( $(call ctng,show-tuple 2>&1) )";                \

 Yann> Indeed, that's going to stderr. That's a but in crostool-NG, it
 Yann> should go to stdout. Will fix in ct-ng.

 Yann> In the meantime:
 Yann> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks. Does this mean the internal ctng backend has never worked at runtime?

-- 
Bye, Peter Korsgaard
