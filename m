From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Sep 2015 11:58:17 +0200
Subject: [Buildroot] [git commit] openssl: change sed expression
 delimiter
In-Reply-To: <20150923212758.B911C81739@busybox.osuosl.org>
References: <20150923212758.B911C81739@busybox.osuosl.org>
Message-ID: <20150924115817.51306b11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Sep 2015 23:27:42 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=35495daed39933db06dcc62a335fff89836d1853
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Switch from : to # since CFLAGS can include :'s spilled in from
> BR2_TARGET_OPTIMIZATION, for example:
> 
> BR2_TARGET_OPTIMIZATION="-Wl,-rpath,/lib:/usr/lib" would cause the sed
> expression to fail thus breaking the build.

Actually, I am wondering of -Wl,-rpath,/lib:/usr/lib is the legal of
doing things, and if it shouldn't be -Wl,-rpath,/lib
-Wl,-rpath,/usr/lib. The first solution makes the assumption that ':'
is the RPATH separator, while the latter does not make such assumption.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
