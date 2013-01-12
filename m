From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:39:16 +0100
Subject: [Buildroot] [PATCH 12/28] xserver_xorg-server: provide more
	options for SHA1 library
In-Reply-To: <089f2d9cb8d7b83db4f512f3a62b1d98fc5693e3.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:24 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <089f2d9cb8d7b83db4f512f3a62b1d98fc5693e3.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8738y63wu3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Until now, the X.org server was forcefully selecting OpenSSL, just to
 Thomas> have a SHA1 implementation. However, in fact, the X.org server is
 Thomas> capable of using a SHA1 implementation from multiple libraries:
 Thomas> OpenSSL, libgcrypt and libsha1 amongst others.

 Thomas> So, this patch changes the X.org server package so that we use the
 Thomas> SHA1 functions from OpenSSL is OpenSSL is already available, or the
 Thomas> SHA1 functions from libgcrypt is libgcrypt is already available, or if
 Thomas> neither OpenSSL nor libgcrypt are enabled in the configuration, we
 Thomas> select the much smaller libsha1, that has been specifically written to
 Thomas> fulfill the X.org server requirements.

Committed, thanks.

-- 
Bye, Peter Korsgaard
