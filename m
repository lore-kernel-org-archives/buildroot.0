From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 23:41:39 +0200
Subject: [Buildroot] [PATCH] zeromq: needs NPTL
In-Reply-To: <9d5f2d7a7183fa0d7c9cabc93ca4462755477429.1523966084.git.baruch@tkos.co.il>
References: <9d5f2d7a7183fa0d7c9cabc93ca4462755477429.1523966084.git.baruch@tkos.co.il>
Message-ID: <20180419234139.5a68978b@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Apr 2018 14:54:44 +0300, Baruch Siach wrote:
> The recent zeromq version bump to 4.2.5 added a call to
> pthread_condattr_setclock() which is only provided by the NPTL
> implementation of pthreads. Add this dependency to zeromq and all
> reverse dependencies recursively.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2d0/2d070074097270a1e6973bc19e2bded2a7023c49/
> http://autobuild.buildroot.net/results/1ce/1ce6d6f0f6390f552954a09f7dc753e0baa86675/
> http://autobuild.buildroot.net/results/97c/97c5b9f3bc2c94f8476e884b9a3163bbf2dad8d4/
> 
> Cc: Asaf Kahlon <asafka7@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/circus/Config.in       | 6 +++---
>  package/cppzmq/Config.in       | 6 +++---
>  package/czmq/Config.in         | 6 +++---
>  package/filemq/Config.in       | 6 +++---
>  package/mongrel2/Config.in     | 6 +++---
>  package/php-zmq/Config.in      | 6 +++---
>  package/python-pyzmq/Config.in | 6 +++---
>  package/zeromq/Config.in       | 6 +++---
>  package/zmqpp/Config.in        | 6 +++---
>  package/zyre/Config.in         | 6 +++---
>  10 files changed, 30 insertions(+), 30 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
