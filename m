From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 May 2018 11:16:04 +0200
Subject: [Buildroot] [PATCH v2] package/mender: new package
In-Reply-To: <CA+_SqVYNqhb6pAc6wzaf4v79D+Jn9YruJjWhaNJL9NJ-jmc05A@mail.gmail.com>
References: <1525384358-26211-1-git-send-email-angelo@amarulasolutions.com>
 <20180504092346.6b5835db@windsurf>
 <CA+_SqVYNqhb6pAc6wzaf4v79D+Jn9YruJjWhaNJL9NJ-jmc05A@mail.gmail.com>
Message-ID: <20180504111604.37f6f0e5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 May 2018 11:09:52 +0200, Angelo Compagnucci wrote:

> > Not a complete review by far, but I'm wondering if it makes sense to
> > include server certificates in Buildroot. I would assume that one would
> > want to generate his own certificate instead, no ?  
> 
> It's a test certificate just to starting up. The same file is included
> in the official yocto package so I thought it could useful to have
> here.

Ah, OK. Then perhaps it is fine to have this test certificate as well.

> > Is there anything that makes mender tied to systemd, other than the
> > fact that you provide only a systemd mender.service, and no init
> > script ?  
> 
> Mender depends on systemd stating to the requirements here
> https://docs.mender.io/1.4/devices/system-requirements

I'm wondering whether this is a real dependency (i.e they are linked
with systemd libraries), or whether it is just that they have only
tested their integration with systemd.

But OK, if they advertise this as a dependency, it's reasonable to have
that as well in Buildroot. It can be relaxed later on if someone is
interested in using Mender in a non-systemd system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
