From: grego rigolo <gregorigolo2002@yahoo.fr>
Date: Tue, 12 Feb 2008 18:27:21 +0000 (GMT)
Subject: [Buildroot] Re :  kernel cross compilation problem (at91sam9260)
Message-ID: <471886.17673.qm@web23404.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello,
During the linux kernel compilation, i noticed that the file named "Image" had a different size.
Indeed
when i built the kernel with my old buildroot uclibc toolchain, i got
an Image file of about 2.5Mb while with my new configuration, i got an
Image file of 3Gb  !!!!!
Image file is generated from the vmlinux file with the following command:
-----> arm-linux-objcopy -O binary -R .note -R .comment -S  vmlinux arch/arm/boot/Image
In both cases, the size of my vmlinux file is similar.
I also noticed in my new "vmlinux.o" file that a new section had been created: .ARM.attributes respect to the old vmlinux.o
greg


----- Message d'origine ----
De : Doug the RockRat <rickyrockrat@yahoo.com>
? : Rick Foos <rick@synchromeshcomputing.com>; Wayne Keenan <wayne.keenan@gmail.com>; grego rigolo <gregorigolo2002@yahoo.fr>
Cc : buildroot at uclibc.org
Envoy? le : Lundi, 11 F?vrier 2008, 21h57mn 35s
Objet : Re: [Buildroot] kernel cross compilation problem (at91sam9260)

Is 
it 
possible 
that 
a 
boot 
logo 
was 
perhaps 
added?  
That 
does 
add 
a 
significant 
amount 
of 
size 
to 
the
kernel.
--- 
Rick 
Foos 
<rick@synchromeshcomputing.com> 
wrote:

> 
Hi,
>  
> 
I 
had 
the 
same 
problem 
going 
from 
800k 
to 
3MB
> 
kernels. 
It 
was 
not 
related 
to 
compilers. 
>  
> 
The 
size 
is 
due 
to 
a 
large 
initrd 
filesystem.
>  
> 
Clean 
everything 
out, 
the 
standard 
cleans 
don't 
seem
> 
to 
do 
it. 
>  
> 
I 
can't 
say 
what 
exactly 
gets 
it 
done, 
removing 
init
> 
ram 
filesystem, 
but 
it 
looks 
like 
toolchain 
rebuild
> 
as 
well 
is 
required.
>  
> 
, 
and 
in 
.config
>  
> 
# 
BR2_TARGET_ROOTFS_INITRAMFS 
is 
not 
set
>  
> 
Best 
Regards,
> 
Rick
> 
> 
________________________________
> 
> 
From: 
buildroot-bounces at uclibc.org 
on 
behalf 
of
> 
Wayne 
Keenan
> 
Sent: 
Mon 
2/11/2008 
11:32 
AM
> 
To: 
grego 
rigolo
> 
Cc: 
buildroot at uclibc.org
> 
Subject: 
Re: 
[Buildroot] 
kernel 
cross 
compilation
> 
problem 
(at91sam9260)
> 
> 
> 
Hi,
> 
> 
Dropping 
back 
to 
using 
gcc 
3.4.6  
and 
uclib 
x.x.28
> 
worked 
for 
me.  
- 
not 
a 
proper 
fix, 
but 
it 
was 
a
> 
combination 
that 
worked 
andI 
was 
fed 
up 
of 
trying
> 
combinations 
:)
> 
> 
> 
Regards
> 
Wayne
> 
> 
> 
> 
On 
Feb 
11, 
2008 
4:10 
PM, 
grego 
rigolo
> 
<gregorigolo2002@yahoo.fr> 
wrote:
> 
> 
> 
    
hello,
> 
    
I'm 
using 
the 
buildroot-20080206.tar.bz2 
package 
to
> 
build 
a 
rootfilesystem 
and 
a 
cross 
compilation
> 
toolchain 
for 
my 
embedded 
board 
(sam9260).
> 
    
I 
tried 
to 
cross 
compile 
(arm-linux-gcc-4.1.2) 
a
> 
2.6.23 
linux 
kernel 
seperately 
(not 
the 
one 
included
> 
in 
buildroot) 
, 
and 
i 
noticed 
that 
the 
size 
had
> 
increased 
by 
3Mb 
respect 
to 
my 
old 
version.
> 
    
On 
the 
other 
hand 
when 
i 
try 
to 
use 
the 
generated
> 
kernel, 
it 
hangs 
at 
the 
stage 
> 
    
uncompressing 
Linux 
....................
> 
    
Does 
anyone 
encounters 
this 
kind 
of 
problem 
?
> 
    
greg
> 
    
> 
> 
> 
________________________________
> 
> 
    
Ne 
gardez 
plus 
qu'une 
seule 
adresse 
mail 
! 
Copiez
> 
vos 
mails
>
<http://fr.rd.yahoo..com/mail/mail_taglines/trueswitch/SIG=11gshn0bu/**http%3A%2F%2Fwww.trueswitch.com%2Fyahoo-fr%2F>
>  
vers 
Yahoo! 
Mail 
> 
> 
    
_______________________________________________
> 
    
buildroot 
mailing 
list
> 
    
buildroot at uclibc.org
> 
    
http://busybox.net/mailman/listinfo/buildroot
> 
    
> 
> 
> 
> 
_______________________________________________
> 
buildroot 
mailing 
list
> 
buildroot at uclibc.org
> 
http://busybox.net/mailman/listinfo/buildroot



  
  
  
____________________________________________________________________________________
Be 
a 
better 
friend, 
newshound, 
and 
know-it-all 
with 
Yahoo! 
Mobile.  
Try 
it 
now.  
http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ 







      ______________________________________________________________________________ 
Yahoo! Mail : un mail innovant avec Messenger compatible Windows Live + stockage illimit?. http://mail.yahoo.fr
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080212/f600e363/attachment.htm 
