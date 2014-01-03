From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 3 Jan 2014 09:45:04 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-01-02
In-Reply-To: <20140103073007.E79CA101DFF@stock.ovh.net>
References: <20140103073007.E79CA101DFF@stock.ovh.net>
Message-ID: <20140103074504.GN6589@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Fri, Jan 03, 2014 at 08:30:07AM +0100, Thomas Petazzoni wrote:
>     xtensa |                libcgicc-3.2.12 | NOK | http://autobuild.buildroot.net/results/7ccbf088cac523f5cccc36d4b5edc3a45c670044/

The cause of this failure is that the static stdc++ library is not copied to 
the toolchain sysroot. Manually copying 
build/xtensa-buildroot-linux-uclibc/libstdc++-v3/src/.libs/libstdc++.a to 
staging/usr/lib fixes the problem. Can someone point me at the code that 
copies toolchain libraries to sysroot?

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
