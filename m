From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 6 Nov 2018 22:31:14 -0200 (BRST)
Subject: [Buildroot] [PATCH v4 1/4] busybox: rewrite logging init script
In-Reply-To: <92747f04-1c9a-48d0-9649-228fc490df33@mind.be>
References: <20181103182427.11738-1-casantos@datacom.com.br>
 <20181103182427.11738-2-casantos@datacom.com.br>
 <CANQCQpbwfJLYkXZhp6jK4TGFT87PTZe7haPof-WQsjpFckxe=Q@mail.gmail.com>
 <92747f04-1c9a-48d0-9649-228fc490df33@mind.be>
Message-ID: <611772159.535678.1541550674151.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Matthew Weber" <matthew.weber@rockwellcollins.com>, "DATACOM" <casantos@datacom.com.br>
> Cc: "ratbert90" <aduskett@gmail.com>, "buildroot" <buildroot@buildroot.org>
> Sent: Ter?a-feira, 6 de novembro de 2018 22:14:42
> Subject: Re: [Buildroot] [PATCH v4 1/4] busybox: rewrite logging init script

> On 05/11/18 14:57, Matthew Weber wrote:
> 
>> I can see this naming change will cause a number of people to end up
>> debugging their targets as a custom S01logging will be copied over and
>> then the installs of the new files with different names below.  Is
>> there any thoughts on making this a visible or obvious change so users
>> don't get caught up?
> 
> The best we can doe is to mention it in the release notes.
> 
> [snip]
>> What's the impact of someone restarting syslogd without stoping klogd first?
> 
> That shouldn't affect klogd, as far as I understand, because klogd uses
> standard syslog().

In the case of a restart the klog messages (all syslog() calls, in fact)
will be sent to the system console for a short period.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
