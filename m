From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Sep 2015 18:02:00 +0200
Subject: [Buildroot] [PATCHv4 1/2] udisks: bump to version 1.0.5
In-Reply-To: <55E7663F.2040802@mind.be>
References: <1441203680-29193-1-git-send-email-Vincent.Riera@imgtec.com>
 <55E7663F.2040802@mind.be>
Message-ID: <20150903180200.1bef81ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, 2 Sep 2015 23:12:31 +0200, Arnout Vandecappelle wrote:

>  However, I think it would be better to take a different approach here, because
> there will be more packages with this requirement (we already have libmbim now,
> but there are probably more that we haven't detected yet because we don't have
> systemd in the autobuilders).
> 
>  So I think there should be either a new virtual package or a suboption of udev
> to handle the libgudev case.

The problem is you make a virtual package is that then you must use a
"depends on": you cannot "select" a virtual package, at least if you
use the normal virtual package mechanism and Config.in description.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
