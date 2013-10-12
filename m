From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Oct 2013 16:56:39 +0200
Subject: [Buildroot] buildroot requires a password
In-Reply-To: <72BD24884B4745F4BE4A855D78178642@M58p>
References: <0F793FF065914549A7D55A219164CACB@M58p>
 <20131012145021.02d468e4@skate>
 <72BD24884B4745F4BE4A855D78178642@M58p>
Message-ID: <20131012165639.0bc4a78d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sabri Altunbas,

Please keep the list in Cc.

On Sat, 12 Oct 2013 15:47:50 +0200, Sabri Altunbas wrote:

> BR2_PREFER_STATIC_LIB=y

This,

> BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305=y

together with this cannot work. The Sourcery CodeBench toolchains use
the glibc C library, which simply doesn't work for static linking. Even
if you statically link Busybox, it will still need some of the shared
libraries, loaded dynamically at runtime.

So, switch to use shared libraries, or use a C library that works
properly with static linking: uClibc.

I'll send a patch to ensure that glibc toolchains aren't used when
static linking is selected.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
