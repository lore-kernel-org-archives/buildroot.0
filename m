From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 18:00:58 +0200
Subject: [Buildroot] [PATCH] luajit: bump to version 2.0.5
In-Reply-To: <20170502075622.22153-1-francois.perrad@gadz.org>
References: <20170502075622.22153-1-francois.perrad@gadz.org>
Message-ID: <20170504180058.06b71b51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 May 2017 09:56:22 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luajit/0001-no-bin-symlink.patch | 10 +++++-----
>  package/luajit/0003-install-so.patch     | 22 ----------------------
>  package/luajit/luajit.hash               |  2 +-
>  package/luajit/luajit.mk                 |  2 +-
>  4 files changed, 7 insertions(+), 29 deletions(-)
>  delete mode 100644 package/luajit/0003-install-so.patch

This commit has broken the build of the luvi package, see:

  http://autobuild.buildroot.net/results/3ee/3eef12dbe07fb375e87b2b2898dcc5ef0c11e7a5/build-end.log

Reverting the luajit bump fixes the issue.

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
