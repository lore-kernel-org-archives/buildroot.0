From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Aug 2014 18:50:19 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: remove devfiles from target
In-Reply-To: <CAAXf6LW2KLKO3836TUw+7BqFTcYBu=AjSvCHw9ff=jwx=sOCww@mail.gmail.com>
References: <1407605679-15342-1-git-send-email-bos@je-eigen-domein.nl>
 <b8f2dfad-6831-48d9-a7fa-c4775bbcf0a6@email.android.com>
 <53E74FAF.6000306@je-eigen-domein.nl>
 <CAAXf6LW2KLKO3836TUw+7BqFTcYBu=AjSvCHw9ff=jwx=sOCww@mail.gmail.com>
Message-ID: <20140812185019.57322578@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 10 Aug 2014 14:54:51 +0200, Thomas De Schampheleire wrote:

> >> Not entirely sure here, but isn't the better approach for pg_config to add
> >> it to POSTGRESQL_CONFIG_SCRIPTS? This will ensure the file is fixed up for
> >> staging usr, and removed from target automatically.
> >>
> >
> > Note that pg_config is an ELF executable compiled for the target
> > architecture, and not a text script that can be easily fixed up.
> 
> Ok, in this case adding it to POSTGRESQL_CONFIG_SCRIPTS may not be the
> best idea.

More precisely: it will simply not work. The <pkg>_CONFIG_SCRIPTS
mechanism assumes that the <pkg>-config files are shell scripts, in a
certain format. With an ELF executable compiled for the target:

 1/ There's no way the <pkg>_CONFIG_SCRIPTS mechanism can work

 2/ There's no real point in keeping this file on the build machine,
    because it's an executable built for the target.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
