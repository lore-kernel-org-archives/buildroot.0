From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Aug 2014 09:26:54 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: remove devfiles from target
In-Reply-To: <53EA5148.1050903@je-eigen-domein.nl>
References: <1407605679-15342-1-git-send-email-bos@je-eigen-domein.nl>
 <b8f2dfad-6831-48d9-a7fa-c4775bbcf0a6@email.android.com>
 <53E74FAF.6000306@je-eigen-domein.nl>
 <CAAXf6LW2KLKO3836TUw+7BqFTcYBu=AjSvCHw9ff=jwx=sOCww@mail.gmail.com>
 <20140812185019.57322578@free-electrons.com>
 <53EA5148.1050903@je-eigen-domein.nl>
Message-ID: <20140813092654.54197f53@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Tue, 12 Aug 2014 19:39:20 +0200, Floris Bos wrote:

> > More precisely: it will simply not work. The <pkg>_CONFIG_SCRIPTS
> > mechanism assumes that the <pkg>-config files are shell scripts, in a
> > certain format. With an ELF executable compiled for the target:
> >
> >   1/ There's no way the <pkg>_CONFIG_SCRIPTS mechanism can work
> >
> >   2/ There's no real point in keeping this file on the build machine,
> >      because it's an executable built for the target.
> 
> Do wonder if we shouldn't provide a simple replacement script for 
> pg_config, e.g. just implementing "--includedir" and "--libdir"
> Might be less work than patching configure scripts that want to call 
> pg_config.

Yes, that's certainly an option. If there are many packages relying on
pg_config, it's going to be easier to provide a fake pg_config rather
than patching all those packages (such as PHP). Maybe even this
approach could be submitted for upstream inclusion in Postgresql?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
