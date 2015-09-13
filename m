From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 12:12:06 +0200
Subject: [Buildroot] [PATCH] libtasn1: bump to version 4.6
In-Reply-To: <55F3EFAC.7060306@imgtec.com>
References: <1442010269-372-1-git-send-email-gustavo@zacarias.com.ar>
 <55F3EFAC.7060306@imgtec.com>
Message-ID: <20150913121206.64758da8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Sat, 12 Sep 2015 10:26:04 +0100, Vicente Olivert Riera wrote:

> On 11/09/15 23:24, Gustavo Zacarias wrote:
> > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Thanks for the testing!

However, may I suggest that you focus your review/test time to more
complicated patches? I typically apply trivial package bumps (such as
this one) without even doing a test build. There is really nothing to
review in such trivial patches (they just change the version and the
hash), and the build testing will be done by the autobuilders.

So I believe that if you have some time to review/test patches, it
would definitely be more beneficial on the more complicated ones (and
by complicated I don't mean "long", I simply mean not as trivial as a
package bump). For example, your help/testing on the systemd /usr merge
patch was much more useful than the testing of trivial package bumps.

Of course, feel free to continue testing package bumps as well, it does
not harm at all. I'm just trying to make your time as useful as
possible :-)

> $ file output/target/usr/bin/asn1Coding
> output/target/usr/bin/asn1Coding: ELF 32-bit MSB executable, MIPS, 

libtasn1 is a library, so it's actually more important to verify that
the library has been built correctly. Though I agree that we could
assume that asn1Coding is linked against the library, so that most
likely the library is also properly built for MIPS.

BTW, the fact that you are regularly verifying that the binaries built
by Buildroot are built for MIPS, I am wondering if it wouldn't be worth
the effort to add a final check at the end of the build to verify that
all binaries are built for the proper architecture/ABI. I remember that
some time ago, the nfs-utils package was installing binaries built for
the host machine into the target filesystem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
