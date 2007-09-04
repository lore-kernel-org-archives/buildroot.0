From: Babarovic Ivica <ivica.babarovic@asist.si>
Date: Wed, 05 Sep 2007 00:00:32 +0200
Subject: [Buildroot] Tar problems
Message-ID: <46DDD580.2090307@asist.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for double emails Bernhard!

Bernhard Fischer wrote:

>eh.
>There is something really going wrong. How are you calling make?
>  


$ make all

>$ svngrep basename target/ -r 2> /dev/null
>target/makedevs/makedevs.c:	bb_applet_name = basename(argv[0]);
>target/device/Atmel/at91bootstrap/at91bootstrap-2.3.1.patch: #	cd .. ; tar -cvf `basename $$(TOPDIR)`.tar `basename $$(TOPDIR)` ; bzip2 `basename $$(TOPDIR)`.tar )
>target/device/Atmel/at91bootstrap/at91bootstrap-2.3.1.patch:-PACKAGE=`basename ${TOPDIR}`
>target/device/Sharp/LNode80/kernel-patches/001-patch-2.4.26-vrs1:+int-y := $(sort $(foreach m, $(multi-y), $($(basename $(m))-objs)))
>target/device/Sharp/LNode80/kernel-patches/001-patch-2.4.26-vrs1:+int-m := $(sort $(foreach m, $(multi-m), $($(basename $(m))-objs)))
>
>I'd rule out makedevs.c and probably the Sharp stuff. I'd just recommend
>to glance at 'info make' to the one who wrote the other hunks.
>  
>

>Where does that basename call you show above come from?
>  
>
I'm sorry Bernhard. What do you mean by this?
I'll attach the output of 'make all' process.


-- 
Babarovic Ivica, R&D Engineer
ASIST avtomatizacija sistemov d.o.o.		Web: www.asist.si
Cesta Ljubljanske brigade 23a			Phone: +386 (1)5837 217
Ljubljana, Slovenija


-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: log
Url: http://busybox.net/lists/buildroot/attachments/20070905/5c8aca87/attachment.diff 
