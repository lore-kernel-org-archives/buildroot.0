From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Nov 2018 17:19:43 +0100
Subject: [Buildroot] [PATCH] package/systemd: needs glibc
In-Reply-To: <20181121210556.18619-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 21 Nov 2018 22:05:56 +0100")
References: <20181121210556.18619-1-yann.morin.1998@free.fr>
Message-ID: <87y39lm6e8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since version v239, systemd-nspawn unconditioanlly uses prlimit(2),
 > which is not implemented in uClibc-ng. systemd-nspawn can not be
 > disabled.

 > This makes systemd glibc-only again.

 > After a bit of discussion with upstream (om IRC), it looks very
 > improbable that they accept a patch making systemd-nspawn optional.
 > They would probably consider a patch that provides that syscall wrapper
 > if it is missing, though, but that's less trivial...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Waldemar Brodkorb <wbx@openadk.org>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

So this has been broken since end of June? How come we don't have any
autobuilder failures?

Committed, thanks.

-- 
Bye, Peter Korsgaard
