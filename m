From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 21:16:43 +0200
Subject: [Buildroot] [PATCH v1] e2fsprogs: fix musl compile
 (__GNUC_PREREQ related)
In-Reply-To: <20180925202104.19603-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 25 Sep 2018 22:21:04 +0200")
References: <20180925202104.19603-1-ps.report@gmx.net>
Message-ID: <87o9ciagys.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add void-linux provided patch to use __GNUC_PREREQ macro only
 > in case it is defined (patch taken from [1]).

 > Fixes [2]:

 >   In file included from ../../lib/ext2fs/ext2fs.h:97:0,
 >                    from feature.c:20:
 >   ../../lib/ext2fs/hashmap.h:20:19: error: missing binary operator before token "("
 >    #if __GNUC_PREREQ (4, 8)
 >                      ^
 >   ../../lib/ext2fs/hashmap.h:25:19: error: missing binary operator before token "("
 >    #if __GNUC_PREREQ (4, 8)
 >                      ^

 > Problem already upstream reported by Baruch Siach (see [3]).

 > [1] https://raw.githubusercontent.com/void-linux/void-packages/1f3b51493031cc0309009804475e3db572fc89ad/srcpkgs/e2fsprogs/patches/fix-glibcism.patch
 > [2] http://autobuild.buildroot.net/results/e49d9333086ed714fa193b79b49c53e9cc511fec
 > [3] https://www.spinics.net/lists/linux-ext4/msg62290.html

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
