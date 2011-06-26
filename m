From: Charles Krinke <charles.krinke@gmail.com>
Date: Sun, 26 Jun 2011 10:51:19 -0700
Subject: [Buildroot] device_table & /dev/shm
In-Reply-To: <87mxh47v71.fsf@macbook.be.48ers.dk>
References: <BANLkTi=j9SD2aLP73Cnp6iUWov99h9Npog@mail.gmail.com>
 <20110626032236.GA17733@tarshish>
 <87mxh47v71.fsf@macbook.be.48ers.dk>
Message-ID: <BANLkTi=hr=U5eMmPbsUB-WH_QYjamGR5qA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please bear with me as I try to understand a couple of concepts. My
experience has mostly been in kernel drivers and this application level
setup is not completely understood by me.

I would appreciate understanding more the two concepts of a) overriding
target/generic/device_table. txt so I can understand how the mounted jffs2
became different then the contents of output/target/dev and the b) How we
get from what appears to be the default /etc/fstab mounting tmpfs to one
where we mount /dev/shm instead in our application space.

Is there a busybox config setup for /dev/shm? I went through the busybox
menuconfig this morning and I don't see one.

Charles
On Jun 26, 2011 3:17 AM, "Peter Korsgaard" <jacmet@uclibc.org> wrote:
>>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
>
> Hi,
>
> >> 1. I can see the generic device_table.txt and it includes a /dev/shm
> >> node. I can also see the /dev structure in output/target and it
> >> matches the generic device_table.txt. But, ... when I build the jffs2
> >> and load it on my MPC8323 target, what I see in /dev does not include
> >> /dev/shm. In fact it is significantly different. So, my first question
> >> is:
> >>
> >> "What besides generic/device_table.txt can determine the contents of
> >> /dev on an MPC8323 target?"
>
> Baruch> Do you have devtmpfs mounted on /dev? If so, devtmpfs takes
> Baruch> over the content of /dev, and hides the device nodes and
> Baruch> directories from your device table.
>
> If so, it would be better to use the 'Dynamic using devmtpfs only'
> device table option to not waste jffs2 space on device nodes you are not
> going to use anyway.
>
> We might need to add a mkdir -p /dev/shm in inittab like we already do
> for /dev/pts, as those are not device nodes and hence do not get created
> by devtmpfs.
>
> --
> Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110626/0f91d307/attachment.html>
