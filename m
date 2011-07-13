From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Jul 2011 08:37:26 +0200
Subject: [Buildroot] [PATCH 2/2] source: print messages when all sources
	downloaded
In-Reply-To: <1310512066-11450-3-git-send-email-yann.morin.1998@anciens.enib.fr>
 (Yann E. MORIN's message of "Wed, 13 Jul 2011 01:07:46 +0200")
References: <1310512066-11450-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <1310512066-11450-3-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87r55ufzyx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> When downloading all sources for later off-line build (eg. make source),
 Yann> and the toolchain backend is crosstool-NG, the last messages the user
 Yann> wil see is something like:
 Yann>   [INFO ]  Retrieving needed toolchain components' tarballs: done in 98.02s (at 01:39)
 Yann>   [INFO ]  Build completed at 20110713.000605
 Yann>   [INFO ]  (elapsed: 1:39.21)
 Yann>   [INFO ]  Finishing installation (may take a few seconds)...

 Yann> which is pretty uninformative, here; crosstool-NG is just saying that
 Yann> it just finished what it was asked for, that is download the sources,
 Yann> but there is no separate message for that.

 Yann> To avoid confusion, add an explicit message that makes it clear that
 Yann> downloading the sources was sucessful, and nothing more.

I agree it isn't optimal, but this breaks E.G. make external-deps

-- 
Bye, Peter Korsgaard
