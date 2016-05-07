From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 14:28:00 +0200
Subject: [Buildroot] Qt5 fails to compile with gcc 6.1.0
In-Reply-To: <572DDCA5.8060204@gmail.com>
References: <572DBAB9.3060607@gmail.com> <572DD6A2.8030406@gmail.com>
 <20160507141147.65fe012a@free-electrons.com>
 <572DDCA5.8060204@gmail.com>
Message-ID: <20160507142800.6fec8574@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 7 May 2016 14:16:37 +0200, Marco Trapanese wrote:

> Yes, I always "make clean all".
> 
> Attached there is the .config file.
> The version is Buildroot 2016.05-git-01197-gda433d6-dirty

However your version is "-dirty" which means you have modified
Buildroot. But we have no idea which modifications you have made. Maybe
those modifications are the reason for the failure?

Also, please don't use gcc 6.x for now, and stay with gcc 4.9, so
please test with gcc 4.9.

Please disable LTO support for the moment. It isn't enabled by default,
and we don't test it that often, so please disable it for now.

Please stay with the default of binutils 2.25 instead of selecting
binutils 2.26.

Once you have changed those configuration options and removed your local
Buildroot modifications, please try again a complete build "make clean
all" and see if it works or not. If it doesn't, I'll try to reproduce
here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
