From: Andreas Naumann <dev@andin.de>
Date: Wed, 21 Dec 2016 10:13:27 +0100
Subject: [Buildroot] [PATCH v3 0/7] qt5 bump to 5.8.0-rc
In-Reply-To: <20161219102642.2b2b57e3@free-electrons.com>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <20161217154629.09d3f0e3@free-electrons.com>
 <3e4baa3d-e4cf-0a3f-6508-f68f87012812@andin.de>
 <20161219102642.2b2b57e3@free-electrons.com>
Message-ID: <d5fd9949-6575-05f0-6dbb-8d9df79869d6@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 19.12.2016 um 10:26 schrieb Thomas Petazzoni:
> Hello,
>
> On Mon, 19 Dec 2016 10:13:29 +0100, Andreas Naumann wrote:
>
>> I'll try to fix yours and Peters issues/comments today. In the meanwhile
>> Qt updated their planned -rc release for tomorrow, 20th December. So I
>> guess I'll wait for that to happen, update the hashes also and provide a
>> v4 wednesday or so.
>
> Sounds good, thanks.
>
>> On the question of supporting two versions: For the moment I lack the
>> time and a good idea of how to do it without duplicating lots of code.
>
> I'm not sure how to handle that yet. I'll try to chat with Peter about
> this.
>

One idea i just had has to do with Peters question how Yocto deals with 
it. Their meta-qt5 layer has branches for all the past Yocto releases 
that are maintained. Each of them has a fixed qt-version. So in that 
regard is not much different from our situation.
However, if you want to use an older Qt-Version with a newer 
Yocto-Version it may be a matter of checking out a different meta-qt5 
branch.

With that in mind I thought of our br2-external trees, which we now can 
have multiple of. There would probably be some way to combine mainline 
buildroot and an older version of the qt5 packages as external, but lots 
of questions arise here also. Variable names, additional repos, 
maintenance...

So no, I dont think thats a good proposal. But all other solutions I can 
think of involve some kind of ugly code duplication, increased 
complexity (ifeq...) and so on. And maintenance will have to be done 
regardless of the implementation.
So with that in mind, I turn to my initial thought of last week. If 
people/companies need maintenance of older versions, why not maintain 
the buildroot release that has them? With IoT and the need to for long 
term support, combined efforts for maintenance would be rather helpful, 
right?


so much for my ponderings,
Andreas


> Thomas
>
