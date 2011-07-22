From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Jul 2011 09:09:29 +0200
Subject: [Buildroot] [PATCH 2/2] ipset: new package
In-Reply-To: <1311277797-20347-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 21 Jul 2011 16:49:57 -0300")
References: <1311277797-20347-1-git-send-email-gustavo@zacarias.com.ar>
 <1311277797-20347-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878vrqzt92.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add ipset support package.
 Gustavo> Note that this requires bleeding edge (>=2.6.39) kernel version or
 Gustavo> patches.

It needs largefile support (for libmnl) and pkg-config to get the
PKG_CHECK_MODULES macro expanded:

./configure: line 10804: syntax error near unexpected token `libmnl,'
./configure: line 10804: `PKG_CHECK_MODULES(libmnl, libmnl >= 1)'

Please do test build your patches in minimal configurations to catch
this.

-- 
Bye, Peter Korsgaard
