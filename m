From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 23:23:45 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <20171102221847.GA23314@scaer>
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-2-code@mmayer.net>
 <20171102230602.3c61e8d2@windsurf> <20171102221847.GA23314@scaer>
Message-ID: <20171102232345.5a434af8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 23:18:47 +0100, Yann E. MORIN wrote:

> >  - Same for the configuration file: I prefer a loud error than an init
> >    script that ignores the problem.  
> 
> Agreed, too.
> 
> However:
> 
>   - if the config file is mandatory, then this should be a failure.
> 
>   - if the config file is optional, then it missing should be silently
>     ignored and the service started nonetheless.

So you want explicitly handling for the "missing configuration file"
situation in the init script?

I wanted to avoid explicit handling, and just let the daemon whine (or
not) if its config file is missing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
