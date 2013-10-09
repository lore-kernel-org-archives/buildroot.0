From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Oct 2013 10:58:54 +0200
Subject: [Buildroot] Qt 5.0.2 with OpenSSL
In-Reply-To: <CA+csPL6eKEBs3vT4G-Ayx7hUHeZwVvhT85UAsTUWDsmKHWt5LQ@mail.gmail.com>
References: <CA+csPL7n8=fX7LLyLE4uS4s4uXHTYoLyNVm66b6_Dj0k3N+p-Q@mail.gmail.com>
 <20131008104858.69c60676@skate>
 <CA+csPL5q=rYc_-Q4enRD07Pomj9A6hossAB9cesFnMNnLQv5GA@mail.gmail.com>
 <20131009095154.2d368292@skate>
 <CA+csPL6eKEBs3vT4G-Ayx7hUHeZwVvhT85UAsTUWDsmKHWt5LQ@mail.gmail.com>
Message-ID: <20131009105854.6957d8cc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Espen Frimann Koren,

On Wed, 9 Oct 2013 10:23:49 +0200, Espen Frimann Koren wrote:
> I lost the build log and when I did make clean, it worked :-)
> 
> The link errors did not relate to OpesSSL-libs, but to functions within Qt
> that should have been compiled/present when OpenSSL was enabled. Maybe it
> was a consequence of how I did the build:
> 
> 1. Built all without openssl
> 2. Added openssl and built again, but without clean
> 2.1 Qt is not rebuilt then
> 3. Ran make qt5base-dirclean && make qt5base-build because I needed more
> features in Qt
> 3.1 The link error is present
> 4. make clean && make
> 4.1 Everything builds fine.

Indeed such sequences are not guaranteed to work, but in this specific
case, I'm not sure to understand why it wouldn't work. I'll try to see
if I can reproduce the problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
