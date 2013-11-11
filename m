From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 11:43:44 +0100
Subject: [Buildroot] [PATCH] alsa-lib: FLAT: Disable alsa lib when FLAT
 bianry is selected.
In-Reply-To: <528087D9.9060900@zacarias.com.ar>
References: <1384146177-6020-1-git-send-email-Sonic.adi@gmail.com>
 <20131111112128.60a4a348@skate> <528087D9.9060900@zacarias.com.ar>
Message-ID: <20131111114344.41cee073@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 11 Nov 2013 04:31:37 -0300, Gustavo Zacarias wrote:
> On 11/11/2013 07:21 AM, Thomas Petazzoni wrote:
> > I am not sure this is the right dependency. Shouldn't this instead be a:
> > 
> > 	depends on !BR2_PREFER_STATIC_LIB
> > 
> >  ?
> > 
> > The problem is really that we need shared library support, no that
> > specifically the FLAT binary format is causing problems. If another
> > binary format doesn't support shared libraries, then we would have to
> > exclude it as well.
> > 
> > Also, the configure script of alsa-lib has a check to verify if dlfcn.h
> > is available or not, so I guess it is supposed to fallback gracefully
> > to another solution if shared library support is not available.
> 
> And with that being said this depend should also propagate to all the
> packages that select alsa-lib too.

Which is why I'd like to have a deeper investigation on why alsa-lib
unconditionally need <dlfcn.h> :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
