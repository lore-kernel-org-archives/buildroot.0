From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 15:25:33 +0100
Subject: [Buildroot] [PATCH 1/2] gnutls: Give library a default trust
 location
In-Reply-To: <20181116201718.22455-1-tpiepho@impinj.com> (Trent Piepho's
 message of "Fri, 16 Nov 2018 20:17:32 +0000")
References: <20181116201718.22455-1-tpiepho@impinj.com>
Message-ID: <87y38pa6qq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

 > Gnutls is building with no default location to look for CA certs.  Since
 > there are buildroot packages to provide these, configure it to use them
 > by default.

 > Configure gnutls to find them using the bundle file which contains all
 > certs, rather than looking in the cert directory.  When gnutls is told
 > to use the directory, it loads *every* file in it.  This means it loads
 > the bundle with all certs, then loads each cert a second time using the
 > individual pem files, and then loads them all the third time via the
 > hash symlinks to the pem files.

 > When p11-kit is enabled, use its trust module instead of the bundle
 > file.  p11-kit can be configured to use the bundle (the default), but it
 > can do other things too, such as integrate with the "trust" command for
 > adding and removing trust anchors.

 > Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Committed both to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
