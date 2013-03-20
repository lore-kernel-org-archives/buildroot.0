From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Mar 2013 23:58:22 +0100
Subject: [Buildroot] [git commit] package/connman: bump version to 1.11
In-Reply-To: <20130320222341.5e947d69@skate>
References: <20130301101142.D5D809ADCE@busybox.osuosl.org>
 <20130320222341.5e947d69@skate>
Message-ID: <201303202358.23129.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 20 March 2013 Thomas Petazzoni wrote:
> On Fri, 22 Feb 2013 23:46:32 +0100, Peter Korsgaard wrote:
> 
> > -CONNMAN_VERSION = 1.10
> > +CONNMAN_VERSION = 1.11
> 
> Seems like Connman 1.11 is not happy with some IPv6 issues:
> http://autobuild.buildroot.org/results/f99ae7af46c70f7c356b7771321511a42eb3694d/build-end.log.
> 
> Interestingly, the toolchain used here has IPv6 support. The toolchain
> is an internal toolchain, using 3.8 kernel headers, so pretty recent.

I tried building bridge-utils against this toolchain, and it fails with
the exact same error:

---8<---
In file included from ../libbridge/libbridge.h:24:0,
                 from brctl.c:25:
/home/ymorin/dev/buildroot/autobuild.tests/test/f99ae7af46c70f7c356b777132151
1a42eb3694d/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/inc
lude/linux/if_bridge.h:172:20: error: field 'ip6' has incomplete type
---8<---

So, it seems the UAPI split-up broke a few things... :-(

I'll dig to see if the upstreams have a fix (either as a new release, or
as a commit in their trees).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
