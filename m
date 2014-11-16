From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Nov 2014 23:11:09 +0100
Subject: [Buildroot] [PATCH] package/libcap: needs headers >= 3.0
In-Reply-To: <1416135887-27267-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 16 Nov 2014 12:04:47 +0100")
References: <1416135887-27267-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87tx1ydcea.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > libcap requires XATTR_NAME_CAPS, which was introduced in Linux 2.6.24.
 > However, we have some toolchains, liek the CodeSourcery PowerPC 2011.03,
 > that is missing those defines, even though it uses headers from Linux
 > 2.6.38.

 > Since there is no perfect way to avoid the situation, just require
 > headers >= 3.0 to build libcap.

 > Propagate the new dependency to packages that select libcap.

 > Fixes a lot of build failures, of which:
 >     http://autobuild.buildroot.net/results/e90/e909ca48ad2d1c85b19258f65e0c89a2813ac45e/
 >     http://autobuild.buildroot.net/results/23a/23aac9bb1cc48e5974bcf50256a16c67318f9ba2/
 >     http://autobuild.buildroot.net/results/597/597da58cb2fccb92d7883802c60b31264cacad08/
 >     http://autobuild.buildroot.net/results/538/538b23417c68f6c8c0c8c92dfc0e8ed314bac01b/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
