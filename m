From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 07 Oct 2013 12:09:50 +0200
Subject: [Buildroot] [PATCH] pkg-infra: log current message
In-Reply-To: <1381058388-24055-1-git-send-email-yann.morin.1998@free.fr>
References: <1381058388-24055-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <30033387.d25L1SpIx8@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sunday 06 October 2013 13:19:48 Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> In order to help the auto-builders (our own, or in-house ones),
> just log the current message in a file that contains:
>     Package: $($(PKG)_NAME)
>     Version: $($(PKG)_VERSION)
>     Action : Last '>>>' message displayed
I have also in my local git some branches modified in a similar fashion. 
Some weeks ago, Francois Perrad also suggested a patch with a similar 
modification (http://patchwork.ozlabs.org/patch/265214). Thomas also 
wrote a patch to get build time statistics   
(http://lists.busybox.net/pipermail/buildroot/2011-October/046513.html). 

IMHO, these patchs are too much specific and should not be mainlined. 
However, Buildroot may provide a generic framework to make this kind 
instrumentation easier. 

For example, we may add a (another) new hooks at beginning and end of 
each action of pkg-generic.mk. It will give opportunity to user to 
implement its instrumentation in local.mk.

Another need would be to call external scripts from these hooks. In this 
case, it may be difficult to pass all needed information to an external 
script (I mean all $($(PKG)_*) variables). Buildroot may provide a 
generic way to to it (passing $($(PKG)_*) in environment for example).


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
