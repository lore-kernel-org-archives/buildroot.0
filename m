From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 24 Feb 2014 11:42:47 +0100
Subject: [Buildroot] udev 182: scsi/scsi.h not found
In-Reply-To: <5307AB0F.30602@gmail.com>
References: <5307AB0F.30602@gmail.com>
Message-ID: <1671860.tqfC9E0M9p@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Friday 21 February 2014 20:37:51 Marco Trapanese wrote:
> Hi all!
> I'm still learning and I was able to fix several issue by myself.
> Anyway my first buildroot compilation is not completed yet!
> 
> The building of udev 182 ends with the following error:
> 
> src/ata_id/ata_id.c:32:23: fatal error: scsi/scsi.h: File o directory
> non esistente
>   #include <scsi/scsi.h>
I already noticed this problem. It happends when linux-headers is rebuilt  
after libc (during its installation, linux-headers remove include/scsi/). 

You can simply rebuild your toolchain or just do a "make clean".




-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
