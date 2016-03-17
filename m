From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Mar 2016 07:22:03 +0100
Subject: [Buildroot] [PATCH 4/4] lxc: remove dependency on headers >= 3.0
In-Reply-To: <56E9E2EC.9000203@mind.be> (Arnout Vandecappelle's message of
 "Wed, 16 Mar 2016 23:49:16 +0100")
References: <1458159611-5613-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458159611-5613-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <87twk66onk.fsf@dell.be.48ers.dk>
 <20160316233611.6c664973@free-electrons.com>
 <56E9E2EC.9000203@mind.be>
Message-ID: <87h9g57hf8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Well, it would work with old kernel headers, as long as the actual
 > kernel is > = 3.0. But the only use case for that would be when using
 > an old toolchain, e.g. Arago. It's probably safer indeed to avoid
 > runtime trouble by just depending on the headers version.

Yes, or if the kernel has the setns syscall backported - But as we
currently don't differ between build time (E.G. kernel headers) and
runtime (actual kernel), then that's all we can do.

And I don't think we should introduce the extra complexity to have
different symbols for kernel headers and runtime kernel versions.

-- 
Venlig hilsen,
Peter Korsgaard 
