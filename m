From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 23:47:41 +0200
Subject: [Buildroot] [PATCH 2/4 v3] package/kvm-unit-tests: introduce
 _ARCH_SUPPORTS
In-Reply-To: <20170710162056.GB3014@scaer>
References: <cover.1499592591.git.yann.morin.1998@free.fr>
 <996d1d52c27da1a7725ed425ac895c3a7b5b7301.1499592591.git.yann.morin.1998@free.fr>
 <20170710180949.764a0fdb@windsurf.lan>
 <20170710162056.GB3014@scaer>
Message-ID: <20170710234741.554c7a44@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 18:20:56 +0200, Yann E. MORIN wrote:

> > What about the x86_64 dependency on a host compiler >= 4.5 ?  
> 
> In the manual, it is said that one should not add a comment about a
> dependency on the host toolchain...

The manual says one thing, reality says another:

package/collectd/Config.in:comment "write_prometheus needs a toolchain w/ C++, host gcc >= 4.5"
package/cppcms/Config.in:comment "icu support needs a toolchain w/ gcc >= 4.8, host gcc >= 4.8"
package/icu/Config.in:comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8, host gcc >= 4.8"
package/kodi/Config.in:comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, locale, threads, wchar, dynamic library, gcc >= 4.8, host gcc >= 4.6"
package/mfgtools/Config.in.host:comment "mfgtools needs host gcc >= 4.8"
package/midori/Config.in:comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 4.9, host gcc >= 4.8"
package/php/Config.ext:comment "intl support needs a toolchain w/ C++, wchar, threads, gcc >= 4.8, host gcc >= 4.8"
package/protobuf-c/Config.in:comment "protobuf-c needs a toolchain w/ C++, threads, host gcc >= 4.5"
package/python-mwscrape2slob/Config.in:comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 4.8, host gcc >= 4.8"
package/python-pyicu/Config.in:comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.8, host gcc >= 4.8"
package/python-slob/Config.in:comment "python-slob needs a toolchain w/ C++, gcc >= 4.8, host gcc >= 4.8"
package/qt5/qt5base/Config.in:comment "icu support needs a toolchain w/ gcc >= 4.8, host gcc >= 4.8"
package/qt5/qt5webkit/Config.in:comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 4.8, host gcc >= 4.8"
package/riemann-c-client/Config.in:comment "riemann-c-client needs a toolchain w/ C++, threads, host gcc >= 4.5"
package/webkitgtk/Config.in:comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 4.9, host gcc >= 4.8"

I'm not sure why we would not add Config.in comment for dependencies on
the host toolchain. What's the reasoning for *not* adding such
dependencies ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
