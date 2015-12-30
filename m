From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Dec 2015 20:04:59 +0100
Subject: [Buildroot] [PATCH] pandaboard_defconfig: bump u-boot to
	2015.10 and kernel to 4.3
In-Reply-To: <20151229140134.6dce652c@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 29 Dec 2015 14:01:34 +0100")
References: <1450978394-822-1-git-send-email-sergio.prado@e-labworks.com>
 <20151227120631.78043b59@free-electrons.com>
 <CANu7NGsP5K4268wtVMAcvUD+OaTxdEUvnV8aaoVqFhY1X-oOfg@mail.gmail.com>
 <20151229140021.054e6740@free-electrons.com>
 <20151229140134.6dce652c@free-electrons.com>
Message-ID: <871ta33gh0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

> Hello,
> On Tue, 29 Dec 2015 14:00:21 +0100, Thomas Petazzoni wrote:

>> > That was my first attempt, but it didn't work. The ROM code from OMAP
>> > processors (and I think also Sitara processors) need the SD card to be
>> > formatted with a special geometry in the partition table. That's the reason
>> > of the script above. I did not find any option in the genimage tool to
>> > configure thinks like sectors and cylinders. So I do not see an easy way to
>> > generate a sdcard image in this case. What do you think?
>> 
>> Ah ok. I don't know if genimage can handle such scenarios. I am Cc'ing
>> Vivien Didelot, who did quite a bit of work on genimage in Buildroot. I
>> think I remember he telling me that he had a working genimage
>> configuration for the BeagleBone, which has, AFAIK, the same
>> requirements as the PandaBoard in terms of geometry and all.

> I found Vivien's initial patch for the BeagleBone:

>   http://lists.busybox.net/pipermail/buildroot/2015-March/122406.html

> Though I don't see where it handles the specific geometry requirements.
> Maybe those requirements have been relaxed in the AM335x compared to
> the OMAP4 ?

Yes, I believe so, I atleast haven't seen the issuess with more recent
TI components.

The boot problems on omap3 (and 4?) were afaik a combination of boot rom
issues/erratas (and therefore depending on chip revisions) and sw
limitations (E.G. early xloader versions had various limitations).

https://groups.google.com/forum/#!topic/beagleboard/ro5k5r4Cuq4
http://elinux.org/Panda_How_to_MLO_%26_u-boot

I do have an early pandaboard somewhere that I can try to dig out and do
some tests with.

-- 
Bye, Peter Korsgaard
