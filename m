From: Ivo Grondman <buildroot@grondman.net>
Date: Tue, 16 Feb 2021 11:37:26 +0100
Subject: [Buildroot] Handling delays in network interface visibility in
 Raspberry Pi 3
In-Reply-To: <87r1lh9eiz.fsf@dell.be.48ers.dk>
References: <0A92E09A-3361-429E-AE65-E12223E0E62B@grondman.net>
 <87r1lh9eiz.fsf@dell.be.48ers.dk>
Message-ID: <3FF68F6E-0A60-4171-94ED-640214A6F0EF@grondman.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On 15 Feb 2021, at 23:01, Peter Korsgaard <peter@korsgaard.com> wrote:
> 
> I guess your problem is that the device (and/or whatever you have
> connected at the other end of the cable) is too slow to negotiate a
> link, so the DHCP client send the DHCP requests too soo and gives up
> before the link comes up.

This comment, together with Cristopher's comment on the possibility of a switch-related issue, made me wonder what could all be causing a slow link negotiation. So I decided I?d put up the Raspberry Pi right next to the router, as before it was indeed behind an extra switch *and* needed to go over a power line adapter. Then again, I could not imagine that this was the cause as I never ever experienced this particular problem before with any other similar device, so if it would be the switch, the router, or the power line adapter then surely I would?ve seen this problem before. Therefore, I decided on a whim that I first would try swapping the Pi?s network cable with that of some other device and it worked immediately!

Turned out I was using an old cable only capable of 100BASE-TX (i.e. it only had 2 wire pairs). Replacing it with a cable with all 4 wire pairs in it did the trick, even when still behind the switch and the power line adapter. Never had problems with that cable before (didn?t care about the speed difference), but apparently in this case it was the culprit of slow link negotiation.

Thanks for the help.

Cheers,

Ivo
