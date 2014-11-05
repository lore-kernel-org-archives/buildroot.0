From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Nov 2014 08:13:30 +0100
Subject: [Buildroot] Samba4 build issue
In-Reply-To: <54592103.30908@zacarias.com.ar>
References: <20141101233957.7ca9aabd@free-electrons.com>
 <545577D9.1040405@zacarias.com.ar>
 <20141102103811.16e499df@free-electrons.com>
 <545628BF.2030101@zacarias.com.ar>
 <20141104082623.33a2136e@free-electrons.com>
 <5458DC52.6020706@zacarias.com.ar>
 <20141104192043.03f7159b@free-electrons.com>
 <54592103.30908@zacarias.com.ar>
Message-ID: <20141105081330.22733f80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 04 Nov 2014 15:54:59 -0300, Gustavo Zacarias wrote:

> Yes, true, the definition moved to another header from 2.6.35 -> 2.6.36
> The failure seems to affect only the 2011 cs lite ppc toolchain.
> Even though it's based on 2.6.38 headers something bad was done to it:
> 
> freescale-2011.03 $ find . -type f -exec grep --with-filename
> XATTR_NAME_CAPS {} \; -> nothing (yes i did '-name *.h' first but to my
> amazement nothing returned so i went all-out).
> 
> So as a POC i've built a 2.6.35.14-based basic toolchain with libcap
> enabled and everything went fine.
> 
> My professional opinion is that the codesourcery powerpc 2011.03
> toolchain is messed up.
> So we either blacklist it or do users a favor and just deprecate/remove it.

I'm fine with deprecating/removing this CS toolchain. However, I'd like
to have in order set of toolchains at least one toolchain without "old"
kernel headers, so that we keep testing the case of old kernel headers
in the autobuilders.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
