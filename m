From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jul 2016 22:27:02 +0200
Subject: [Buildroot] [PATCH] htop: bump to version 2.0.1
In-Reply-To: <20160710205934.5373-1-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 10 Jul 2016 17:59:34 -0300")
References: <20160710205934.5373-1-ricardo.martincoski@gmail.com>
Message-ID: <87wpkr9azt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > - drop 0001-native-affinity.patch as it was replaced upstream [1]. Autoreconf
 >   could be dropped

 > - drop conf env ac_cv_file__proc_stat=yes ac_cv_file__proc_meminfo=yes because
 >   these tests no longer run when cross-compiling [2]

 > - upstream created a custom check function to use ncurses*-config [3] but it
 >   does not allow to override the path to ncurses*-config, leading to a build
 >   failure as the htop build system would search the path of host tools.
 >   A new patch 0001-Allow-to-override-ncurses-config-path.patch allows this
 >   override [4]. It brings back the need to autoreconf

 > - set path to ncurses5-config in conf env in order to avoid the htop build
 >   system finding it in the path of host tools

 > [1] https://github.com/hishamhm/htop/commit/dfad0afb36df9ac104490454c6472625e3ecbe0c
 > [2] https://github.com/hishamhm/htop/commit/b56195663760d76ea61d9ed15121dd4a13fa68cd
 > [3] https://github.com/hishamhm/htop/commit/96c929f82b811f054726f1ba3e5fd065976a1204
 > [4] https://github.com/hishamhm/htop/pull/524/commits/666f12f60f7d7936af932bf513bc0e9c5c5158f9

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
