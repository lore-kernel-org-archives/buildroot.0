From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:58:53 +0200
Subject: [Buildroot] [PATCH] support/check-rpath: recognise PIE
In-Reply-To: <20170924162244.29575-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 24 Sep 2017 18:22:44 +0200")
References: <20170924162244.29575-1-yann.morin.1998@free.fr>
Message-ID: <87k1zum9pu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We sanity-check the host executables that they have a correct RPATH
 > pointing to the host libraries.

 > This is currently done by looking for all files in $(HOST_DIR) that
 > match the 'ELF executable' pattern (a bit more complex, but that's
 > idea).

 > However, when an executable is built with -fPIE of -fpie, it no longer
 > appears to be an 'ELF executable', but it rather looks like an 'ELF
 > sheard object' (like if it were an library.

 > So, we miss those files.

 > It turns out that the problem is a real one, because quite a few
 > mainline distros, expecially those based on Debian for example, have
 > already switched to generating PIE code by default, and thus we miss on
 > a whole class of systems..

 > We fix that by simply looking if we can find an ELF interpreter in each
 > file. If we there is one, this is an ELF executable; if not, it may be
 > anything else: we don't care (not even about ELF libraries).

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
