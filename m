From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 17:29:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/gettext-tiny: Add new package
In-Reply-To: <87r2irvljb.fsf@tkos.co.il>
References: <20180821142226.2309-1-vadim4j@gmail.com>
 <87r2irvljb.fsf@tkos.co.il>
Message-ID: <20180821172913.1a7eb830@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, Vadim,

On Tue, 21 Aug 2018 17:31:20 +0300, Baruch Siach wrote:

> > gettext-tiny provides lightweight replacements for tools typically used
> > from the GNU gettext suite, which is incredibly bloated and takes a lot
> > of time to build (in the order of an hour on slow devices). the most
> > notable component is msgfmt which is used to create binary translation
> > files in the .mo format out of textual input files in .po format. this
> > is the most important tool for building software from source, because it
> > is used from the build processes of many software packages.  
> 
> Thanks. gettext is indeed a huge CPU cycles drain.

Agreed, I was looking forward to someone taking over the task of
packaging gettext-tiny. So thanks Vadim for taking on this task!

However, packaging gettext-tiny requires a lot more than just creating
a package for it. Indeed, how do you select whether you want to use
gettext or gettext-tiny ? There should be some global knob that defines
that, and which affects the TARGET_NLS_DEPENDENCIES variable.

And then, there's the case of packages that need gettext even when NLS
support is disabled.

So: a big YES to adding gettext-tiny in Buildroot, but we want a proper
clean integration, not just a separate package. Vadim: you can read
https://buildroot.org/downloads/manual/manual.html#_gettext_integration_and_interaction_with_packages
to learn a bit about the current gettext integration in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
