From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 23:46:27 +0200
Subject: [Buildroot] [PATCH v2 1/3] uwsgi: new package
In-Reply-To: <20180202140601.21285-1-aduskett@gmail.com>
References: <20180202140601.21285-1-aduskett@gmail.com>
Message-ID: <20180520234627.5484405e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Feb 2018 09:05:59 -0500, Adam Duskett wrote:
> Uwsgi is a web server gateway interface written in python that is
> meant to be flexible and plugin oriented.
> 
> To get it to cross compile, 2 small patches had to be created:
> 
> The first fixes the build system attempting to link against /usr/lib
> instead of sysconfig.PREFIX.
> 
> The second adds a way to specify a location for xml2-config, as the
> build-system currently just blindly calls out xml2-config which
> can be on the host machine.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

I am sorry, but this is again not up to the level of quality that I
would expect from an experienced contributor like you.

 (1) It fails to build with uClibc, first because it includes
     <execinfo.h> when __GLIBC__ is defined. I've fixed that.

 (2) It still fails to build with uClibc, because a workaround for a
     glibc 2.2.3 bug gets enabled with uClibc and doesn't build. I've
     fixed that.

 (3) You make util-linux, pcre, jansson and libxml2 mandatory
     dependencies, but they are not. You can customize
     buildconf/base.ini to disable these. I was able to do a uwsgi
     build with none of those dependencies enabled.

 (4) I've done a build with python-setuptools on the target, and uwsgi
     works just fine.

So this clearly needs to be reworked. Could you have another look at
this package, and make an improved submission ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
