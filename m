From: Chris Packham <judge.packham@gmail.com>
Date: Sun, 19 Aug 2018 08:40:55 +1200
Subject: [Buildroot] Analysis of build results for 2018-08-17
In-Reply-To: <20180818215603.04843f8d@windsurf>
References: <20180818060019.8702120DE6@mail.bootlin.com>
 <20180818215603.04843f8d@windsurf>
Message-ID: <CAFOYHZC34UUQvZ0rQWwsjMB-iCvWe7XLCR27LDgOMyzrRDZNhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Aug 2018, 7:56 AM Thomas Petazzoni, <thomas.petazzoni@bootlin.com>
wrote:

>
> >          sh4 |             micropython-v1.9.3 | NOK |
> http://autobuild.buildroot.net/results/2b18b9e1449f91d0c8d72ceadf298b5b37f5c9c4
> |
>
>
> cc1: warnings being treated as errors
> ../py/objdict.c: In function 'dict_view_print':
> ../py/objdict.c:458: error: dereferencing pointer 'o' does break
> strict-aliasing rules
> ../py/objdict.c:457: error: dereferencing pointer 'o' does break
> strict-aliasing rules
> ../py/objdict.c:456: error: dereferencing pointer 'o' does break
> strict-aliasing rules
> ../py/objdict.c:455: error: dereferencing pointer 'o' does break
> strict-aliasing rules
> ../py/objdict.c:454: note: initialized from here
>
> Not sure what is going on here, but it happens only on Hollis autobuilder:
>
>   http://autobuild.buildroot.net/?reason=micropython%
>
> Chris, perhaps you have an idea ?
>

I've tried reproducing this a few times with no luck. Initially I thought
it was due to a newer gcc generating new warnings, but then I tried gcc 8
and didn't see any issue.

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180819/37af0d52/attachment.html>
