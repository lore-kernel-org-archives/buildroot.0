From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 2 Nov 2018 17:01:15 -0200 (BRST)
Subject: [Buildroot] [PATCH v3 2/8] busybox: add logging configuration
 file
In-Reply-To: <14a8b23d-ce2f-2d42-5ed3-c65eb6df0bd8@mind.be>
References: <20181007114605.18153-1-casantos@datacom.com.br>
 <20181007114605.18153-3-casantos@datacom.com.br>
 <14a8b23d-ce2f-2d42-5ed3-c65eb6df0bd8@mind.be>
Message-ID: <829805537.4906.1541185275271.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "DATACOM" <casantos@datacom.com.br>, "buildroot" <buildroot@buildroot.org>
> Cc: "ratbert90" <aduskett@gmail.com>, "Matthew Weber" <matthew.weber@rockwellcollins.com>, "Chris Packham"
> <judge.packham@gmail.com>
> Sent: Domingo, 21 de outubro de 2018 15:27:24
> Subject: Re: [PATCH v3 2/8] busybox: add logging configuration file

> On 07/10/2018 12:45, Carlos Santos wrote:
>> Provide a template to help users to customize syslogd and klogd without
>> editting the startup script.
>> 
>> syslogd options worth to configure are remote logging (-R), rotation
>> (-s, -b) and minimal priority level (-l).
>> 
>> klogd minimal priority level (-c) can be configured too, preventing
>> non-critical kernel messages from appearing on the console.
>> 
>> This file is also useful as an example for init script authors.
> 
> We also discussed this, and we agreed in the end that it is not very useful to
> have a default defaults file. It needlessly consumes space on the target, the
> user anyway probably has to consult documentation to know which options to use,
> and there is (usually) only one option that can be set in the file:
> <DAEMON>_ARGS. In addition, we can't expect all package authors to submit
> something that is of such a high quality as this example...

OK, I will drop the default files from the series.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
