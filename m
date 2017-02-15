From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 09:58:00 +0100
Subject: [Buildroot] [PATCH 4/4] bctoolbox: disable rpath
In-Reply-To: <CAHXCMM+6jsq4k6p4Wcun5OhjUZVoL7nVjjEymHup4p5Kg1MkQw@mail.gmail.com>
References: <20170214224402.8785-1-joerg.krause@embedded.rocks>
 <20170214224402.8785-4-joerg.krause@embedded.rocks>
 <20170215052846.yxjzvhmsgdc3hy57@tarshish>
 <CAHXCMM+6jsq4k6p4Wcun5OhjUZVoL7nVjjEymHup4p5Kg1MkQw@mail.gmail.com>
Message-ID: <20170215095800.411ddf31@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 07:12:28 +0100, Samuel Martin wrote:

> For target package, I think we should not set/force this option by the
> infra because some packages may install some kind-of private libraries
> elsewhere than in /usr/lib and set RPATH to in their binaries to find
> them (e.g.: sudo or iptables, though they are cmake-based packages.).

Hum, I didn't think about this, and you're probably right. If
CMAKE_SKIP_RPATH skips *all* rpath information, including some custom
one like pointing to /usr/lib/<foo>/, then we have to keep it indeed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
