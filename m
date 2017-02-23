From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:31:59 +0100
Subject: [Buildroot] [PATCH next] gdk-pixbuf: copy loaders.cache later on
In-Reply-To: <20170223222256.56f506fe@free-electrons.com>
References: <20170223194448.3785-1-gustavo@zacarias.com.ar>
 <20170223222256.56f506fe@free-electrons.com>
Message-ID: <20170223223159.17430a35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 22:22:56 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 23 Feb 2017 16:44:48 -0300, Gustavo Zacarias wrote:
> > Trying to copy loaders.cache from host-gdk-pixbuf to the gdk-pixbuf
> > build directory in the post-patch hook is too early when using TLP (it
> > breaks horribly) since host-gdk-pixbuf isn't built yet during the
> > massive unpack/patch cycle.
> > Switch it to the pre-build hook instead which ensures that gdk-pixbuf
> > dependencies were already built.
> > 
> > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>  
> 
> Since the first pat

Sorry for this e-mail sent by mistake.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
