From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Jul 2017 01:12:35 +0200
Subject: [Buildroot] [PATCH v1] qt-webkit-kiosk: fix icu/qt5webkit
 dependecy propagation
In-Reply-To: <20170727192431.6896-1-ps.report@gmx.net>
References: <20170727192431.6896-1-ps.report@gmx.net>
Message-ID: <13730e58-2e77-c52e-dbcb-74d92a16279b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-07-17 21:24, Peter Seiderer wrote:
> ICU depends on BR2_HOST_GCC_AT_LEAST_4_8 and BR2_TOOLCHAIN_GCC_AT_LEAST_4_8,
> this dependencies are propagated to qt5webkit but where not propagated to
> qt-webkit-kiosk.
> 
> Fixes [1]:
> 
>   The WebKit build was disabled for the following reasons:
>       * ICU is required.
>   [...]
>   cp -dpf .../host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libQt5WebKit*.so.* .../target/usr/lib
>   cp: cannot stat `.../host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libQt5WebKit*.so.*': No such file or directory
> 
> [1] http://autobuild.buildroot.net/results/2f3/2f381967c82775ad911a246a9607034ef489c1ce
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>


 Applied to master with a few changes, thanks.

[Arnout:
 - rewrap commit message
 - fix spelling mistakes in commit message
 - reformulate the dependency comments]

 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
