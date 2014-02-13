From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 12:29:42 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <52FBE074.4070005@openwide.fr>
References: <20140211073008.EC16B101035@stock.ovh.net>
 <20140211101015.1b282bd3@skate> <20140211180123.GB3411@free.fr>
 <20140212090659.15291b2b@skate> <52FBE074.4070005@openwide.fr>
Message-ID: <20140213122942.31ce862c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 12 Feb 2014 21:58:28 +0100, Romain Naour wrote:

> I also tried to reproduce this build failure recently, but nut builds 
> fine for me too.
> Have you found somethingon gcc10 ?

No, I've tried to reproduce it, but the exact configuration that caused
the build failure in the autobuilders doesn't fail for me.

> I don't think it's related but libhal.h is present on the autobuilder's log
> "checking for libhal.h... yes"
> 
> Maybe add --without-hal in nut.mk ?

That would certainly be a good idea, but I have a successful build with
the configuration of the autobuilder. So I'm suspecting a parallel
build problem maybe, but so far I've attempted maybe builds of nut, and
none of them failed. I've started a loop that builds nut repeatedly and
aborts if the build has failed. Hopefully the issue will pop up.

> Can you provide a complete build log with configure step ?

Sure, see the attached log file.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: logfile2
Type: application/octet-stream
Size: 303269 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140213/58e5cdb5/attachment-0001.obj>
