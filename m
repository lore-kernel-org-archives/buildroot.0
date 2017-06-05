From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 14:53:43 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/exiv2: disable on musl
In-Reply-To: <20170605114703.12438-1-bernd.kuhls@t-online.de>
References: <20170605114703.12438-1-bernd.kuhls@t-online.de>
Message-ID: <20170605145343.2a8c69bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 13:47:03 +0200, Bernd Kuhls wrote:
> Musl build is broken:
> 
> /home/buildroot/build/instance-0/output/build/exiv2-910f3507795e1930ae216c9febee0bf9a88e99c0/src/actions.cpp:2052:32:
>  error: 'PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP' was not declared in this scope
> 
> According to http://www.openwall.com/lists/musl/2017/02/20/3
> the define is not available on musl.
> 
> Fixes
> http://autobuild.buildroot.net/results/283/28334a8a0b23c7c8260023b9a3aa15e8dd7613d0/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: added comment to Config.in (Baruch)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
