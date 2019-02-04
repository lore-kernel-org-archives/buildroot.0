From: Carlos Santos <casantos@datacom.com.br>
Date: Sun, 3 Feb 2019 22:27:48 -0200 (BRST)
Subject: [Buildroot] [PATCH v5] package/ntp: sntp time sync script
In-Reply-To: <b30f789e-46c6-b695-cb48-990624424f4d@mind.be>
References: <1544586337-7888-1-git-send-email-matthew.weber@rockwellcollins.com>
 <b30f789e-46c6-b695-cb48-990624424f4d@mind.be>
Message-ID: <1438353593.5225109.1549240068747.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Matthew Weber" <matthew.weber@rockwellcollins.com>, "buildroot" <buildroot@buildroot.org>
> Cc: "Oscar Gomez Fuente" <oscargomezf@gmail.com>, "Carlos Santos" <casantos@datacom.ind.br>
> Sent: Domingo, 3 de fevereiro de 2019 18:00:33
> Subject: Re: [Buildroot] [PATCH v5] package/ntp: sntp time sync script

> Hi Matt,
> 
> I've finally applied to master since it really is a useful feature and it
> works. However, I have a few additional remarks. Also one for Carlos, the init
> script dude :-)
> 
> On 12/12/2018 04:45, Matt Weber wrote:
> [snip]
>> +#!/bin/sh
>> +
>> +DAEMON="sntp"
> 
> Carlos, I'm starting to doubt the usefulness of this DAEMON variable. Other
> variables are prefixed by SNTP_, only this one isn't. In other init scripts you
> started using PROGRAM instead because it isn't actually a daemon.
> 
> However, the only reason to make it a variable is to make it easier to copy and
> adapt an existing init script. But really, doing a search/replace of that string
> is not so much work. And you anyway need to review the entire file, e.g.
> /usr/bin/$DAEMON is used which may not be correct.
> 
> So I'd propose to replace DAEMON with a direct reference to the program. What
> do you think?

DAEMON can be useful sometime in the future if we homogenize the scripts
so well that we can use a template that is sourced after setting a small
of variables (DAEMON, DAEMON_ARGS, PIDFILE, and so on). Perhaps we should
use an EXECFILE variable instead of /usr/bin/$DAEMON.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
