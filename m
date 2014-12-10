From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 11 Dec 2014 00:53:31 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/openpowerlink: do not
 override CMAKE_SYSTEM_PROCESSOR
In-Reply-To: <20141211002007.48079438@free-electrons.com>
References: <1418246696-27658-1-git-send-email-romain.naour@openwide.fr>	<1418246696-27658-2-git-send-email-romain.naour@openwide.fr>
 <20141211002007.48079438@free-electrons.com>
Message-ID: <5488DCFB.9070309@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 11/12/2014 00:20, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Wed, 10 Dec 2014 22:24:55 +0100, Romain Naour wrote:
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>
>> This commit must be applied after "pkg-cmake.mk: Set CMAKE_SYSTEM_PROCESSOR"
>> http://patchwork.ozlabs.org/patch/411789/
>>
>> v2: rework the regex (Samuel Martin)
>> ---
>>  ...a-better-regex-for-cmake-system-processor.patch | 89 ++++++++++++++++++++++
> 
> Can you submit this upstream?
> 

This patch is available in my sourceforge repository for openpowerlink's
maintainers:
https://sourceforge.net/u/kubu/openPOWERLINK/ci/v1.8.5-bug-fix/tree/

> 
>> ++ELSEIF (CMAKE_SYSTEM_PROCESSOR STREQUAL "arm" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "armv7l")
> 
> I think many other values than "arm" and "armv7l" are possible.
> Actually arm* indicates it's ARM.
> 
> But since this package is anyway only selectable on x86 and x86-64 in
> Buildroot, I applied the patch nonetheless.
> 

Well, Openpowerlink is mainly used with x86 for now.
But you're right the test need to be fixed upstream.

Best regards,
-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
