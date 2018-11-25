From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 22:33:47 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnfs: add patch to fix musl
 build issue
In-Reply-To: <20181105010230.18425-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 5 Nov 2018 02:02:29 +0100")
References: <20181105010230.18425-1-joerg.krause@embedded.rocks>
Message-ID: <87k1l03kqs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Add a patch to fix build issues with the musl C library.
 > This patch fixes an autobuild issue when linking the mpd package
 > against libnfs. The header file libnfs.h uses `struct timeval` which is
 > defined in `<sys/time.h>` for POSIX systems. Unfortunately, upstream
 > only includes it conditionally, based on the system. Therefore, we
 > remove the check in the first patch.

 > Reported upstream:
 > https://github.com/sahlberg/libnfs/issues/272

 > Fixes:
 > http://autobuild.buildroot.org/results/452/4522014698b9fe50720a71b663e47a75805bcf54
 > http://autobuild.buildroot.org/results/b0a/b0a0c20ad1705e9fa7ba4a12eb9c182e8077ab0c
 > http://autobuild.buildroot.org/results/53c/53c87361923cc177de7889523b3d16ba6b1d3d0f
 > .. and more.

 > Previous patch: Changes requested
 > http://patchwork.ozlabs.org/patch/973605/

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
