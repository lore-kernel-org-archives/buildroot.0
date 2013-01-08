From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jan 2013 20:18:08 +0100
Subject: [Buildroot] [PATCH] new package: proxychains
In-Reply-To: <50EC6C03.2040504@petroprogram.com>
References: <1356222029-6290-1-git-send-email-stefan.froberg@petroprogram.com>
 <20130108180957.30c9f629@skate> <50EC6C03.2040504@petroprogram.com>
Message-ID: <20130108201808.7ee86751@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Tue, 08 Jan 2013 20:57:07 +0200, Stefan Fr?berg wrote:

> Hmmm... could this be a some weird parallel compiling problem ????

No. proxychains is a program that LD_PRELOAD a library to overload some
of the C library functions. So it reimplements some functions of the C
library, but in this case, it reimplements getnameinfo() with a
prototype that doesn't match the one of the C library.

Maybe an idea would be to upgrade to proxychains 4.4:
http://sourceforge.net/projects/proxychains/forums/forum/644747/topic/6519406.

The main page of proxychains mentions 3.1 as the latest version, but it
is not the case. The official Git repo at
https://github.com/rofl0r/proxychains contains many more recent
versions. Most likely the problem is already fixed in a more recent
version than 3.1.

Could you test a more recent version and submit the corresponding patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
