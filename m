From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 09:25:40 +0100
Subject: [Buildroot] [PATCH 2/2] package/babeltrace: enable debug info
 support for the host variant
In-Reply-To: <CAB4xu_2PJ2gf1+fNhbHvrHKTUeg3H_Lb0ADMrdywxK0tKphgrw@mail.gmail.com>
References: <20161031074624.7576-10-eeppeliteloop@gmail.com>
 <1477918137-25258-2-git-send-email-yann.morin.1998@free.fr>
 <20161102232930.61516f88@free-electrons.com>
 <CAB4xu_2PJ2gf1+fNhbHvrHKTUeg3H_Lb0ADMrdywxK0tKphgrw@mail.gmail.com>
Message-ID: <20161103092540.29ee969f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Nov 2016 19:07:11 -0400, Philippe Proulx wrote:

> > Since the dependency on elfutils is not mandatory, do we really want to
> > force building the support of debug info?  
> 
> Ideally, no. I guess we should use the same strategy as for the target package.

Except we don't have Config.in options for host packages, and even if
we plan to add such options, we clearly don't want to add *visible*
options for every host package.

So for the host-lttng-babeltrace, the only solution would be to have a
sub-option to enable debug info support. But that would make it handled
differently than the debug info dependency for the target
lttng-babeltrace.

I don't really have a good answer here, I'm afraid.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
