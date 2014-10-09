From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Oct 2014 13:54:27 +0200
Subject: [Buildroot] Problems with uClicbc and libc.so.6
In-Reply-To: <CA+TH9VnNeLUgYs5yahr3FNz6+bcz8A_KR_6390kcWUXv7LVxOA@mail.gmail.com>
References: <CA+TH9VnNeLUgYs5yahr3FNz6+bcz8A_KR_6390kcWUXv7LVxOA@mail.gmail.com>
Message-ID: <20141009135427.63f010b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 9 Oct 2014 12:35:38 +0200, Angelo Compagnucci wrote:

> I'm having hard times with some software packages I'm adding to
> buildroot. When choosing uClibc, libc.so.6 is missing, so a lot of
> software doesn't work.

If something depends on libc.so.6, it means it was built against glibc,
and cannot work against uClibc. So either it's something built from
source, and you should rebuilt it with the uClibc toolchain. Or it's
something available as a pre-built binary for which you don't have the
source, in which case you have no other choice than using glibc.

> Right now I'm mostly working on my mono package, it works well with
> glibc, but when compiled with uClibc, this is the error:
> 
> Unhandled Exception:
> System.Net.WebException: An error occurred performing a WebClient
> request. ---> System.DllNotFoundException: libc.so.6
> 
> Clearly, making a soft link between libc.so.0 and libc.so.6 makes
> things working again. I'm on the master git branch.

I am a bit surprised that it works. It is in any case completely wrong,
and there is absolutely no guarantee that uClibc and glibc are ABI
compatible.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
