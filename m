From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Thu, 07 Mar 2019 09:53:42 +0100
Subject: [Buildroot] [PATCH] package/openrc: new init package OpenRC
 (0.38.3)
In-Reply-To: <20190306181221.GS2721@scaer>
References: <20190228194415.7943-1-michal.lyszczek@bofc.pl>
 <befe78f5-d0b9-9f10-187d-26a918a6250c@mind.be>
 <20190305213858.GQ2721@scaer>
 <20190305232045.mylcl6l2ic26akxk@c-ml-p3510.redembedded.pl>
 <28627e2a-5cd9-dfb9-5825-bc6b294cba3b@mind.be>
 <20190306173639.GR2721@scaer> <20190306181221.GS2721@scaer>
Message-ID: <20190307085342.u5xsli32yepwft3j@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-03-06 19:12:21, Yann E. MORIN wrote:
> Micha?, Arnout, All,
> 
> On 2019-03-06 18:36 +0100, Yann E. MORIN spake thusly:
> > Maybe we're taking the problem in the wrong way, then?
> 
> And actually, I think we are. As per [0]:
> 
>     Since 0.25 OpenRC includes openrc-init, which can replace /sbin/init
> 
> Also, the 0.25 release notes contain:
> 
>     This version contains an OpenRC-specific implementation of init for
>     Linux which can be used in place of sysvinit or any other init process.
> 
> I checked, and it looks like this is still the case in OpenRC's master
> branch.
> 
> So, I believe we should aim for this solution, because it drastically
> simplifies things.

I did quick audit of openrc-init, it's *very* simple init. It starts openrc,
which starts all services, opens fifo to handle shutdown/reboot, and reaps
zombies. So it does what it really is suppose to do and I don't see a way for it
to crash once it's started. So I am ok with using openrc-init as PID1
/sbin/init
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190307/0a8ed584/attachment.asc>
