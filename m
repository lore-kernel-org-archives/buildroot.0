From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:11:57 +0200
Subject: [Buildroot] [PATCH/next 1/1] python-libconfig: fix python-3.7
 support
In-Reply-To: <20180824203119.16807-1-bernd.kuhls@t-online.de>
References: <20180824203119.16807-1-bernd.kuhls@t-online.de>
Message-ID: <20180824231157.4c79f191@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 22:31:19 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/32f/32f7e38895e7c491916bd69ed91bbe016e8b3ff6/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to next, thanks, however...

> -+boostlib = "boost_python36"
> ++boostlib = "boost_python37"
>  +if sys.version_info < (3, 0):
>  +    boostlib = "boost_python27"

Can we do better than this piece of code that we will forget to update
pretty much every time we bump Python ? Yegor ? Fabrice ? Any idea
here ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
