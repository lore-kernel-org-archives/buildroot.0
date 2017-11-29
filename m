From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Nov 2017 17:48:51 +0100
Subject: [Buildroot] [PATCH v2] mtools: do not link to libbsd
In-Reply-To: <20171128160651.20880-1-casantos@datacom.ind.br> (Carlos Santos's
 message of "Tue, 28 Nov 2017 14:06:51 -0200")
References: <0171128125226.32n343bxgzhcrfvp@tarshish>
 <20171128160651.20880-1-casantos@datacom.ind.br>
Message-ID: <87k1y9kp3g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > If libbsd is found by the configuration process, mtools unnecessarily
 > adds a NEEDED field with libbsd to its dynamic section, but it does not
 > actually use anything from libbsd under Linux. The same may happen to
 > host-mtools if some libbsd package is installed on the host machine.

 > Prevent this by forcing configure to bypass the checking for the
 > existence of a gethostbyname function in libbsd.

 > I stumbled on this problem when I built host-mtools and later removed
 > libbsd to upgrade to Fedora 27, due to Bug 1504831[1]. The previously
 > built host/bin/mtools started to fail due to the missing libbsd.so.0.

 > 1. https://bugzilla.redhat.com/show_bug.cgi?id=1504831

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 > ---
 > Changes v1->v2
 >   - Improved the commit message, as requested by Baruch Siach.

Committed, thanks.

-- 
Bye, Peter Korsgaard
