From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 23:14:33 +0200
Subject: [Buildroot] [PATCH 03/28] linux: make it possible to install
	the kernel in /boot
In-Reply-To: <4E1584C1.3060203@lucaceresoli.net> (Luca Ceresoli's message of
 "Thu, 07 Jul 2011 12:04:49 +0200")
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <8f2cdc43b7b0efaf09e1f1be70019f9cdc0cb8ec.1309815048.git.thomas.petazzoni@free-electrons.com>
 <201107042348.43715.yann.morin.1998@anciens.enib.fr>
 <4E1584C1.3060203@lucaceresoli.net>
Message-ID: <87y609pzd2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 >> If we install the kernel in /boot, why do we stil install it in
 >> ${BINARIES_DIR} ?
 >> 
 >> It can only be confusing to have the kernel image in two places.

 Luca> Does this really hurt? I found that a handy _feature_ indeed.

 Luca> Well, sorry for writing after v3 was submitted, but Thomas was so much
 Luca> faster than my review! :)

 Luca> I need the kernel in the target for some products, but with v2 of
 Luca> Thomas' work I also was sure that I always have an uImage in
 Luca> output/images, ready for network boot via TFTP and other stuff.

 Luca> Now I'd have to try both places, or script around the config to know
 Luca> where I'll find my uImage.

Ok, I'll make the copy-to-images unconditional when applying v3.

-- 
Bye, Peter Korsgaard
