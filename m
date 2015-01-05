From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 5 Jan 2015 00:15:32 -0500
Subject: [Buildroot] [PATCH v2] erlang: selectively enable libatomic_ops
In-Reply-To: <20150104142105.GA4137@free.fr>
References: <1419295981-30100-1-git-send-email-fhunleth@troodon-software.com>
 <20150104142105.GA4137@free.fr>
Message-ID: <CA+-urNQpwAe551i_A8yqfmr10-6-fZwXnotSaWYqq7wmv_eS1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas,

On Sun, Jan 4, 2015 at 9:21 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Frank, All,
>
> On 2014-12-22 19:53 -0500, Frank Hunleth spake thusly:
>> Erlang can use either the system libatomic_ops or its own version.
>> However, if using the system version, it must find implementations for
>> AO_compare_and_swap() and other calls.  Since these are not available on
>> ARM versions before armv6+, selectively enable the use of the system
>> libatomic_ops.
>>
>> Fixes:
>>   http://autobuild.buildroot.net/results/eba/eba5bf85e9ff98916cd3638b5f13ab5bd54564d8/
>>   http://autobuild.buildroot.net/results/c74/c743cfca629fb332bbb1327cf4ea360f0a4e4bfe/
>>   http://autobuild.buildroot.net/results/095/095348d4d309c2a408a3b297b4325348ed1dd7e8/
>>
>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>
> I've sent an alternate solution to this libatomic_ops issue:
>     http://patchwork.ozlabs.org/patch/425174/
>
> This is much simpler, Buildroot-wise, as it essentially patches erlang,
> so that it properly use libatomic_ops.
>
> This is the result of a past discussion with Thomas P. on IRC, where he
> pointed me to a patch we have against libunwind, that does require CAS
> too, and for which we add `#define AO_REQUIRE_CAS', as instructed in the
> libatomic_ops documentation.
>
> Could you please test that new patch and report on it, please?

Yes. I didn't know about AO_REQUIRE_CAS, but it does sound better.
I'll try out the patch when I get a chance - probably Wednesday. Sorry
that I can't try it sooner.

Thanks,
Frank
