From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 22:00:34 +0200
Subject: [Buildroot] [PATCH] mpg123: security bump to version 1.25.1
In-Reply-To: <20170703124337.6291-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 3 Jul 2017 14:43:37 +0200")
References: <20170703124337.6291-1-peter@korsgaard.com>
Message-ID: <8737ad70kd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the release notes:
 > - Avoid memset(NULL, 0, 0) to calm down the paranoid.

 > - Fix bug 252, invalid read of size 1 in ID3v2 parser due to forgotten
 >   offset from the frame flag bytes (unnoticed in practice for a long time).
 >   Fuzzers are in the house again.  This one got CVE-2017-10683.

 >   https://sourceforge.net/p/mpg123/bugs/252/

 > - Avoid a mostly harmless conditional jump depending on uninitialised
 > fr-> lay in compute_bpf() (mpg123_position()) when track is not ready yet.

 > - Fix undefined shifts on signed long mask in layer3.c (worked in practice,
 >   never right in theory).  Code might be a bit faster now, even.  Thanks to
 >   Agostino Sarubbo for reporting.

 > dlopen() is now directly used to load output modules (and the
 > --with-modules-suffix option has been removed), so adjust the modules logic
 > to match.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
