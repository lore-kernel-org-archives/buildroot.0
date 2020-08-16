From: Michael Nosthoff <buildroot@heine.tech>
Date: Sun, 16 Aug 2020 13:15:23 +0200
Subject: [Buildroot] OpenSSH login problem
In-Reply-To: <4d943f9a8e974a60a5167db44bce6cd1@go-sys.de>
References: <cc86bfd55f944197bcd610626edecf2f@go-sys.de>
 <52-5f356200-5-2c492440@36238474>
 <4d943f9a8e974a60a5167db44bce6cd1@go-sys.de>
Message-ID: <e8a5f9f7-7cfe-6acb-591f-ecf871d63201@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


On 14.08.20 15:22, Michael Fischer wrote:
> Hi
>    Michael
>
> it seems to be a glibc bug.
>
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=965932


So it seems this was triggered by

9f6d4c3a87ccb package/{glibc, localedef}: bump to version 2.31


This commit is already referencing issues with openssh. But those should 
be fixed by commit

bad75bca315d package/openssh: bump to version 8.2p1


this commit also contains links to archlinux and gentoo which describe 
similar problems as

the debian issue.

>
> https://salsa.debian.org/glibc-team/glibc/-/commit/b1488bfda31968a724afa3ba212001a807603efd


Since the OpenSSH Version was already bumped again to 8.3p1 this is 
pretty weird.


Did you do a clean build?


Regards,

Michael

>
> Regards,
>    Michael
>
>
