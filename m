From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 01:27:37 +0100
Subject: [Buildroot] Buildroot fails with: mkusers: user already exists
 with group 'nogroup'
In-Reply-To: <1349450149.2228539.1426647141409.JavaMail.yahoo@mail.yahoo.com>
References: <1349450149.2228539.1426647141409.JavaMail.yahoo@mail.yahoo.com>
Message-ID: <550A17F9.9010801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/03/15 03:52, Chris Rodley wrote:
> Buildroot fails with: mkusers: user already exists with group 'nogroup'
> 
> PATH="/home/user/buildroot/output/host/bin:/home/user/buildroot/output/host/sbin:/home/user/buildroot/output/host/usr/bin:/home/user/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" /home/user/buildroot/support/scripts/mkusers /home/user/buildroot/output/build/_users_table.txt /home/user/buildroot/output/target >> /home/user/buildroot/output/build/_fakeroot.fs
> mkusers: user already exists with group 'nogroup'
> fs/tar/tar.mk:13: recipe for target '/home/user/buildroot/output/images/rootfs.tar' failed
> make: *** [/home/user/buildroot/output/images/rootfs.tar] Error 1

 Can you post your defconfig? Sounds like two competing USERS definitions with
different group, but then it's surprising that the autobuilders didn't detect it...


 Regards,
 Arnout

> 
> 
> This happens after make clean and make.
> Any ideas?
> 
> Cheers,
> CJ
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
