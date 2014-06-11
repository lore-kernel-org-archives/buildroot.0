From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jun 2014 11:18:14 +0200
Subject: [Buildroot] [V2 1/2] pkg-perl: fix for Perl XS packages
	configured by Makefile.PL
In-Reply-To: <1398356762-12486-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Thu, 24 Apr 2014 18:26:01 +0200")
References: <1398356762-12486-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87egyvkdnt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > ExtUtils::MakeMaker adds all the header files used by the perl as
 > dependencies to the generated Makefile. This means that the generated
 > Makefile will depend on the system's header files.

 > Usually this is not a problem, because when building the target package,
 > these header files will indeed be found in $(STAGING_DIR). However, some
 > distro's add an extra header file to the system's perl. This header is
 > also included in the generated Makefile, which makes the build fail
 > because it doesn't exist in $(STAGING_DIR).

 > As a work-around, explicitly create this header file in $(STAGING_DIR).
 > It doesn't hurt to create it even if the system perl doesn't need it.

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
