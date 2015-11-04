From: =?UTF-8?Q?Beno=c3=aet_Th=c3=a9baudeau?= <benoit@wsystem.com>
Date: Wed, 4 Nov 2015 11:24:20 +0100
Subject: [Buildroot] [PATCH v3 02/13] package/dhcp: systemd: rename
	environment file
In-Reply-To: <20151104111816.6c20529a@free-electrons.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-2-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <CAGduivynxFaA8G90N8B+E2pbSVWvMryWev80-r2_Z=gKzvjC5g@mail.gmail.com>
 <20151104111816.6c20529a@free-electrons.com>
Message-ID: <5639DCD4.8030203@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gabe, Maxime, all,

On 04/11/2015 11:18, Thomas Petazzoni wrote:
> On Wed, 4 Nov 2015 10:52:10 +0100, Maxime Hadjinlian wrote:
> 
>>> diff --git a/package/dhcp/dhcpd.service b/package/dhcp/dhcpd.service
>>> index 7b265cb..5989506 100644
>>> --- a/package/dhcp/dhcpd.service
>>> +++ b/package/dhcp/dhcpd.service
>>> @@ -7,7 +7,7 @@ Type=forking
>>>  PIDFile=/run/dhcpd.pid
>>>  ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $INTERFACES
>>>  KillSignal=SIGINT
>>> -EnvironmentFile=/etc/default/dhcpd.conf
>>> +EnvironmentFile=/etc/default/dhcpd
>>>
>> Maybe this should be:
>> EnvironmentFile-=/etc/default/dhcpd
> 
> On the dropbear package, Gabe Evans said it may not be such a good idea
> to do this EnvironmentFile thing.

Why? What was the rationale? What would be the alternatives?

> Can we settle on a common decision ?
> 
> (From my PoV, using this EnvironmentFile looked good as it would be a
> common mechanism between the systemd and Busybox/sysvinit cases to tune
> the configuration of services. But Gabe seemed to disagree.)
> 
> Could systemd people in Buildroot decide what to do ? :-)

Beno?t
