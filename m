From: David Bonnin <dboml@free.fr>
Date: Fri, 26 Oct 2012 22:56:15 +0200
Subject: [Buildroot] post-buil script in chrooted
In-Reply-To: <507F15D3.2080805@mind.be>
References: <5077A820.7050202@free.fr> <20121012093032.7ef6b972@skate>
 <CAAXf6LVCr25_i_6CMR6DYs-5z1+bVuNNYEF4DedEe3j-6=4hqg@mail.gmail.com>
 <507866D6.8020608@mind.be> <507C882B.5080609@free.fr>
 <507F15D3.2080805@mind.be>
Message-ID: <508AF8EF.4070002@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Exactly, i want to create few users on the target, and copy files for 
each user, like ftpUser , httpdUser, userMyApp, userMyBackupApp.
I doesn't want to copy files only for root.

My apps(2) on the target doesn't run under root privileveges, and have 
theirs own default files/directory.

Now, i understand BR, i did it statically, with copy files by post-build 
script and permissions target in customize package ( deprecated).
My next step, will be put the default directory/files in root folder, 
and at target board starting create/copy files for my users, in goal to 
remove customize package and my own Skeleton.

Thinking of starting, It seemed implicit that we can execute a personnal 
script in a fakeroot script for modify the target dir before make images.

My project works  now, and looking back BR is a good choice(better than 
TI-SDK, and easy to understand).

Le 17/10/2012 22:32, Arnout Vandecappelle a ?crit :
> On 16/10/12 00:03, David Bonnin wrote:
>> Hello,
>>
>> yes, sorry , i mean , i was looking for a post-build script for my 
>> board in a fakeroot environnement.
>> customize package is deprecated.
>>
>> in board/me/Myproject/rootfs-adds/root/
>>
>> i want to cp files of root user.
>
>  Do you mean, files that are owned by root and are not readable by you?
> That won't be possible.
>
>  Or do you mean, files that should be owned by root in the target?  In 
> that
> case, you can just copy them in the post-build script - buildroot will 
> make
> everything owned by root.
>
>
>> So i need to use custom skeletonfs or use customize package.
>
>  Neither of these will do anything that the post-build script cannot do.
>
>  Regards,
>  Arnout
