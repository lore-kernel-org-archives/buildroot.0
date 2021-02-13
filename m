From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 22:56:10 +0100
Subject: [Buildroot] [PATCHv2 2/7] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
In-Reply-To: <20210212135451.22786-3-patrickdepinguin@gmail.com>
References: <20210212135451.22786-1-patrickdepinguin@gmail.com>
 <20210212135451.22786-3-patrickdepinguin@gmail.com>
Message-ID: <20210213225610.3f1839af@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 12 Feb 2021 14:54:45 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> A common way to disable runtime assertions is by honoring the 'NDEBUG'
> preprocessor flag. Set it when BR2_ENABLE_RUNTIME_DEBUG is disabled (the
> default case).

How "common" is that? It feels a pretty "random" definition to me. I'm
not sure we want to randomly pass -DNDEBUG to all our packages, without
knowing what the meaning of NDEBUG is for all those packages.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
