From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Mar 2018 21:08:47 +0100
Subject: [Buildroot] [PATCH 2/2] apache init script
In-Reply-To: <CALURroQSLWQ1TD7gEf-KYqOg3Y8x9mZeo3DAkKd2-B=MZwO02g@mail.gmail.com>
References: <20180227115022.8802-1-chrismcc@gmail.com>
 <20180227221815.21afde38@windsurf.lan>
 <CALURroQSLWQ1TD7gEf-KYqOg3Y8x9mZeo3DAkKd2-B=MZwO02g@mail.gmail.com>
Message-ID: <20180302210847.48cd8e47@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 2 Mar 2018 09:08:06 -0800, Christopher McCrory wrote:

> I started with the idea of changing just enough of the included init script
> to get the daemon running.  I am used to the RedHat/Fedora sysv init
> system, not the debian/start-stop-daemon style.  I didn't want to snag some
> other init file using start-stop-daemon, replace a variable, and submit it
> as my own work.  I'd rather learn the nuances of start-stop-daemon and
> write a script that I understand and works as expected.

Well, we very much prefer to have init scripts that all follow the same
patterns, rather than init scripts that are all very different from
each other. Having similar init scriptss makes maintenance a lot easier
for us.

So please, re-use the same pattern as existing init scripts. You're not
stealing the work of anyone, because you're also contributing to
Buildroot, under the same license.

> After testing a few other packages, I noticed quite a few that don't have
> init scripts.  Is this by design?  I'd like to add the ability to generate
> an initscript within the buildroot system.  something like
> $PACKAGE_GENERATE_AND_INSTALL_SYSV_INIT_SCRIPT = YES # with a shorter name
> though :)
> in the package.mk file that would use a template to create a working init
> script. And a global toggle in makemenu -> Build Options to
> enable/disable.  yes? no? maybe?

Most init scripts have subtle nuances that make a completely
auto-generated init script mechanism not really desirable. I think we
prefer the dumb approach we have today.

However, patches adding init scripts to more packages are definitely
welcome.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
