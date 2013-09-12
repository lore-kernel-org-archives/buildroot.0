From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 12 Sep 2013 08:46:58 -0300
Subject: [Buildroot] Build errors in libnl
In-Reply-To: <BECCD53EFF877A4F8D909C37120A85375303BD96@CHEWBACCA.connectBlue.local>
References: <BECCD53EFF877A4F8D909C37120A85375303BD96@CHEWBACCA.connectBlue.local>
Message-ID: <5231A9B2.20302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/2013 06:39 AM, Jonas Ludvigsson wrote:

> I got the following build errors when building ?libnl? (3.2.22):
> 
>  
> 
>   CC     addr.lo
> 
>   CC     nl.lo
> 
>   CC     object.lo
> 
>   CC     utils.lo
> 
>   CC     socket.lo
> 
> addr.c:1027: error: 'AF_RDS' undeclared here (not in a function)
> 
> addr.c:1033: error: 'AF_CAN' undeclared here (not in a function)
> 
> addr.c:1034: error: 'AF_TIPC' undeclared here (not in a function)
> 
> addr.c:1038: error: 'AF_ISDN' undeclared here (not in a function)
> 
> addr.c:1039: error: 'AF_PHONET' undeclared here (not in a function)
> 
> make[3]: *** [addr.lo] Error 1
> 
>  
> 
> I?m quite new to Linux and Buildroot, but as far as I understand my
> configuration is missing something. Any ideas on what it could be?

Ahhh trigger happy version bumping! :)
There's a reason we're sticking with libnl 3.2.21 still, and that's it.
You need a mode modern (snapshot/git) uClibc version with updated
bits/socket.h for it to work, or switch to some other external toolchain
that's up to date, or backport the changes for your current uClibc.
Regards.
