From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Jul 2020 10:12:27 +0200
Subject: [Buildroot] [PATCH 08/11] package/pkg-generic.mk: detect files
 overwritten in TARGET_DIR and HOST_DIR
In-Reply-To: <20200725071340.GL2296@scaer> (Yann E. MORIN's message of "Sat,
 25 Jul 2020 09:13:40 +0200")
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
 <20200430095249.782597-9-thomas.petazzoni@bootlin.com>
 <20200501212318.GD15673@scaer> <20200724195331.GI2296@scaer>
 <87k0ys16gw.fsf@dell.be.48ers.dk> <20200725071340.GL2296@scaer>
Message-ID: <87mu3oypw4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> > Your original code took 11s (the second time, with a hot VFS cache),
 >> > while my proposal got it down to 2s (again, hot VFS cache).
 >> 
 >> > We could also try to parallelise the job:
 >> 
 >> >     find $(1) -type f -print0 |xargs -P $(PARALLEL_JOBS) -0 md5sum > $($(PKG)_DIR)/.files$(2).md5
 >> 
 >> Will that not scramble the order of the hashes in the list?

 > But do we even care ? The order returned by find is not even guaranteed,
 > as this depends on the order of the entries in the directory anyway,
 > so...

Ahh yes, I was thinking that we diffed the before/after files, but we
directly run md5sum with the before file, so it shouldn't matter.

-- 
Bye, Peter Korsgaard
