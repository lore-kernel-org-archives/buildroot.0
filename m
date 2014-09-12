From: Nathaniel Roach <nroach44@gmail.com>
Date: Fri, 12 Sep 2014 16:20:13 +0800
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140912101105.1e932cb8@free-electrons.com>
References: <20140912063012.AF99B100DEE@stock.ovh.net>
 <20140912101105.1e932cb8@free-electrons.com>
Message-ID: <5412ACBD.2030009@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/09/14 16:11, Thomas Petazzoni wrote:
> Hello,
> 
> Samuel, Anton, Nathaniel, Vicente, Peter, Bernd, please see below.
> 
> On Fri, 12 Sep 2014 08:30:12 +0200 (CEST), Thomas Petazzoni wrote:
> 
>>     x86_64 |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/ed2d4261aef005cd7a567bd01dd8e7c8a96aa2be/
> 
> Yet another bandwidthd issue in detecting libpng. Weird.
> 
> checking for png_read_info in -lpng... no
> configure: error: Bandwidthd requires but cannot libpng
> make: *** [/home/test/autobuild/instance-2/output/build/bandwidthd-v2.0.1-auto-r08/.stamp_configured] Error 1
> make: Leaving directory `/home/test/autobuild/instance-2/buildroot'
> 

This should be fixed by my patch that's in patchwork
(http://patchwork.ozlabs.org/patch/381899/)

The issue is configure can't check for libpng (in some cases) because
it's test fails when lz is not tested for. (Linking the libpng test
build fails due to -lz not being in LDFLAGS)

>>        arm |                 php-yaml-1.1.1 | NOK | http://autobuild.buildroot.net/results/a2d9e701494bdb5b1f3cf0e44b872c3665ac1186/
> 
> Yet another download issue. Nathaniel, can you have a look at what the file contains?
> 

Weird, that file doesn't exist anymore. Sounds like it was one I missed
before, and then got randomly picked to be removed. I don't believe I
have had any networking interruptions since that initial issue.

> Thanks,
> 
> Thomas
> 
