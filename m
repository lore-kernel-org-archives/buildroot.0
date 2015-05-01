From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 09:33:35 +0200
Subject: [Buildroot] [PATCH 7/8] configs: add defconfig for Atmel
 sama5d3 Xplained
In-Reply-To: <20150430151402.GG12076@piout.net>
References: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1430398311-10804-8-git-send-email-alexandre.belloni@free-electrons.com>
 <CAMQcK5+XSqStQkJTBQUwzsWvCjQk=Uq8Z5g0yP_p1TXqsQCoLg@mail.gmail.com>
 <20150430151402.GG12076@piout.net>
Message-ID: <20150501093335.7d7583d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexandre Belloni,

On Thu, 30 Apr 2015 17:14:02 +0200, Alexandre Belloni wrote:

> > 'linux-3.18-at91' appears to be a branch which means that it could be
> > updated and break this config?
> > 
> > I believe in order to ensure that a build is reproducible for everyone
> > that this should be a tag or commit SHA. This would also apply to all
> > your other new NAND configurations for the Atmel boards.
> 
> That is the expected behaviour. This branch must not break. I'm not
> saying it won't break but if it ever breaks, it will definitively be
> fixed.

No, please don't use a branch. Never ever. This makes the build
non-reproducible. And also means that once a
linux-linux-3.18-at91.tar.gz tarball has been created in $(DL_DIR), it
is never redownloaded even if the branch is updated.

So please do like Ryan said: use a tag or a commit ID. Feel free to
update this commit ID or tag as often as you want by sending patches,
but don't use a branch name.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
