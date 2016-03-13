From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Mar 2016 23:23:24 +0100
Subject: [Buildroot] [PATCH 1/2] gcc: preserve CXXFLAGS_FOR_TARGET
In-Reply-To: <CAMo8Bf+k+nHJsJKEWpY1=2z1z9HqOKRFLGQtG7c3JfUapaJVew@mail.gmail.com>
References: <1457657122-7283-1-git-send-email-jcmvbkbc@gmail.com>
 <1457657122-7283-2-git-send-email-jcmvbkbc@gmail.com>
 <20160312225608.GH3745@free.fr>
 <CAMo8Bf+k+nHJsJKEWpY1=2z1z9HqOKRFLGQtG7c3JfUapaJVew@mail.gmail.com>
Message-ID: <56E5E85C.2080409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/13/16 04:18, Max Filippov wrote:
> Hi Yann,
>
> On Sun, Mar 13, 2016 at 1:56 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> On 2016-03-11 03:45 +0300, Max Filippov spake thusly:
>>> gcc-4.8.x and gcc-4.9.x don't propagate CXXFLAGS_FOR_TARGET to CXXFLAGS
>>> for libstdc++ build. As a result libstdc++ is built without
>>> TARGET_CFLAGS and may fail to link with applications using it, see e.g.
>>>
>>>    http://autobuild.buildroot.net/results/81a3bca5cbcf789c7ce1aa221a6a4154dd7c3917/
>>>
>>> Instead of passing TARGET_ABI or TARGET_CFLAGS for libstdc++ in
>>> --enable-cxx-flags parameter backport the patch that fixes propagation
>>> of CXXFLAGS_FOR_TARGET to CXXFLAGS.
>>>
>>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>>> ---
>>>   package/gcc/4.8.5/130-pr43538.patch | 25 +++++++++++++++++++++++++
>>>   package/gcc/4.9.3/130-pr43538.patch | 25 +++++++++++++++++++++++++
>>
>> As already noticed by Arnout, this is not done for gcc-4.7. Is it
>> because it is not affected by the issue, or because upstream has not
>> fixed it?
>
> It's me not seeing 4.7.x in the menuconfig list. Yes, 4.7.x is affected too.
> I'll send a new version with backport to 4.7.x.

  Since 4.7 is deprecated, I don't think there is a need to add a patch for it. 
So my Reviewed-by stands.

  Regards,
  Arnout

>
>> Is the latter case, we'd still have the issue for gcc-4.7, no? Or do we
>> not care about it any more (I don't, TBH...)?
>>
>> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
