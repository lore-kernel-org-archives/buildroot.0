From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:29:34 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/lzo: switch to cmake
In-Reply-To: <8e8ea34e-3224-667a-5693-70a565dc49b7@mind.be>
References: <20170820080744.8947-1-bernd.kuhls@t-online.de>
 <8e8ea34e-3224-667a-5693-70a565dc49b7@mind.be>
Message-ID: <20170821232934.016a4ce9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Aug 2017 21:35:30 +0200, Arnout Vandecappelle wrote:
> On 20-08-17 10:07, Bernd Kuhls wrote:
> > +LZO_SUPPORTS_IN_SOURCE_BUILD = NO  
> 
>  Why doesn't it support in-source build? Best to explain that in the commit message.

It's actually quite common for cmake packages to not support in-tree
build:

package/gnuradio/gnuradio.mk:GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
package/gr-osmosdr/gr-osmosdr.mk:GR_OSMOSDR_SUPPORTS_IN_SOURCE_BUILD = NO
package/jasper/jasper.mk:JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
package/lapack/lapack.mk:LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
package/lensfun/lensfun.mk:LENSFUN_SUPPORTS_IN_SOURCE_BUILD = NO
package/libcodec2/libcodec2.mk:LIBCODEC2_SUPPORTS_IN_SOURCE_BUILD = NO
package/libssh/libssh.mk:LIBSSH_SUPPORTS_IN_SOURCE_BUILD = NO
package/lzo/lzo.mk:LZO_SUPPORTS_IN_SOURCE_BUILD = NO
package/racehound/racehound.mk:RACEHOUND_SUPPORTS_IN_SOURCE_BUILD = NO
package/sysdig/sysdig.mk:SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
package/zxing-cpp/zxing-cpp.mk:ZXING_CPP_SUPPORTS_IN_SOURCE_BUILD = NO

and we've never really asked people to explain why. I wouldn't mind a
comment on top of the SUPPORTS_IN_SOURCE_BUILD = NO line in the .mk
file, but I'm not sure I want to make this absolutely necessary.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
