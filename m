From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:08:38 +0200
Subject: [Buildroot] [git commit] fakeroot: depend on acl
In-Reply-To: <20170318131148.BB3467FED1@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 18 Mar 2017 14:10:19 +0100")
References: <20170318131148.BB3467FED1@busybox.osuosl.org>
Message-ID: <87o9wi2za1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=2a222446b4614a38b4042df54b68b69b96939708
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Recent versions of fakeroot have grown support for acl. We don't really
 > need this since we don't use acls in Buildroot. However, it turns out
 > that "cp -a" does something funky with acls, with the result that
 > fakeroot without acl support looses the ownership and permissions on
 > the copied file. "cp -a" may be (is even likely to be) used in a
 > BR2_ROOTFS_POST_FAKEROOT_SCRIPT, so we need to support this.

 > Note that host-acl itself depends on host-attr, so this pulls in two
 > extra packages in each build. The impact on build time is about 10s.

 > Cc: Andreas Naumann <dev@andin.de>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
