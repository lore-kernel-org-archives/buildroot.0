From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 May 2014 23:28:04 +0200
Subject: [Buildroot] [PATCH] pulseaudio: uses fork(),
	not available on noMMU platforms
In-Reply-To: <1400337631-8964-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 May 2014 16:40:31 +0200")
References: <1400337631-8964-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ppjcm6xn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Even though pulseaudio has some HAVE_FORK compile-time conditionals to
 > avoid using fork(), those parts of pulseaudio are not using it. Since
 > using pulseaudio on !MMU platforms is fairly unlikely, we simply
 > disable it when no MMU is available, and propagate this dependency to
 > the appropriate locations.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
