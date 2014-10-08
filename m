From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 08 Oct 2014 14:36:17 -0300
Subject: [Buildroot] [PATCH 2/5] zsh: security bump to version 5.0.7
In-Reply-To: <87a956eadv.fsf@dell.be.48ers.dk>
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>	<1412774389-11297-2-git-send-email-gustavo@zacarias.com.ar>
 <87a956eadv.fsf@dell.be.48ers.dk>
Message-ID: <54357611.2050005@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/2014 02:31 PM, Peter Korsgaard wrote:

> Sigh, what is it about shells for the moment?
> 
> Same comment as for dash, who should "win" the /bin/sh symlink?
> 
> maybe busybox -> dash -> zsh -> bash?

Forgot to cc the list ;)
It's not really/only a matter of which one wins, it's an init system
nightmare that i'm solving.
Say you've got:

busybox-init + some better shell = the better shell should win.
sysvinit + busybox + some better shell = same as above
sysvinit + no busybox + some better shell = oops since there's no /bin/sh

I don't care which of the better is "betterer", it's pretty subjective,
i just want the crazy combinations to work :)
Of course there's sysvinit + no busybox + no shell but that's another
problem.

Regards.
