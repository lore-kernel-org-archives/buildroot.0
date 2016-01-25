From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Jan 2016 01:16:16 +0100
Subject: [Buildroot] [RFC 2/2] remove download suppression from mke2img
 and skeleton
In-Reply-To: <CAAXf6LVDeQLa+NFb5P_HPdh_wbEvv60F59v=suCSsGbcCM=WKg@mail.gmail.com>
References: <39cc9541d430e29d38dc07ef2c1d975687cf2af3.1443645945.git.alex.suykov@gmail.com>
 <1b24de4a1afafff779eebb3cbe551dc18f8a2993.1443645945.git.alex.suykov@gmail.com>
 <20160119223334.GI3360@free.fr>
 <CAAXf6LVDeQLa+NFb5P_HPdh_wbEvv60F59v=suCSsGbcCM=WKg@mail.gmail.com>
Message-ID: <56A56950.4060105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-01-16 15:14, Thomas De Schampheleire wrote:
> On Tue, Jan 19, 2016 at 11:33 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Alex, All,
>>
>> On 2015-10-01 00:13 +0300, Alex Suykov spake thusly:
>>> With non-versioned packages patch applied, there is no need
>>> to set empty _SOURCE.
>>>
>>> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
>>
>> After the previous patch has been applied:
>>
>> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[snip]
>>> -# source included in buildroot
>>> -SKELETON_SOURCE =
>>> -
>>>  # The skeleton can't depend on the toolchain, since all packages depends on the
>>>  # skeleton and the toolchain is a target package, as is skeleton.
>>>  # Hence, skeleton would depends on the toolchain and the toolchain would depend
>>
> 
> Question is whether it is correct that mke2img and skeleton are unversioned.
> Packages that are similar are makedevs, mkpasswd and getent, where the
> _VERSION is explicitly set to match the Buildroot version:
> MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
> I think that mke2img is in the same boat as these packages, and so
> should follow the same strategy.

 +1 to that.

 Alex, will you send a v2 that sets the version of mke2img and skeleton to
buildroot-$(BR2_VERSION) instead?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
