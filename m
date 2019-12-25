From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:26:27 +0100
Subject: [Buildroot] [PATCH] sdl2: add patch to fix busy-loop in C
 library
In-Reply-To: <20191220160438.102444-1-paul@crapouillou.net> (Paul Cercueil's
 message of "Fri, 20 Dec 2019 17:04:38 +0100")
References: <20191220160438.102444-1-paul@crapouillou.net>
Message-ID: <87blrwrta4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > For some obscure reason, the order in which the libdrm/libgbm libraries
 > are loaded matters.

 > Without this fix, the first call to check_modesetting() will work and
 > load then unload all symbols properly, but the second call to this
 > function will lock up as soon as dlopen() is called on libdrm.

 > Swapping the order in which the libdrm and libgbm libraries are loaded
 > is enough to fix (or work around?) this issue.

 > Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
