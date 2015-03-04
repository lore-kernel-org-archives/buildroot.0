From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 04 Mar 2015 09:19:38 -0300
Subject: [Buildroot] [PATCH] uclibc: mask uclibc-ng for xtensa
In-Reply-To: <20150304105532.GQ3937@waldemar-brodkorb.de>
References: <1425415991-20530-1-git-send-email-gustavo@zacarias.com.ar>
 <87zj7tsrfk.fsf@dell.be.48ers.dk> <54F62886.5090506@zacarias.com.ar>
 <54F630E2.5040703@zacarias.com.ar>
 <20150304105532.GQ3937@waldemar-brodkorb.de>
Message-ID: <54F6F85A.5060807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/04/2015 07:55 AM, Waldemar Brodkorb wrote:

> The analysis is correct. uClibc-ng only support NPTL or NONE for
> NPTL supported architectures like ARM, PPC, MIPS, X86, XTENSA, ...
> It will only support LT.old for BFIN, CRIS, ARM-NOMMU,
> M68k/Coldfire, ..

Yes, but...

> Sorry for the revert stuff. It was an accident while testing some
> pthread static linking stuff with cdrkit. I didn't want to push
> these changes, just some inability on my site to work with branches
> and multiple checkouts ;)
> 
> Please don't apply this patch. I will sent a patch, so that
> XTENSA and other NPTL architectures can not be configured to use
> LT.old or LT.new in Buildroot.

Kconfig logic as we spoke on IRC is working fine, it's falling back to none.
The problem is that none is broken, all that TLS stuff doesn't belong in
ldso/elfinterp.
Regards.
