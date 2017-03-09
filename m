From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 23:02:05 +0100
Subject: [Buildroot] [PATCH 1/1] test-pkg: Extend the logfile with the
 first command as well
In-Reply-To: <20170309220044.GA3785@free.fr>
References: <1489072521-5514-1-git-send-email-benoit.allard@greenbone.net>
 <20170309213605.20997679@free-electrons.com>
 <20170309220044.GA3785@free.fr>
Message-ID: <20170309230205.3b1cdee5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Mar 2017 23:00:44 +0100, Yann E. MORIN wrote:

> > > -    if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
> > > +    if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then  
> > 
> > To be honest, I wasn't sure if we wanted > or >> here. It matters if
> > you restart the test-pkg command after fixing issues. Do you want
> > logfiles to contain the log of all previous builds, or just the current
> > build?
> > 
> > For now, I've applied your patch as-is, with just ">", which means the
> > logfile will only contain the output of the last build. It seems better
> > to me this way, but we'll see if other folks disagree.  
> 
> Using append-redirection is what we should have used here, because the
> logfile is already created a few lines above, for olddefconfig.

Hu? We're precisely changing the olddefconfig line in this patch. Am I
missing something?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
