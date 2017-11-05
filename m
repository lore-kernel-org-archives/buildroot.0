From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Nov 2017 14:25:02 +0100
Subject: [Buildroot] [PATCH] pkg-autotools: explicitly use /usr/{bin,
 sbin, lib}, with merged usr
In-Reply-To: <14c66d15-281b-8701-697c-d869581c8706@mind.be>
References: <20171101033627.26253-1-casantos@datacom.ind.br>
 <14c66d15-281b-8701-697c-d869581c8706@mind.be>
Message-ID: <20171105142502.0e6ef572@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Nov 2017 13:52:29 +0100, Arnout Vandecappelle wrote:

> > Fortunalely that error is not fatal but other packages may do similar
> > things with bad results, so let's avoid possible problems.  
> 
>  Well, since the default for bindir is <exec_prefix>/bin and exec_prefix is
> /usr, for most packages this is not going to be an issue. It's only util-linux
> that overrides it.
> 
>  Therefore, I don't think this should be done globally, but specifically for
> util-linux.

I would also be more comfortable to do this just for util-linux, as
it's a bit easier to validate the impact/consequences of such a change
if it's limited to a single package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
