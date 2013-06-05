From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Jun 2013 21:45:25 +0200
Subject: [Buildroot] [PATCH 2/2] sunxi-boards: set a default board
In-Reply-To: <20130605213807.0c015c5d@skate> (Thomas Petazzoni's message of
 "Wed, 5 Jun 2013 21:38:07 +0200")
References: <1370449270-22014-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1370449270-22014-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <87d2s0cqtw.fsf@dell.be.48ers.dk> <20130605213807.0c015c5d@skate>
Message-ID: <878v2ocpey.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Hmm, how is this different that what we do for the barebox/u-boot/linux
 >> configurations?

 Thomas> It is different in that this package starts with BR2_PACKAGE,
 Thomas> so it can get selected by the randpackageconfig logic, while
 Thomas> barebox/u-boot/linux Kconfig options don't start by
 Thomas> BR2_PACKAGE, so they don't get selected by randpackageconfig :)

True, but we have the same problem with E.G. BR2_PACKAG
E_QT_LICENSE_APPROVED / BR2_PACKAGE_QT5BASE_LICENSE_APPROVED. If these
are not set the build will also get stuck, so we preseed them in the
autobuilders (I do atleast).

 >> Wouldn't it make more sense to blacklist the package or preseed
 >> BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE to a sensible value in the autobuilder
 >> scripts?

 Thomas> Ok, will do that. Will you also do the same on your
 Thomas> autobuilders? I really should clean up my script, and share it
 Thomas> so that we can try to run the same logic.

Yes, I'll fixup "mine" as well.

-- 
Bye, Peter Korsgaard
