From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Nov 2019 15:39:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: hybrid cgroupfs
 hierarchy for docker compatibility
In-Reply-To: <CAFvCimUCex67b=3_NMgM=aWwfL=jSaJ00FFZ+o4=fHStXTpt2w@mail.gmail.com>
References: <20191111083348.3964650-1-christian@paral.in>
 <CADvTj4o4m-CSrPiJ_FSLKzUhxTKacMRVRKFjf99jUgCrLJKhrQ@mail.gmail.com>
 <CAFvCimUCex67b=3_NMgM=aWwfL=jSaJ00FFZ+o4=fHStXTpt2w@mail.gmail.com>
Message-ID: <20191111153905.59ab2f4c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Nov 2019 11:09:27 +0100
J?r?my ROSEN <jeremy.rosen@smile.fr> wrote:

> Keeping a list like that is going to be tricky...

You don't really have to keep a list. You can have a blind option:

config BR2_PACKAGE_SYSTEMD_NEEDS_HYBRID_HIERARCHY
	bool

systemd.mk would observe this boolean to enable (or not) the hybrid
hierarchy, and packages that need it would select this boolean.

That being said, is there any drawback in unconditionally using the
hybrid hierarchy? James, since you suggested to make it conditional, do
you have some arguments/feedback?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
