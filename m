From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Jun 2014 21:13:57 +0000 (UTC)
Subject: [Buildroot] [Bug 7250] Cannot build with -std=c++11
In-Reply-To: <bug-7250-163@https.bugs.busybox.net/>
References: <bug-7250-163@https.bugs.busybox.net/>
Message-ID: <20140630211357.A4AA59B9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7250

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> 2014-06-30 21:13:55 UTC ---
Confirmed:

  - with a host gcc-4.8.3, this compiles fine:
      $ g++ -std=c++11 -c -o 5468.o 5468.cxx
  - with a crosstool-NG armv6 toolchain, compiles OK:
      $ armv6-rpi-linux-gnueabihf-g++ -std=c++11 -c -o 5468.o 5468.cxx
  - but fails with the Buildroot-built toolchain using gcc-4.8.3:
      $ arm-buildroot-linux-uclibcgnueabihf-g++ -std=c++11 -c -o 5468.o
5468.cxx
      ess.cxx: In function ?int main()?:
      ess.cxx:5:5: error: ?to_string? is not a member of ?std?
           std::to_string(0);
           ^

C++ expert, anyone? ;-)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
