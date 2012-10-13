From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Sat, 13 Oct 2012 07:14:30 -0700 (PDT)
Subject: [Buildroot] GTK startup
Message-ID: <1350137670.51066.YahooMailNeo@web164601.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My Buildroot configuration includes TinyX and GTK, with some GTK samples.
Giving xinit command to start X and xclock application together, I noticed that
it passes 35 sec on my ARM board to see xclock window. 
Also, I noticed?that free RAM amount before (50Mb)?and after (7Mb)?starting xclock 
?diferentiate for about 40Mbytes. If we assume that NAND and RAM have 
100ns access time? (in fact it is much?smaller), then 40MBytes should be loaded for
8 sec (4 from NAND to CPU(400MHz) and 4 from CPU to RAM). I know that 
transfering is not the only task, there are other tasks, like finding where are files' 
"clusters",?loader job and so on. 
Still it is far from 35 sec, and I din't mention that data fetch is 16 bit wide, so it
would even?shorthen above calculation. 
Can someone explain me why such long time and if there exists some software
which can help me finding out?bottlenecks of that kind.
?
Regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121013/93bd366c/attachment.html>
