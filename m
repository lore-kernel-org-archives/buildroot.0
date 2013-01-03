From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 03 Jan 2013 09:52:36 +0100 (CET)
Subject: [Buildroot] [RFC] How to handle targets that need more than
	one	file system to boot?
In-Reply-To: <201301030940.07495.yann.morin.1998@free.fr>
Message-ID: <26421c6f-f4ed-42e5-86d1-e1d019f4583a@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello all

I have been thinking a bit about that recently for various reasons... AFAIK there are two approches

1) after buildroot has done its work use fakeroot or sudo to untar the tared root filesystem and then recreate
 the various images you need for the different parts of your root fs

2) add a hook to buildroot to call a shell script to build custom filesystems during the filesystem creation phase
 of buildroot... i.e within the fakeroot environement that buildroot uses to create its rootfs

I think that second approch is simpler for the user and is simple to implement in BR (it plugs well in the 
current FS building mechanism) but I don't know if that's the direction BR is going...

the first approch is basically you making a script to run after buildroot, it's a bit complicated since you 
need to be a bit familiar with how fakeroot and/or sudo works but it doesn't depends on any change in buildroot

    Regards

    J?r?my Rosen

fight key loggers : write some perl using vim
