From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Jan 2017 08:48:12 +1100
Subject: [Buildroot] [RFC] external toolchain scanner
In-Reply-To: <fd01b978-5aea-2794-047c-968c7697b1bb@mind.be>
References: <303be768-557b-3b02-c4fd-ae11ec2858ec@mentor.com>
 <8037285d-a8b2-39c9-30c4-cba364583ae9@mentor.com>
 <20161208210228.GA27341@free.fr>
 <df15f689-fb98-5710-6c90-2ee0e5efb0be@mentor.com>
 <c542e7c5-39e9-5d1f-1611-63ad49d26371@mentor.com>
 <20170112173223.GA3716@free.fr>
 <ef0f8d40-903d-1859-aa45-d99b8fe49887@mentor.com>
 <fd01b978-5aea-2794-047c-968c7697b1bb@mind.be>
Message-ID: <20170116084812.5e7bafeb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Jan 2017 00:43:16 +0100, Arnout Vandecappelle wrote:

> * make menuconfig
> * make
>  -> error "Incorrect toolchain settings detected. An updated config file has  
> been generated in $(CONFIG_DIR)/config.toolchain. Copy it to
> $(CONFIG_DIR)/.config and run 'make menuconfig' to verify."
> * Copy
> * make menuconfig
> * make
> 
>  Or perhaps even better, add an option
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_AUTODISCOVER. This option would disable all the
> other options except BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS, and also disable all the
> other menus. This option would run the autodiscovery and overwrite the .config
> file (removing the CUSTOM_AUTODISCOVER option again). So it would force the
> following scenario:
> 
> * make menuconfig
> * make
> * make menuconfig
> * make
> 
>  But it's probably best to implement the first scenario and see where we go from
> there.

To be honest, I find all of this very complicated, and even more
confusing than what we have today. Using custom external toolchain is
already an "advanced" feature, which users just getting started with
Buildroot are unlikely to use. To me, using custom external toolchain
is a bit of an advanced functionality, and people who need that will
surely be able to understand the information they need to fill in
"menuconfig" to make Buildroot "accept" the toolchain.

> >> I would rather that we work toward this goal, which would be a
> >> termendous improvement on what we currently have.  
> > I agree that emitting 5 errors at once, rather than emitting 1 error a time for
> > 5 iterations, is an improvement on a disagreeable situation. I bet you can guess
> > what I'll say next, though: when you look at the bigger picture, we shouldn't be
> > in this situation to begin with. :-) When we already know the answers, we should
> > tell the user, not the other way around.  
> 
>  But perhaps that would be an easier first step. Instead of just reporting one
> single error, report all errors and the correct config options so the user can
> edit the .config file and add them.

Yes. *This* would be useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
