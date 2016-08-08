From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Aug 2016 14:47:53 -0700
Subject: [Buildroot] cmake Release build overwrites Os
In-Reply-To: <20160807223251.1177a2c2@free-electrons.com>
References: <20160807164032.GL22524@waldemar-brodkorb.de>
 <20160807223251.1177a2c2@free-electrons.com>
Message-ID: <5832BDC6-1AE9-4956-84CD-93F0C8D462DB@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 7, 2016, at 1:32 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Hello,
> 
> On Sun, 7 Aug 2016 18:40:32 +0200, Waldemar Brodkorb wrote:
> 
>> while doing the m68k patch for assimp, I realized that following is
>> used to configure cmake based packages:
>> package/pkg-cmake.mk:           -DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release)
>> 
>> This means that Cmake adds -O3 to the CFLAGS/CXXFLAGS _after_ -Os
>> and so get used.
>> 
>> Is this the correct behaviour or do I missed something?
> 
> There are unfortunately lots and lots of packages whose build system
> enforce some -O<xyz> option, regardless of what Buildroot defines. I'm
> not sure how hard we want to work against those packages.
> 

Perhaps taking a inclusive approach is best case here. Where you define a global opt level
and let the _rogue_ packages override it. This will not make whole system follow your intended
opt level, but it might be middle ground. In some cases, apps override the opt levels because
other opt levels aren?t tested. So its better to not insert your own opt level and wake up
those heinous bugs.

> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160808/ce69140f/attachment.asc>
