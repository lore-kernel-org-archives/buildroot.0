From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 17:19:16 +0200
Subject: [Buildroot] [PATCH] inadyn: fix init script and default config
 file
In-Reply-To: <55A51BB2.4090304@zacarias.com.ar>
References: <1436109171-30701-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <55A51BB2.4090304@zacarias.com.ar>
Message-ID: <20150714171916.56ef4a3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Tue, 14 Jul 2015 11:24:50 -0300, Gustavo Zacarias wrote:
> 
> 
> On 05/07/15 12:12, Thomas Petazzoni wrote:
> 
> >   * Fix the configuration file to use an existing dyndns_system and
> >     avoid a failure at startup.
> 
> You definitely don't want this, if it's not configured and requires 
> configuration for any sane usage let it be so.
> You don't want to do this kind of thing by default:
> https://en.wikipedia.org/wiki/NTP_server_misuse_and_abuse

Hu? What's the relation between NTP server misuse and Inadyn which is a
tool that updates a DynDNS entry with your IP address? Am I missing
something?

> Also trusting that 'background' is in the config doesn't seem foolproof 
> either, dropping it and adding -b to the initscript sounds better to me.

But then if 'background' is in the config file, we will background it
twice. Since inadyn generates its own PID file, it might be OK, but
it's not that nice either.

I think our init scripts are anyway done to work fine with our default
configuration files. If you change the configuration file, you have to
be ready to adjust init scripts as well I'd say, no?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
