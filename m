From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 20:43:09 +0200
Subject: [Buildroot] [PATCH] expat: fix build on and for kernel older
	than 3.17
In-Reply-To: <98035abe055ba7ba1c53deaed638844210c094f4.1500264698.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 17 Jul 2017 07:11:38 +0300")
References: <98035abe055ba7ba1c53deaed638844210c094f4.1500264698.git.baruch@tkos.co.il>
Message-ID: <87r2xc5kua.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The expat build system now fails when the getrandom() system call is not
 > supported. This affect both host and target builds. Define XML_POOR_ENTROPY
 > for target kernels older than 3.17 to fix the build. For the host package
 > define XML_POOR_ENTROPY unconditionally since we have no easy way to know the
 > host kernel version. Note that expat will still use getrandom() on the host
 > when it is available, we don't make security any worse.

 > Fixes (host):
 > http://autobuild.buildroot.net/results/928/928dc2b56d931da84055fdfe78929d1f956de53b/
 > http://autobuild.buildroot.net/results/ee9/ee90d0a456cbce4c7f22e5f61006612bd9ba30d5/
 > http://autobuild.buildroot.net/results/dac/dac7231242123ae3dcaa6bbdd65b44fe8d8cb20c/

 > Fixes (target):
 > http://autobuild.buildroot.net/results/308/308e830219fdfebb5aa6aef51c1dc784254998f6/
 > http://autobuild.buildroot.net/results/73f/73fa946b0a2205e946ad414079f88e4bdb416f00/
 > http://autobuild.buildroot.net/results/9d7/9d7bad22ace7fa211b31d752a2255e07cede68be/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
