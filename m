From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Tue, 3 Dec 2013 12:12:28 -0600
Subject: [Buildroot] [RFC] makefile ?= behavior
In-Reply-To: <20131203152541.47e942be@skate>
References: <20131203073003.0FA7E1014F4@stock.ovh.net>
 <529DE4FE.8020900@imgtec.com> <529DE716.1000205@zacarias.com.ar>
 <20131203152541.47e942be@skate>
Message-ID: <OF1C1194FC.E790AAF4-ON86257C36.00633887-86257C36.00640499@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'd like to make sure I'm not loosing it :-)

So I have the package smcroute(https://github.com/troglobit/smcroute) (new 
package not yet in buildroot) and it is autotools based.  I do a configure 
with all the toolchain info and it sets up the Makefile to have the 
following CC definition.  This is the only location in the package 
Makefiles that set CC.
    CC ?= /opt/linux/linaro4.7/usr/bin/arm-linux-gnueabihf-gcc 

If I add an $(origin CC) to the default build "all" to see where CC is 
set.  It always returns "default" and is set to "cc".  So whenever I do a 
build in the package folder it uses cc instead of my ARM toolchain.  ie 
the build is using the make defaults.  If I disable the make defaults by 
doing a make -R then my CC value is used.

I believe that the ?= should just be a =, but in what cases would the ?= 
actually work?  I'm trying to put the story together to convince someone 
that believes it's just a environment issue...

Thanks,
Matt Weber
mlweber1 at rockwellcollins.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131203/388a38f4/attachment-0001.html>
