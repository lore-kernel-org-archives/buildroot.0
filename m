From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 21:29:48 +0100
Subject: [Buildroot] [PATCH 2/2 v3] xtensa: support configurable
 processor configurations
In-Reply-To: <50A18A2B.1050102@zankel.net>
References: <509d9db2.4883440a.7065.016e@mx.google.com>
 <509DA516.40007@mind.be> <50A169FC.6010708@zankel.net>
 <50A16B1E.8030703@mind.be> <50A18A2B.1050102@zankel.net>
Message-ID: <50A2ADBC.9080704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/12 00:45, Chris Zankel wrote:
> On 11/12/2012 01:33 PM, Arnout Vandecappelle wrote:
>>
>>     Perhaps it's better to move the condition to a
>> if BR2_xtensa
>> ...
>> endif
>> around the entire file.  Thomas has a patch lined up to move all
>> the conditions outside of the Config.in.*
>>> It seems Xtensa would be the only one that uses that scheme, so maybe
>>> wait for the generic patch from Thomas?
>>    I don't think so. Then it means more work for Thomas to refresh his
>> patch.  There will be a merge conflict anyway between the two, but
>> with the condition outside the file the conflict will be small.
>>
>>    That said, Peter hasn't merged Thomas's patch even though I acked
>> it, so maybe he has some fundamental objection to the principle.
>> Or maybe it's just because I didn't test it.

> I guess I don't understand what that patch does, i.e. where is the
> 'if...endif'? Could you maybe point to the patch?

  I'm talking about http://patchwork.ozlabs.org/patch/196916/
In arch/Config.in, it introduces the following construct:

if BR2_xtensa
source "arch/Config.in.xtensa"
endif

  This removes the need for adding 'depend on BR2_xtensa' in every config
option in that file.

  It's true that _now_ xtensa would be the only one using that scheme, but the
idea is that if you do that for xtensa now, it will be easier to merge in
Thomas's patch later (or vice versa, it will be easier to rebase your patch
once Thomas's patch gets merged).

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
