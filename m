From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 26 Jul 2009 07:49:48 +0200
Subject: [Buildroot] Write Access to buildroot?
In-Reply-To: <20090724224516.15b39e30@surf>
References: <4A689265.6030308@atmel.com>
	<87skgmwm6h.fsf@macbook.be.48ers.dk>	<4A69741A.8010903@atmel.com>	<20090724085603.GL13236@buzzloop.caiaq.de>	<9E543F22BF68405185D6B77291E4E5EF@aeglos>	<20090724121641.2c4cf8bd@surf>
	<4A699CDD.7060703@atmel.com>	<20090724152448.4d1f5934@surf>
	<4A69D04E.9040408@atmel.com> <20090724224516.15b39e30@surf>
Message-ID: <4A6BEE7C.4080308@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni skrev:
> Le Fri, 24 Jul 2009 17:16:30 +0200,
> Ulf Samuelsson <ulf.samuelsson@atmel.com> a ?crit :
>
>   
>> And what I am missing, is a way to have several people commit to the
>> same tree.
>> I.E: A development tree.
>>     
>
> This is not how development works with Git. Everyone works in its
> own working tree, and asks the project maintainer to pull the working
> tree when things are ready. Things gets integrated in the project
> maintainer tree, which everyone can update from to get the changes from
> the other developers.
>   
In the openembedded project all the developers have
write access to the development tree and can create
their own branches within the tree.

This makes it a lot easier to test other peoples patches.

If you look at the statistics for the user repositories,
you see that there are 5 people with user repositories,
including mine, and last updates were from

correa:          3 months ago,
wberrier:       2 months ago,
tpetazzoni:   9 days ago
ulf:                 33 hours ago
jacmet:         -

This does not indicate a high level of popularity to me.
Maybe people are keeping trees in other locations, but
that means that they are hidden from most users.

In reality, the way Buildroot works today seems to be that
people are sending patches to the mailing-list.

It is fairly easy to set up common git trees,
by creating a "common" user with a git subdirectory
and then have a symbolic link in each user directory
to this git directory with group write permissions.

> In Buildroot, there's no ? development tree ? in the current
> development model. The same tree (the official way) is sometimes a
> development tree (before -rc1 is released), sometimes a stabilization
> tree (between the release of -rc1 and the release of the stable
> version).
>
>   
The suggestion does not change this.
> Sincerly,
>
> Thomas
>   
BR
Ulf Samuelsson
