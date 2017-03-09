From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Mar 2017 23:05:37 +0100
Subject: [Buildroot] [PATCH 1/1] test-pkg: Extend the logfile with the
 first command as well
In-Reply-To: <20170309230205.3b1cdee5@free-electrons.com>
References: <1489072521-5514-1-git-send-email-benoit.allard@greenbone.net>
 <20170309213605.20997679@free-electrons.com>
 <20170309220044.GA3785@free.fr>
 <20170309230205.3b1cdee5@free-electrons.com>
Message-ID: <20170309220537.GB3785@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-09 23:02 +0100, Thomas Petazzoni spake thusly:
> On Thu, 9 Mar 2017 23:00:44 +0100, Yann E. MORIN wrote:
> > > > -    if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
> > > > +    if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then  
> > > 
> > > To be honest, I wasn't sure if we wanted > or >> here. It matters if
> > > you restart the test-pkg command after fixing issues. Do you want
> > > logfiles to contain the log of all previous builds, or just the current
> > > build?
> > > 
> > > For now, I've applied your patch as-is, with just ">", which means the
> > > logfile will only contain the output of the last build. It seems better
> > > to me this way, but we'll see if other folks disagree.  
> > 
> > Using append-redirection is what we should have used here, because the
> > logfile is already created a few lines above, for olddefconfig.
> 
> Hu? We're precisely changing the olddefconfig line in this patch. Am I
> missing something?

It looks liek I borked something when rebasing my remaining patches...

I'll double-check. Sorry for the noise...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
