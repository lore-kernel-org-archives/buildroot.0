From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 13:39:42 +0200
Subject: [Buildroot] [PATCH 0/6] xorg: fix imput drivers install paths
In-Reply-To: <87funkllfh.fsf@dell.be.48ers.dk>
References: <cover.1477327063.git.yann.morin.1998@free.fr>
 <87funkllfh.fsf@dell.be.48ers.dk>
Message-ID: <20161025133942.7613a6cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 13:25:54 +0200, Peter Korsgaard wrote:

>  > We fix that by entirely ditching the use of sdkdir, as was done in all
>  > other xorg dirvers, with the 5 first patches of the series.  
> 
> Sounds sensible to me. Did you try proposing the patches upstream?

Yes, Yann was about to do this, we were discussing his cover letter for
upstream yesterday evening.

>  > Additionally, to catch such situation, the 6th and last patch of the
>  > series checks no such paths are present, neither in target/ nor in
>  > staging/ .  
> 
> This seems to overlap with the checks Samuel is adding,
> E.G. TARGET_DIR/STAGING_DIR are subdirs of the host build directory, so
> that check should catch these issues as well.

Hum, are you sure it's checking the same thing? Yann is checking that
$(TARGET_DIR)/$(O) and $(STAGING_DIR)/$(O) don't exist.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
