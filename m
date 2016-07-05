From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 08:16:44 +0200
Subject: [Buildroot] [PATCH v3 2/6] Add documentation for merged
 defconfigs
In-Reply-To: <20160705060625.GB27663@tungsten.ozlabs.ibm.com>
References: <cover.1467176798.git.sam.bobroff@au1.ibm.com>
 <fb148ddadbc12c9a9437192761ba342237a27325.1467176798.git.sam.bobroff@au1.ibm.com>
 <489e6359-291e-5920-87d6-da23fe8c5d0a@smile.fr>
 <20160705060625.GB27663@tungsten.ozlabs.ibm.com>
Message-ID: <20160705081644.6fd47292@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

On Tue, 5 Jul 2016 16:06:25 +1000, Sam Bobroff wrote:

> > Instead we recommend to use merge_config.sh from outside of Buildroot to
> > generate the merged defconfig before calling make. Maybe we should add some
> > documentation in the manual to explain how to use it.  
> 
> That seems fine, it might even be possible to add something to
> $(BR2_EXTERNAL)/external.mk to hook it directly into the Makefiles.
> 
> Could you elaborate a bit on what you mean by using merge_config.sh outside of
> buildroot? Would the fragment files still be checked into buildroot somewhere
> (but just not hooked into the build system) or would they be maintained outside
> it?

The idea is that Buildroot just takes as input a configuration file.
How this configuration file is provided/generated is not Buildroot's
responsibility.

For example, you could have in your BR2_EXTERNAL tree a bunch of
defconfig fragments, and then a "genconfig" shell script to generate the
final configuration you want to build using the defconfig fragments.
This "genconfig" script relies on merge_config.sh to actually merge the
relevant fragments together.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
