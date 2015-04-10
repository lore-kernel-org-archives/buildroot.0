From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Apr 2015 22:57:34 +0200
Subject: [Buildroot] [PATCH] botan: pass --prefix=/usr to fix .pc file
In-Reply-To: <1428681323-11414-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 10 Apr 2015 17:55:23 +0200")
References: <1428681323-11414-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <876193em69.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > botan uses a non-autotools build system. We currently don't pass any
 > --prefix=/usr, and by default the prefix is set to /usr/local. This
 > doesn't cause a lot of visible issues because at install time, we pass
 > DESTDIR=$(TARGET_DIR)/usr (the build system doesn't make the
 > difference between DESTDIR and prefix).

 > However, the generated pkg-config .pc file is wrong, as it contains
 > prefix=/usr/local instead of prefix=/usr, which doesn't match where
 > the botan library and headers are installed. By passing --prefix=/usr,
 > we make sure that the .pc file is in line with where botan is
 > installed.

 > Fixes bug #7760

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
