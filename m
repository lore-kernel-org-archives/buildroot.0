From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 17:59:09 +0200
Subject: [Buildroot] [PATCH] inadyn: fix init script and default config
 file
In-Reply-To: <55A52996.9090403@zacarias.com.ar>
References: <1436109171-30701-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <55A51BB2.4090304@zacarias.com.ar>
 <20150714171916.56ef4a3f@free-electrons.com>
 <55A52996.9090403@zacarias.com.ar>
Message-ID: <20150714175909.30648ed9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 14 Jul 2015 12:24:06 -0300, Gustavo Zacarias wrote:

> If you ship a config that starts up inadyn with user=test pass=test with 
> some X dyndns service that could potentially flood said service/server 
> with a bogus/useless setting.
> It might not matter with small usage scenarios, but if a firmware image 
> is shipped for some networking appliance which doesn't sanitize the 
> config then you've got a similar scenario to the NTP flood.

Ah, yes, I see. So maybe we should instead have:

ENABLED="no" 

in /etc/default/inadyn

and in the SXXinadyn, if ENABLED=="no", do something like:

Starting inadyn: SKIPPED

or something like that.

Thoughts?

> > But then if 'background' is in the config file, we will background it
> > twice. Since inadyn generates its own PID file, it might be OK, but
> > it's not that nice either.
> >
> > I think our init scripts are anyway done to work fine with our default
> > configuration files. If you change the configuration file, you have to
> > be ready to adjust init scripts as well I'd say, no?
> 
> I haven't tested the detail, but -b is probably the same as "background" 
> in the config and won't background twice (i'm talking of the inadyn -b 
> option, not backgrounding from start-stop-daemon).

Ah, you're talking about inadyn -b option, while I was thinking of the
start-stop-daemon option. Then it definitely makes sense, and I can get
rid of the background option in the example config file.

Sounds OK?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
