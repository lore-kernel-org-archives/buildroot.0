From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Tue, 09 Dec 2014 22:35:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: let init script
 cleanup stale pidfile
In-Reply-To: <548755B0.6020002@zacarias.com.ar>
References: <1416068836-4053-1-git-send-email-jkrause@posteo.de>
 <548755B0.6020002@zacarias.com.ar>
Message-ID: <1418160957.1422.38.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Di, 2014-12-09 at 17:04 -0300, Gustavo Zacarias wrote:
> On 11/15/2014 01:27 PM, J?rg Krause wrote:
> 
> > dnsmasq does not clean up its pidfile after termination. Do this manually.
> > 
> > Supersedes: [PATCH 1/1] package/dnsmasq: cleanup run-time files in init script
> > https://patchwork.ozlabs.org/patch/411015/
> 
> Hi.
> Does it fix anything in particular other than looks?
> Looking at the dnsmasq source it does an unlink() on successful
> startup/fork so any previous pidfile doesn't bother it at all.
> I was about to say "i'd like to see the start-stop-daemon invocation
> changed" but then i realized that it doesn't remove the pidfile either,
> so basically any "start-stop-daemon -K -q -x" in any initscript
> "suffers" from this "problem".
> So even if the pidfile is on permanent storage i don't see how this can
> cause issues.
> Regards.
> 

I want to check in a script if the dnsmasq daemon is running by testing
for the existence of the pid file.
