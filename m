From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Jul 2021 10:22:44 +0200
Subject: [Buildroot] [PATCH v1 1/1] python: use system libffi for
 host-python
In-Reply-To: <20210621055351.3958011-1-christian@paral.in> (Christian
 Stewart's message of "Sun, 20 Jun 2021 22:53:51 -0700")
References: <20210621055351.3958011-1-christian@paral.in>
Message-ID: <87k0lwx7or.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > From: Erico Nunes <nunes.erico@gmail.com>
 > python2 contains a bundled copy of libffi which is currently out of sync with
 > the latest libffi release. There is an option to use a system libffi, buildroot
 > already uses it for the target python2 build and for python3. In python3, the
 > bundled copy doesn't exist anymore and the system-provided libffi is required.

 > The bundled copy currently fails to build on aarch64 host due to a missing
 > definition of AARCH64_CALL_CONTEXT_SIZE. This define was removed from the
 > headers in recent libffi releases and the host compiler might be including the
 > system headers before the bundled headers.

 > To solve this and since buildroot already relies on system libffi for target
 > python2 and python3 anyway, switch host python2 to use system libffi.

 > Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
 > Reviewed-by: Christian Stewart <christian@paral.in>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
