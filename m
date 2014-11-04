From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 04 Nov 2014 15:54:59 -0300
Subject: [Buildroot] Samba4 build issue
In-Reply-To: <20141104192043.03f7159b@free-electrons.com>
References: <20141101233957.7ca9aabd@free-electrons.com>	<545577D9.1040405@zacarias.com.ar>	<20141102103811.16e499df@free-electrons.com>	<545628BF.2030101@zacarias.com.ar>	<20141104082623.33a2136e@free-electrons.com>	<5458DC52.6020706@zacarias.com.ar>
 <20141104192043.03f7159b@free-electrons.com>
Message-ID: <54592103.30908@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/04/2014 03:20 PM, Thomas Petazzoni wrote:

> There was a patch from Bernd, a759931c9b0cb4337dc30fd35d03ce123271c5a4,
> which made libcap depend on headers >= 3.7. But I reverted it in
> d5146f4b53d926c13a47215ac514e43b2c66b9ac, because Bernd's analysis was
> not correct, and libcap did not depend on kernel headers >= 3.7.
> 
> Are you sure 3.1 is really the correct starting point? Here is what I
> wrote at the time:

Yes, true, the definition moved to another header from 2.6.35 -> 2.6.36
The failure seems to affect only the 2011 cs lite ppc toolchain.
Even though it's based on 2.6.38 headers something bad was done to it:

freescale-2011.03 $ find . -type f -exec grep --with-filename
XATTR_NAME_CAPS {} \; -> nothing (yes i did '-name *.h' first but to my
amazement nothing returned so i went all-out).

So as a POC i've built a 2.6.35.14-based basic toolchain with libcap
enabled and everything went fine.

My professional opinion is that the codesourcery powerpc 2011.03
toolchain is messed up.
So we either blacklist it or do users a favor and just deprecate/remove it.
Regards.
