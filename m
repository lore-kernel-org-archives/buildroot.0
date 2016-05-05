From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 May 2016 22:17:55 +0200
Subject: [Buildroot] [PATCH 1/1] uboot-tools: add missing dependency on
	host-dtc for the host package
In-Reply-To: <20160505220901.4db9e9a2@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 5 May 2016 22:09:01 +0200")
References: <1462372709-24828-1-git-send-email-casantos@datacom.ind.br>
 <20160505220901.4db9e9a2@free-electrons.com>
Message-ID: <87r3dgmf7w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> +HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc

 > I am not sure I like the idea of having host-uboot-tools always depend
 > on host-dtc, as it adds build time while host-dtc is only needed for
 > some specific use cases of mkimage (generating FIT images).

 > There are really three options I believe:

 >  (1) What you did, i.e have host-dtc as an unconditional dependency of
 >      host-uboot-tools. Everybody pays the price of building host-dtc
 >      even if it's not needed.

 >  (2) Add a sub-option to host-uboot-tools so that people can say "I
 >      need it with FIT image support", which will add host-dtc as a
 >      dependency.

 >  (3) Just do nothing, and let our users be smart enough to realize that
 >      when mkimage complains that dtc is missing, they should enable
 >      host-dtc.

Agreed, it's quite similar to the issues with genimage and
dosfstools. Either option 2 or 3 sounds good to me.

-- 
Venlig hilsen,
Peter Korsgaard 
