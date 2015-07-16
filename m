From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:10:24 +0200
Subject: [Buildroot] [PATCH] gcc: add gcc 5.2.0
In-Reply-To: <55A81B35.2040200@zacarias.com.ar>
References: <1437079928-9591-1-git-send-email-gustavo@zacarias.com.ar>
 <20150716225639.14772165@free-electrons.com>
 <55A81B35.2040200@zacarias.com.ar>
Message-ID: <20150716231024.656693cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 16 Jul 2015 17:59:33 -0300, Gustavo Zacarias wrote:

> Yes, i had a little talk with Yann about it and mostly agree.
> However the diff is big enough (8 MB bzipped) and 5.2 doesn't build a 
> bootable kernel for qemu-versatile where 5.1 IIRC does, hence 
> introducing a regression.

Gah, not the sort of thing you would expect from a bug fix release :-/

> Do we still want to step on 5.1 considering this?

Then I'm not sure obviously. I see two options here:

 * Switch to the policy where we support only one 5.x version at a time
   (option named BR2_GCC_VERSION_5_X), and keep 5.1 for now until 5.3
   is released, hopefully fixing the major bugs.

 * Package gcc 5.2 separately from 5.1. But it's pretty useless to
   offer as a package a compiler that is not even capable of building a
   kernel that boots.

Opinions?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
