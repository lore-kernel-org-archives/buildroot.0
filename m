From: Alvaro G. M. <alvaro.gamez@hazent.com>
Date: Thu, 19 Jan 2017 11:07:03 +0100
Subject: [Buildroot] [PATCH] package/libcap: fix build with gperf >= 3.1
In-Reply-To: <31db6b87-7aba-9335-0be9-5b99a9c4c6a1@gmail.com>
References: <20170117221723.10235-1-romain.naour@gmail.com>
 <20170118112249.uyk3bhcdzlt6ggcu@collins.gmr.ssr.upm.es>
 <20170118160150.t7e4xs7u3bscpjqd@collins.gmr.ssr.upm.es>
 <31db6b87-7aba-9335-0be9-5b99a9c4c6a1@gmail.com>
Message-ID: <20170119100703.y5lilo4pneopdrai@collins.gmr.ssr.upm.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 18, 2017 at 10:31:51PM +0100, Romain Naour wrote:
> Hi Alvaro,
> 
> Le 18/01/2017 ? 17:01, Alvaro G. M. a ?crit :
> > On Wed, Jan 18, 2017 at 12:22:49PM +0100, Alvaro G. M. wrote:
> > I don't know how to test the remaining bits: webkitgtk, qt5webkit, kodi
> > 
> > They all require libgtk3, but I can't select it:
> > *** libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend ***
> > 
> > What other things do I need to enable libgtk3?
> 
> Thanks for your investigation!
> 
> libgtk3 needs an OpenGL provider, you can use Mesa3d as OpenGL provider on x86
> with a Gallium driver.

Thank you! I've been able to select them now. However, cairo compilation
fails regarding OpenGL. I guess this is a bug on buildroot's cairo package?

checking whether cairo's OpenGLESv2 surface backend feature could be enabled... no (glesv2.pc nor OpenGL ES 2.0 headers not found)
configure: error:  OpenGLESv2 surface backend feature could not be enabled
package/pkg-generic.mk:206: recipe for target '/tmp/buildroot/output/build/cairo-1.14.8/.stamp_configured' failed
make: *** [/tmp/buildroot/output/build/cairo-1.14.8/.stamp_configured] Error 1

> 
> But since we need to fix several package like eudev and systemd, I would suggest
> to report this issue to gperf maintainer and see what he say.

Yes, I agree. My intuition says most people probably won't even know that
gperf has released a new version (3.0.4 was released in 2009), so maybe
gperf maintainer will want to set a default option to let it behave as
previous version, so it remains compatible.


I'll write to gperf mailing list and see what his opinions are on the
matter.


Best regards

-- 
Alvaro G. M.
