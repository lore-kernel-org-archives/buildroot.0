From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 09:04:58 +0100
Subject: [Buildroot] [PATCH] libtool: Make libltdl a separate package
In-Reply-To: <b9799191-50f7-1fdf-90ab-c20822691b31@gmail.com>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111221717.0855ea32@windsurf.home>
 <56b213a9-830f-e08f-faba-401d7296e32c@mind.be>
 <20181112080642.GB10271@scaer>
 <b9799191-50f7-1fdf-90ab-c20822691b31@gmail.com>
Message-ID: <20181123090458.198c6852@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

On Thu, 22 Nov 2018 20:02:33 +0100, Alexander Sverdlin wrote:

> But it seems that HOST_LIBTOOL package is widely used and it would look awkward
> for me if we would build completely different stuff for LIBTOOL and HOST_LIBTOOL
> package variants.

We already do that for a few packages, where the host and target
variant don't install the same stuff. libglib2 is an example that comes
to mind for example, but there are others.

> I'd rather go with LIBTOOL_RUNTIME package (or indeed LIBLTDL?), I can merge it into
> libtool.mk and make all 4 target packages depend on it instead of full libtool.
> 
> What are your thoughts?

I think we really want what we suggested initially, i.e the target
libtool package only install libltdl.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
