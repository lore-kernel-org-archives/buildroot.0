From: Samuelsson, Ulf <ulf.samuelsson@atmel.com>
Date: 3 Apr 2008 12:26:35 +0000
Subject: [Buildroot] Flash for AT91RM9200
Message-ID: <039401c895a7$61f39304$85f0af0a@corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi you all!

I'm looking for a NOR-Flash for a RM9200-based board, and i thought 
maybe some of you could give some hints or experiences.
Basically it should be 128MByte size, with larger drop-in replacements 
as a favorable option. As with all RM9200 parallel flash, must have CFI, 
and must be available in a non-BGA package.
For a first guess, i found the Spansion S29G128P - any experiences with 
that one? How well is it supported by the kernel, or are there any 
obvious caveats that i overlooked now?

Greetz, Joe

=> The AT91RM9200 has 
     26 Adress pins (A0-A5)
     but A24 is nol  available.
     (See Errata)
     This gives you a 16 MB
     linear adressrange.
     Since A25 is available
     you can have 2 x 16 MB
     spaces with a 16 MB
     hole in between.

    However, I suspect that
    you only plan 128 Mbit
    and not 128 MByte
    and then this is not
    a problem
    
    If you are starting a design
    now,You should perhaps
    consider the AT91SAM9260
    or  the  AT91SAMG20
    

-- 
Sepp "ZaP" Holzmayr

please reply to: zentrale.at.work at gmail.com
"Never underestimate the bandwidth of a freight train full of DAT tapes. 
Only the round-trip is a little suboptimal."
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot


-------------- next part --------------
A non-text attachment was scrubbed...
Name: UlfSamuelsson.vcf
Type: application/octet-stream
Size: 491 bytes
Desc: UlfSamuelsson.vcf
Url : http://busybox.net/lists/buildroot/attachments/20080403/40ce5d7e/attachment.obj 
