From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Apr 2016 00:16:06 +0200
Subject: [Buildroot] [PATCH] core/help: fix custom help without a .config
In-Reply-To: <20160322235239.7a75f515@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 22 Mar 2016 23:52:39 +0100")
References: <1458509069-11960-1-git-send-email-yann.morin.1998@free.fr>
 <56F1C9D1.2010104@mind.be>
 <20160322235239.7a75f515@free-electrons.com>
Message-ID: <87h9f2frh5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > Instead, we require the custom help to be defined in its own file in the
 >> > br2-external tree. This way, we can safely include it unconditionally.
 >> 
 >> IMHO that custom help was a bad idea. It's adding complexity, an extra file in 
 >> BR2_EXTERNAL, and really not that useful...

 > Agreed. I'm not sure it's worth it. It's still time to revert if we
 > don't think it's a good idea. Peter?

 > Without this custom help thing, it is already possible to define some
 > custom make target in external.mk that will display some help. It won't
 > be available until a configuration is defined, but oh well, who reads
 > help texts anyway?

Yeah, I also think this adds too much complexity just for a pointer to
help text. I think we should drop it.

-- 
Venlig hilsen,
Peter Korsgaard 
