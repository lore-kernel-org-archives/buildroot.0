From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 15:02:51 +0200
Subject: [Buildroot] [PATCH] xfsprogs: fix build with older kernel
 headers
In-Reply-To: <6ade51cc420b2cf54f99a21528d1e9a50b276944.1521927803.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 25 Mar 2018 00:43:23 +0300")
References: <6ade51cc420b2cf54f99a21528d1e9a50b276944.1521927803.git.baruch@tkos.co.il>
Message-ID: <87muywxq84.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > xfsprogs uses a local definition of struct fsxattr when the kernel
 > provided one in linux/fs.h is too old. The preprocessor trickery that
 > allows to include linux/fs.h without colliding with the local
 > definitions breaks when source files include linux/fs.h on their own.
 > Add a patch that removes these local includes.

 > Fixes:
 > http://autobuild.buildroot.net/results/3aa/3aad812582d94b76d204436d2879bfa732c34da6/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
