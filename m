From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Jan 2012 20:15:22 +0100
Subject: [Buildroot] [PATCH v4] New package: linux-firmware
In-Reply-To: <20120126180204.5900134e@skate> (Thomas Petazzoni's message of
 "Thu, 26 Jan 2012 18:02:04 +0100")
References: <1327590802-17503-1-git-send-email-yegorslists@googlemail.com>
 <87bopq30ii.fsf@macbook.be.48ers.dk> <20120126180204.5900134e@skate>
Message-ID: <87mx9ae0mt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> That won't work as cp doesn't create the destination directories -
 >> install -D is also not really good as that doesn't handle symlinks,
 >> so I think the best approach is to use tar.

 Thomas> What about:

 Thomas> 	mkdir -p $(dirname $(TARGET_DIR)/lib/firmware/$$i)
 Thomas>  	cp -af $(@D)/$$i $(TARGET_DIR)/lib/firmware/$$i

That would work as well, but
     tar c -C srcdir files | tar x -C destdir

Is imho simpler.

-- 
Bye, Peter Korsgaard
