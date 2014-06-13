From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Jun 2014 15:10:49 +0200
Subject: [Buildroot] [PATCH] util-linux: fix installation of shared
	libraries to not mess with pure static lib
In-Reply-To: <1402603963-29234-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 12 Jun 2014 22:12:43 +0200")
References: <1402603963-29234-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877g4ldkfa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Even when compiled with --enable-static --disable-shared, util-linux
 > creates some incorrect libuuid.so, libblkid.so and libmount.so
 > symbolic links, which confuses the compiler which thinks that a shared
 > library is available. This causes some build issues such as:

 >   http://autobuild.buildroot.org/results/990/9909d198ce14969d0e9d29a34fcc33f0ef79220d/

 > This commit fixes that by adding a patch to util-linux that fixes this
 > issue. The patch has been submitted upstream at
 > http://article.gmane.org/gmane.linux.utilities.util-linux-ng/9262.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
