From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 21:41:39 +0200
Subject: [Buildroot] [PATCH] package/qt5webkit: needs host-python
In-Reply-To: <1469486011-29173-1-git-send-email-yann.morin.1998@free.fr>
References: <1469486011-29173-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160727214139.647880f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 00:33:31 +0200, Yann E. MORIN wrote:
> The Qt5Webkit build system hard-codes calls to 'python', but only really
> supports python2.
> 
> We fix that similarly as we did in nodejs, by adding a python->python2
> symlink early in the PATH when configuring/building Qt5Webkit, and
> adding host-python in the dependency list.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/ea4/ea4dd00ee585f9f9ea1927b8b5fd9035e6733420/
>     http://autobuild.buildroot.org/results/323/323ba220fae70d94c81bab9a348be844e90ace91/
>     http://autobuild.buildroot.org/results/6c2/6c20c9e222f94e6b70b97b87e1393dd16da2718c/
> 
> Also slightly reorganise the dependency list, now that it no longer fits
> on a single line.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/qt5/qt5webkit/qt5webkit.mk | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
