From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 9 Jul 2018 20:37:02 -0300 (BRT)
Subject: [Buildroot] [PATCH 7/8] rsyslog: update S01logging
In-Reply-To: <4b21a057-0fa7-6ff5-50c5-a0a23b9bf544@mind.be>
References: <20180709033134.22175-1-casantos@datacom.com.br>
 <20180709033134.22175-8-casantos@datacom.com.br>
 <4b21a057-0fa7-6ff5-50c5-a0a23b9bf544@mind.be>
Message-ID: <1872705899.2544317.1531179422549.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "DATACOM" <casantos@datacom.com.br>, "buildroot" <buildroot@buildroot.org>
> Cc: "ratbert90" <aduskett@gmail.com>
> Sent: Monday, July 9, 2018 7:05:30 PM
> Subject: Re: [Buildroot] [PATCH 7/8] rsyslog: update S01logging

> Note: subject is wrong s/rsyslog/syslog-ng/

OK.

[...]

>> +		# shellcheck disable=SC2086 # we need the word splitting
>> +		start-stop-daemon -b -S -q -p /var/run/syslog-ng.pid -x /usr/sbin/syslog-ng
>> -- -F $SYSLOG_NG_ARGS && \
> 
> Again, better let the daemon take care of backgrounding itself.
> 

As explained in the answer about rsyslogd, it prevents hanging the boot by
putting an "-F" in SYSLOG_NG_ARGS (in /etc/default/logging).

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
