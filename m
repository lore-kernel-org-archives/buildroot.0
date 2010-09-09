From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 9 Sep 2010 11:01:52 +0200
Subject: [Buildroot] mdev handling
In-Reply-To: <87occ8cnr8.fsf@macbook.be.48ers.dk>
References: <AANLkTi=XLJvtakS=nKMYyybTJdtoVvgaA3NFkBSMivHu@mail.gmail.com>
	<87occ8cnr8.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTikYk3m7bJXa4r6yY3CEW6xOxhtr9w2Ea62=WhZv@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> ?Yegor> AFAIK mdev activation leads only to adding this binary to the rootfs
> ?Yegor> tree. What about starting script? Would it make sense to create
> ?Yegor> /etc/init.d/S1mdev with the following content:
>
> ?Yegor> tmpfs ? ? ? ? ? /dev ? ? ? ? ? tmpfs ? ?size=1M ? ? ? ? ?0 ? ? ?0
>
> ?Yegor> added. (The size should be much smaller, this is only for testing)
>
> ?Yegor> What do you think about this?
>
> Isn't this largely obsolete now we have devtmpfs?

Yes, it is working like a charm. You live and learn.

But the creation of an init.d script is still worth implementing?

I'd suggest to make an option "Target filesystem options"->"Device
creation" and then
 "Target filesystem options"->"Device creation"->"static" and as
suboption "device table file"
 "Target filesystem options"->"Device creation"->"dynmic" and as
suboptions "udev" and "mdev"
 and then something with hotplugging

Regards,
Yegor
