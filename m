From: Alexandre Leblanc <alexandre.leblanc@savoirfairelinux.com>
Date: Mon, 1 May 2017 10:48:20 -0400 (EDT)
Subject: [Buildroot] [PATCH] cukinia: new package
In-Reply-To: <20170501105118.5ce1b97f@free-electrons.com>
References: <20170425135814.8787-1-alexandre.leblanc@savoirfairelinux.com>
 <20170501105118.5ce1b97f@free-electrons.com>
Message-ID: <243032793.106391.1493650100104.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thank you for your reply.
I'm quite new to the world of project up-streaming. 
Knowing This might be a hard question to answer, would you be able to quantify how many outside contribution would be reasonably acceptable ? 

Thank you again 

Alexandre Leblanc 


----- Original Message -----
From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
To: "Alexandre Leblanc" <alexandre.leblanc@savoirfairelinux.com>
Cc: buildroot at busybox.net
Sent: Monday, May 1, 2017 4:51:18 AM
Subject: Re: [Buildroot] [PATCH] cukinia: new package

Hello,

On Tue, 25 Apr 2017 09:58:14 -0400, Alexandre Leblanc wrote:
> Cukinia is designed to help Linux-based embedded firmware developers
> run simple validation tests on their firmware. For basic usage it
> requires no dependencies other than busybox.
> 
> Cukinia can run tests at boot time which is why we are using SZZcukinia
> since it would possibly be the last script to be executed in 'init.d'.
> 
> Signed-off-by: Alexandre Leblanc <alexandre.leblanc@savoirfairelinux.com>

As much as I like adding new package in Buildroot, this project feels
like your own project, very recently started, with no outside
contributions. In the end it's just a single shell script providing a
few functions. Could be useful, but I'm not sure we want to add this as
a Buildroot package that quickly.

Perhaps we need to see if there is some interest/adoption first?

>  package/cukinia/Config.in    | 12 ++++++++++++
>  package/cukinia/SZZcukinia   |  7 +++++++

I'm not sure I like this idea of SZZcukinia, though indeed S99 wouldn't
work because a few other Buildroot services are started at S99, and you
want to be after those services. Maybe other developers will have some
ideas?

> +CUKINIA_LICENSE = Apache-2.0 or GPLv3

GPLv3 should be GPL-3.0.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
