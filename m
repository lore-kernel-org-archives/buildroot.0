From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Apr 2019 22:58:48 +0200
Subject: [Buildroot] [PATCH] linux: simplify LINUX_BUILD_CMDS
In-Reply-To: <20190408204832.GD23890@scaer> (Yann E. MORIN's message of "Mon, 
 8 Apr 2019 22:48:32 +0200")
References: <20190408202136.22944-1-thomas.petazzoni@bootlin.com>
 <20190408204832.GD23890@scaer>
Message-ID: <87k1g4gqnr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > On 2019-04-08 22:21 +0200, Thomas Petazzoni spake thusly:
 >> We currently do the Linux build as follows:
 >> 
 >> make <imagename>
 >> if modules enabled; make modules; fi
 >> 
 >> However, Clement L?ger recently reported that due to us not using the
 >> "all" target, the GDB scripts that the kernel can build when
 >> CONFIG_GDB_SCRIPTS is enabled are not built, since upstream kernel
 >> commit 67274c083438340ad16c1437caebc84e1253b224 (merged in v5.1) moved
 >> that logic to a separate scripts_gdb target, which is a dependency of
 >> the "all" target.
 >> 
 >> While we could add some more logic to explicit generate the
 >> "scripts_gdb" target, this logic would fail on Linux < 5.1 for which
 >> this make target doesn't exist.
 >> 
 >> So instead, let's simplify the build logic, and use:
 >> 
 >> make all <imagename>

 > While we are at simplifying: do we still need to specify imagename?

 > Isn't the image name either:
 >   - implicit for the architecture, or
 >   - specified as a config option in the linux configuration?

I'm not sure that is always the case, E.G. the uImage target is afaik
not built by "make all".

The patch itself looks good:

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
