From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jul 2015 12:24:06 -0300
Subject: [Buildroot] [PATCH] inadyn: fix init script and default config
 file
In-Reply-To: <20150714171916.56ef4a3f@free-electrons.com>
References: <1436109171-30701-1-git-send-email-thomas.petazzoni@free-electrons.com>	<55A51BB2.4090304@zacarias.com.ar>
 <20150714171916.56ef4a3f@free-electrons.com>
Message-ID: <55A52996.9090403@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/07/15 12:19, Thomas Petazzoni wrote:

>> You definitely don't want this, if it's not configured and requires
>> configuration for any sane usage let it be so.
>> You don't want to do this kind of thing by default:
>> https://en.wikipedia.org/wiki/NTP_server_misuse_and_abuse
>
> Hu? What's the relation between NTP server misuse and Inadyn which is a
> tool that updates a DynDNS entry with your IP address? Am I missing
> something?

If you ship a config that starts up inadyn with user=test pass=test with 
some X dyndns service that could potentially flood said service/server 
with a bogus/useless setting.
It might not matter with small usage scenarios, but if a firmware image 
is shipped for some networking appliance which doesn't sanitize the 
config then you've got a similar scenario to the NTP flood.

> But then if 'background' is in the config file, we will background it
> twice. Since inadyn generates its own PID file, it might be OK, but
> it's not that nice either.
>
> I think our init scripts are anyway done to work fine with our default
> configuration files. If you change the configuration file, you have to
> be ready to adjust init scripts as well I'd say, no?

I haven't tested the detail, but -b is probably the same as "background" 
in the config and won't background twice (i'm talking of the inadyn -b 
option, not backgrounding from start-stop-daemon).
Regards.
