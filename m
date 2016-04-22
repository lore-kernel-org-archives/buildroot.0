From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 23:21:55 +0200
Subject: [Buildroot] [PATCH v1 1/4] libpjsip: add gnutls support and fix
 various things
In-Reply-To: <1461358628-9352-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1461358628-9352-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <20160422232155.6ac9c7e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contributions!

On Fri, 22 Apr 2016 16:57:05 -0400, Patrick Keroulas wrote:
> Endianness for ARM.
> Add missing errno.
> Add multiple listeners.
> Fix ICE config and session.

As the commit title suggests, this patch does too many things in one
patch. Each of the things that you list here should be done by a
separate patch.

>  package/libpjsip/0003-Add-gnutls-support.patch     | 3373 ++++++++++++++++++++

Please don't include the generated configure script changes. Just patch
configure.ac, and mark the package with <pkg>_AUTORECONF = YES.

However, Buildroot has the policy of not carrying feature patches,
which this one clearly is. Some please get this patch integrated
upstream first, and then we can benefit from this feature in Buildroot.

Having large feature patches like this one in Buildroot would prevent
us from easily updating libpjsip in the future, which is not a
situation we like.

Patches fixing bugs/issues are OK, but not feature patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
