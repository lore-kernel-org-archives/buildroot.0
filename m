From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 23:30:33 +0200
Subject: [Buildroot] [PATCH] glibc: add version 2.24
In-Reply-To: <20160805212501.GB3009@haswell>
References: <1470387567-64171-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160805185348.4c0ff1fd@free-electrons.com>
 <2039F480-7B29-4B59-8F02-62125387E3F6@gmail.com>
 <20160805231747.768e6c08@free-electrons.com>
 <20160805212501.GB3009@haswell>
Message-ID: <20160805233033.41c43841@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 5 Aug 2016 14:25:01 -0700, Khem Raj wrote:

> Its just not kernel headers, infact its the kernel proper version as well
> which should be >= 3.2.0

Well, if your kernel headers are version X, surely you're running a
kernel >= X.

> you should also use --enable-kernel switch to detect the case where
> someone might be using older kernel with glibc 2.24 and running into
> issues at runtime.

As said above, we make the assumption that if kernel headers version X
were used, the user is running a kernel of version >= X.

> IMO BR should deprecate older versions more agressively, and keep them
> only on need basis. May be its against the objectives of the project
> but you will be spread thin supporting so many combinations and
> how to test them all.

We already deprecate older versions quite aggressively. We're currently
using glibc 2.23 (the latest until today), the latest uclibc-ng, the
latest musl. We haven't switched to gcc 5 as the default yet (we're on
gcc 4.9), but I'm planning on moving to gcc 5 as the default for the
next Buildroot release, i.e 2016.11.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
