From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Sep 2016 14:14:11 +0200
Subject: [Buildroot] [PATCH]     add new library: libpugixml
In-Reply-To: <20160906120739.hf6sacfuyopg5sud@skynet.be>
References: <20160904210846.1332-1-theo.debrouwere@skynet.be>
 <20160905233027.404898ba@free-electrons.com>
 <20160906120739.hf6sacfuyopg5sud@skynet.be>
Message-ID: <20160909141411.45cf530d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 6 Sep 2016 14:07:39 +0200, Theo Debrouwere wrote:

> > The readme.txt is good enough as a license file.
> >   
> > > +LIBPUGIXML_INSTALL_STAGING = YES
> > > +
> > > +LIBPUGIXML_SUBDIR = scripts  
> > 
> > Hum, why?  
> 
> Is this about the SUBDIR option?
> 
> The CMakeLists.txt file is in a subfolder called scripts,
> so, it seems that I need this? Is there another option/setting?
> 
> Or should I add a comment about it?
> 
> I'm not sure what you are asking?

What confused me is that in the latest version of pugixml (i.e master
branch), the CMakeLists.txt is directly at the root of the project:

  https://github.com/zeux/pugixml

However, since you are packaging the 1.7 version, which is a bit older
than the master branch, the CMakeLists.txt is indeed inside the
scripts/ subdirectory:

  https://github.com/zeux/pugixml/tree/v1.7

So, it makes complete sense to use the SUBDIR option in this case. It's
just that I was confused when looking at the Github repository, as I
was looking at the master branch.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
