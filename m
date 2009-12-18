From: Cyril HAENEL <chaenel@free.fr>
Date: Sat, 19 Dec 2009 00:13:57 +0100
Subject: [Buildroot] Strange behavior with shell redirection
In-Reply-To: <200912181431.37650.minimod@morethan.org>
References: <4B2B7141.90804@free.fr>
	<20091218190354.5302ccfe@surf>	<4B2BD851.1000902@free.fr>
	<200912181431.37650.minimod@morethan.org>
Message-ID: <4B2C0CB5.20407@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> tmpFS uses swap as its backing store.  How much swap do you have?  By
> default tmpFS will only use 50% of it.
>
> Also, you can limit the amount of ram used by tmpFS on the mount command and/or fstab.
>
> Mike
>   
I have no swap at all :

# cat /etc/fstab
# /etc/fstab: static file system information.
#
# <file system> <mount pt>     <type>    <options>         <dump> <pass>
/dev/root       /              ext2    rw,noauto         0      1
proc        /proc           proc     defaults      0     0
devpts        /dev/pts       devpts   defaults,gid=5,mode=620      0     0
tmpfs           /tmp           tmpfs    defaults          0      0
sysfs        /sys           sysfs    defaults      0     0

Curious, for / it gives ext2, but in fact it's jffs2....

# df
Filesystem                Size      Used Available Use% Mounted on
/dev/root               508.0M     20.4M    487.6M   4% /
tmpfs                    30.5M      1.6M     29.0M   5% /tmp

Thanks for the informations, in the next release, I will write my log in 
/home/potentiostat/ and not /var/log/ !

Cyril

-- 

Cyril Haenel
Registered Linux User #332632
