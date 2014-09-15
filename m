From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 09:21:22 +0200
Subject: [Buildroot] [PATCH v7] openvmtools: new package
In-Reply-To: <1409674416-33961-1-git-send-email-kaszak@gmail.com>
References: <1409674416-33961-1-git-send-email-kaszak@gmail.com>
Message-ID: <20140915092122.7582b3f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Tue,  2 Sep 2014 18:13:36 +0200, Karoly Kasza wrote:
> New package: openvmtools
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>

There are some build failures caused by this new package, see
http://autobuild.buildroot.org/?reason=openvmtools-9.4.6-1770165. The
build failure looks like:

syncDriverPosix.c: In function 'SyncDriverIsRemoteFSType':
syncDriverPosix.c:76:30: error: argument to 'sizeof' in 'strncmp' call is the same expression as the second source; did you mean to provide an explicit length? [-Werror=sizeof-pointer-memaccess]
                       sizeof gRemoteFSTypes[i]) == 0) {

Could you have a look at what happens?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
