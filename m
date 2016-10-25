From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Oct 2016 13:45:02 +0200
Subject: [Buildroot] [PATCH 0/6] xorg: fix imput drivers install paths
In-Reply-To: <20161025133942.7613a6cb@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 25 Oct 2016 13:39:42 +0200")
References: <cover.1477327063.git.yann.morin.1998@free.fr>
 <87funkllfh.fsf@dell.be.48ers.dk>
 <20161025133942.7613a6cb@free-electrons.com>
Message-ID: <87bmy8lkjl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Sounds sensible to me. Did you try proposing the patches upstream?

 > Yes, Yann was about to do this, we were discussing his cover letter for
 > upstream yesterday evening.

Ok, great.

 >> This seems to overlap with the checks Samuel is adding,
 >> E.G. TARGET_DIR/STAGING_DIR are subdirs of the host build directory, so
 >> that check should catch these issues as well.

 > Hum, are you sure it's checking the same thing? Yann is checking that
 > $(TARGET_DIR)/$(O) and $(STAGING_DIR)/$(O) don't exist.

I was of the understanding that this was what the proposed
leak-of-host-paths check was supposed to check, yes. Samuel?

-- 
Venlig hilsen,
Peter Korsgaard 
