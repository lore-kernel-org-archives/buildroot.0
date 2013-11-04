From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Nov 2013 22:08:13 +0100
Subject: [Buildroot] [PATCH 2/2] libcap: fix static link
In-Reply-To: <1383328047-28945-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 1 Nov 2013 18:47:27 +0100")
References: <1383328047-28945-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1383328047-28945-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ppqfq3ia.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > With BR2_PREFER_STATIC_LINK, libcap fails to build:

The symbol is called BR2_PREFER_STATIC_LIB.

 >   http://autobuild.buildroot.net/results/619bceb3491ecd2ed4e1ae552fdb237a0ed2fa47/build-end.log

 > This is due to the fact that it still tries to build a shared
 > library. This commit fixes that by adding a patch that makes libcap
 > provide install-shared/install-static targets. We also now only build
 > the $(@D)/libcap subdirectory, so removing the build of the progs
 > subdirectory is no longer needed.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  .../libcap-02-split-static-shared-install.patch    | 30 ++++++++++++++++++++++

Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
