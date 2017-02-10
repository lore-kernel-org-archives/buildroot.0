From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 10 Feb 2017 20:15:57 -0200 (BRST)
Subject: [Buildroot] [PATCH] util-linux: enable AUTORECONF
In-Reply-To: <1552883366.9888052.1486739768812.JavaMail.zimbra@datacom.ind.br>
References: <1486735300-25677-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1552883366.9888052.1486739768812.JavaMail.zimbra@datacom.ind.br>
Message-ID: <1611848288.9966568.1486764957118.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
> To: "Rahul Bedarkar" <rahul.bedarkar@imgtec.com>
> Cc: buildroot at buildroot.org
> Sent: Friday, February 10, 2017 1:16:08 PM
> Subject: Re: [Buildroot] [PATCH] util-linux: enable AUTORECONF

>> From: "Rahul Bedarkar" <rahul.bedarkar@imgtec.com>
>> To: buildroot at buildroot.org
>> Cc: "Rahul Bedarkar" <rahul.bedarkar@imgtec.com>, "Carlos Santos"
>> <casantos@datacom.ind.br>
>> Sent: Friday, February 10, 2017 12:01:40 PM
>> Subject: [PATCH] util-linux: enable AUTORECONF
> 
>> Commit 55a9737895cb ("util-linux: link scriptreplay with libm (for isnan)")
>> added two patches that touch configure.ac and Makemodule.am. But forgot
>> to enable AUTORECONF.
>> 
>> When AUTORECONF is disabled and configure.ac is patched, it looks like
>> make will detect change in timestamps and trigger reconfig. But it
>> later fails because of missing dependencies. To fix this, explicitly
>> enable AUTORECONF.
>> 
>> Fixes:
>>  http://autobuild.buildroot.net/results/544/544e8da290d40424ea3d1bffad7e0b8a566de495

[...]

> 
> I'd prefer to avoid autoreconf but looks like it is required, so,
> 
> Acked-by: Carlos Santos <casantos@datacom.ind.br>
> 
> I was unable to reproduce 544e8da290d40424ea3d1bffad7e0b8a566de495 on my
> machine (Fedora release 24). It can be related to the build environment.

Mystery solved: automake is installed on my machine, so /usr/bin/aclocal-1.15
is used when host-automake is not built.

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
