From: Andreas Larsson <andreas@gaisler.com>
Date: Wed, 03 Sep 2014 17:14:37 +0200
Subject: [Buildroot] Sparc Leon support in Buildroot
In-Reply-To: <20140903164536.1a28b0d1@free-electrons.com>
References: <20140701202206.153b2cf6@free-electrons.com>	<53F4800D.2060307@gaisler.com>	<20140820140514.67f9fb23@free-electrons.com>	<54072204.3020402@gaisler.com>
 <20140903164536.1a28b0d1@free-electrons.com>
Message-ID: <5407305D.3070508@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-09-03 16:45, Thomas Petazzoni wrote:
> Dear Andreas Larsson,
>
> On Wed, 03 Sep 2014 16:13:24 +0200, Andreas Larsson wrote:
>
>>> Great, thanks! Also, currently, we don't have any Sparc toolchain in
>>> our autobuilder testing. Normally, we try to have all architectures we
>>> support tested in our autobuilders. If we were to add the Sparc
>>> architecture to our testing infrastructure, would you be willing to
>>> look at the potential build failures that may result from this testing?
>>> (Look at http://autobuild.buildroot.org to see what the results look
>>> like for other architectures).
>>
>> If that would be set up, it is something I could keep an eye on.
>> However, I do not have the possibility to take responsibility for broken
>> packages.
>
> Well, it's not really a "responsibility": most of the Buildroot
> contributors are volunteers so there are no obligations. But if you can
> give some help from time to time for some SPARC specific issues, that
> would be nice.
>
> Have you had some time to look at the toolchain components? As I said
> earlier, we are currently keeping gcc 4.4.x only for SPARC Leon, so if
> you could test if gcc 4.8.x and/or 4.9.x work fine for Leon, it would
> allow us to get rid of the support for gcc 4.4.

gcc 4.8.x and 4.9.x produces a bug that seems to be due to memset 
optimizations and a surprising memset behavior in sparc Linux. I have 
submitted a kernel patch to fix this 
(https://lkml.org/lkml/2014/8/29/333). This (or some other fix to the 
problem) should go into mainline and stable branches before claiming gcc 
4.8/4.9 working for leon in my opinion. I'll have to test more if there 
are other problems with the newer gcc:s as well.

Cheers,
Andreas
