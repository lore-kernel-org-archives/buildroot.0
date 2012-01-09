From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 09 Jan 2012 11:40:30 +0100
Subject: [Buildroot] [PATCH] python-netifaces: add -x option to fix
	cross-compilation
In-Reply-To: <87y5thduyo.fsf@macbook.be.48ers.dk>
References: <1326094927-27207-1-git-send-email-yegorslists@googlemail.com>
 <8739bpffv1.fsf@macbook.be.48ers.dk> <4F0ABA03.3030206@visionsystems.de>
 <20120109112018.64832095@skate> <87y5thduyo.fsf@macbook.be.48ers.dk>
Message-ID: <4F0AC41E.6030701@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 09.01.2012 11:35, schrieb Peter Korsgaard:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  Thomas> Le Mon, 09 Jan 2012 10:57:23 +0100,
>  Thomas> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :
> 
>  >> That's really strange. I used CodeSourcery toolchain and had no
>  >> problems, but with native BR toolchain I have the same behavior as
>  >> yours. I'll look into this issue.
> 
>  Thomas> CodeSourcery toolchains use glibc, so they have IPv6 support enabled.
> 
> Yes, but that doesn't explain the 2nd error (missing ;):
> 
>         Py_XDECREF (dict);
>         Py_XDECREF (list)
>         Py_XDECREF (family);
> 

I've activated UCLIBC_SUPPORT_AI_ADDRCONFIG and now I can compile netifaces without a problem with native toolchain. Here is my .config for reference. Also take a look at this thread: http://lists.busybox.net/pipermail/uclibc/2008-August/040778.html

Yegor
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 20230 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120109/d77b9158/attachment-0001.wsdl>
