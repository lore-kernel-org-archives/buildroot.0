From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 03 Mar 2015 18:32:54 -0300
Subject: [Buildroot] [PATCH] uclibc: mask uclibc-ng for xtensa
In-Reply-To: <87zj7tsrfk.fsf@dell.be.48ers.dk>
References: <1425415991-20530-1-git-send-email-gustavo@zacarias.com.ar>
 <87zj7tsrfk.fsf@dell.be.48ers.dk>
Message-ID: <54F62886.5090506@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/03/2015 06:26 PM, Peter Korsgaard wrote:

>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
> 
>  > Is broken like plain uClibc, fixes:
>  > http://autobuild.buildroot.net/results/77f/77fe89d358a90f5167e58bedb73495d7ee9a7f5d/
> 
> So why do we have:
> 
> commit 060125b4fed11458288b14fbd2d49e1c12eb11df
> Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date:   Sat Feb 14 22:01:07 2015 +0100
> 
>     uclibc: enable Xtensa NPTL support with uClibc-ng
> 
> Then? Presumably something was working when this was done?

Autobuilders are speaking up, i gave uclibc a quick look and xtensa
elfinterp.c is the only arch including dl-tls.h
I'll try droppping that, it doesn't make sense that the interpreter
needs tls, but for the time being i'd nuke uclibc-ng for xtensa pending
testing/upstream aproval.
Regards.
