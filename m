From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 May 2016 00:15:04 +0200
Subject: [Buildroot] Analysis of build results for 2016-05-16
In-Reply-To: <20160518235426.785ae8c1@free-electrons.com>
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
 <20160517171350.247927aa@x230.trabucayre.com>
 <20160517172040.630eda58@free-electrons.com>
 <20160518090907.09473795@x230.trabucayre.com>
 <8a1534c8-494c-2470-dcb3-f45b6da6f208@mind.be>
 <20160518235426.785ae8c1@free-electrons.com>
Message-ID: <cf44f82c-7cb7-b9ff-c8c7-3d42bf71849b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/18/16 23:54, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 18 May 2016 21:40:38 +0200, Arnout Vandecappelle wrote:
>
>>   In my opinion, ICE issues are not really our problem. Since the user can
>> configure any kind of toolchain combination, I don't think it makes a whole lot
>> of sense even to add dependencies in the Config.in to avoid broken toolchains
>> (like we used to have for BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII).
>>
>>   So I'd just add an autobuilder exception.
>
> I'm hesitant to do this, because it means that normal users can also
> fall into the problem.

  My point is: excluding one specific (external) toolchain doesn't really stop 
normal users from encountering the problem, because they are just as likely to 
use a completely different (buildroot-generated, crosstool-NG, or 
vendor-provided) toolchain.

  My personal experience with customer projects is that maybe we start with a 
predefined external toolchain, but in the end we either build our own, or we 
bump buildroot but want to keep the existing toolchain which already has been 
replaced. So we always end up with a custom external toolchain.


> On the other hand, it's annoying to encode all those exceptions in
> Buildroot itself.

  My point is not so much that it's annoying, my point is that it's giving a 
false sense of security. We're adding exceptions for things we happen to 
encounter, but normal users are just as likely to still run into them.


  Note that I'm really talking about toolchain bugs here (i.e. ICE and the 
like), because these are particularly difficult to identify reliably. The 
situation is entirely different for things that can be handled by 
BR2_TOOLCHAIN_GCC_AT_LEAST_ and the like.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
