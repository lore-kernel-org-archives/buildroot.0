From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 23:14:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-07-22
In-Reply-To: <55B156AF.7060900@openwide.fr>
References: <20150723063018.EA19A101D01@stock.ovh.net>
 <55B12984.2090104@openwide.fr>
 <20150723221133.51e59215@free-electrons.com>
 <55B156AF.7060900@openwide.fr>
Message-ID: <20150723231451.29f5fd92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu, 23 Jul 2015 23:03:43 +0200, Romain Naour wrote:

> Here is the content of CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET:
> 
> CFLAGS_FOR_TARGET="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -mlongcalls -mtext-section-literals  -Os "
> 
> CXXFLAGS_FOR_TARGET="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -mlongcalls -mtext-section-literals  -Os "
> 
> Probably -mtext-section-literals is the culprit...
> 
> Ah! did you notice the typo in Alexey's patch ?
> +# Propagate options used for target software building to GCC target libs
> +HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
> 			     ^^^				    ^^^

Well spotted. But since the CFLAGS and CXXFLAGS are the same, how is it
going to fix anything?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
