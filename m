From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Nov 2017 17:10:57 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <20171102232345.5a434af8@windsurf>
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-2-code@mmayer.net>
 <20171102230602.3c61e8d2@windsurf> <20171102221847.GA23314@scaer>
 <20171102232345.5a434af8@windsurf>
Message-ID: <20171103161057.GB3387@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-11-02 23:23 +0100, Thomas Petazzoni spake thusly:
> On Thu, 2 Nov 2017 23:18:47 +0100, Yann E. MORIN wrote:
> > >  - Same for the configuration file: I prefer a loud error than an init
> > >    script that ignores the problem.  
> > 
> > Agreed, too.
> > 
> > However:
> > 
> >   - if the config file is mandatory, then this should be a failure.
> > 
> >   - if the config file is optional, then it missing should be silently
> >     ignored and the service started nonetheless.
> 
> So you want explicitly handling for the "missing configuration file"
> situation in the init script?
> 
> I wanted to avoid explicit handling, and just let the daemon whine (or
> not) if its config file is missing.

The idea is that the script contains sensible defaults, but scans an
optional file (e.g. /etc/default.d/my-daemon.conf) that a user can
provide to override the defaults.

IIRC, that's what was discussed and concluded a while ago (2 years?).

I would like that users can change the behaviour of a service without
having to sed/replace the init script.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
