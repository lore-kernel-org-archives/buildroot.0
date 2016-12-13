From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Dec 2016 23:08:40 +0100
Subject: [Buildroot] [PATCH v13 2/8] refpolicy: new package
In-Reply-To: <20161212232121.01e9059e@free-electrons.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
 <1477423570-15694-2-git-send-email-bryce.ferguson@rockwellcollins.com>
 <20161212232121.01e9059e@free-electrons.com>
Message-ID: <20161213230840.46d5abff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Dec 2016 23:21:21 +0100, Thomas Petazzoni wrote:

> > +REFPOLICY_DEPENDENCIES += host-m4 host-checkpolicy host-policycoreutils \
> > +	host-setools host-gawk host-python policycoreutils  
> 
> It's not clear to me why we need to have a build dependency on
> policycoreutils. Could you explain?

I checked by doing a build test: the target policycoreutils dependency
is not needed for build time, and it seems like the host-setools
dependency is also not needed.

Could you double check this, by doing a build which has *only*
refpolicy enabled and nothing else, and verify that the dependencies
are really necessary?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
