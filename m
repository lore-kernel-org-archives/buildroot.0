From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 12:01:51 +0100
Subject: [Buildroot] [PATCH] Config.in: add BR2_DL_DIR_OPTS
In-Reply-To: <20181101090616.GQ28575@scaer>
References: <20181031213930.49837-1-mmayer@broadcom.com>
 <20181101090616.GQ28575@scaer>
Message-ID: <20181101120151.4d8e4055@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 1 Nov 2018 10:06:16 +0100, Yann E. MORIN wrote:

> On 2018-10-31 14:39 -0700, Markus Mayer spake thusly:
> > Provide a simple mechanism to pass extra arguments to "mkdir" when
> > creating download directories. This can be helpful if one needs the
> > download directories to be writable multiple users ("shared download
> > cache").  
> 
> In retrospect, I think our enforcing of umask globally is wrong.
> 
> It was added in commit bee5745ccc2 (Makefile: don't depend on the umask)
> under the requirements that modes in target/ be predicatble.
> 
> Although that is indeed a good reason, I think we should have instead
> ensured those modes with a plain chmod on target/ during the
> target-finalize step.

But is it possible to have a plain "chmod" on target/ that will
properly preserve whatever packages have decided to use as permissions
when installing files ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
