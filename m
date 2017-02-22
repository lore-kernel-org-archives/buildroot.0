From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Feb 2017 09:03:56 +0100
Subject: [Buildroot] Bug in "package: add generic support for lz
	archives" ?
In-Reply-To: <20170222053219.lwceb3yg7r4ymazr@tarshish>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
 <20170221225509.28773ef3@free-electrons.com>
 <20170222053219.lwceb3yg7r4ymazr@tarshish>
Message-ID: <20170222090356.590da224@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 07:32:19 +0200, Baruch Siach wrote:

> The xzcat and tar checks behave the same way. There is no logic to determine 
> whether a given dependency is actually needed in this particular build.

Hm, OK. But then it doesn't happen that often that tar or xzcat is not
available, while it does happen a lot for lzip, and we have only a few
packages that use .lz archives.

Hence, to me, it is really against the Buildroot principle of "build
only what's necessary".

What about doing like we do for other download dependencies (like git,
svn, cvs, etc.) and only check them if they are actually needed by one
of the packages that are enabled?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
