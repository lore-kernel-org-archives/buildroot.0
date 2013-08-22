From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 22 Aug 2013 09:15:01 +0200
Subject: [Buildroot] [PATCH v2] harfbuzz: New package
In-Reply-To: <52152E95.2080206@mind.be>
References: <1376926609-11561-1-git-send-email-markos.chandras@imgtec.com>
 <52152E95.2080206@mind.be>
Message-ID: <5215BA75.9080408@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Arnout Vandecappelle wrote:
> On 19/08/13 17:36, Markos Chandras wrote:
>> HarfBuzz is an OpenType text shaping engine
>>
>> http://www.freedesktop.org/wiki/Software/HarfBuzz/
>>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com> 
...
>> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
>> new file mode 100644
>> index 0000000..9aee90f
>> --- /dev/null
>> +++ b/package/harfbuzz/harfbuzz.mk
>> @@ -0,0 +1,44 @@
>> +################################################################################ 
>>
>> +#
>> +# harfbuzz
>> +#
>> +################################################################################ 
>>
>> +
>> +HARFBUZZ_VERSION = 0.9.19
>> +HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release/
>> +HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
>> +HARFBUZZ_LICENSE = Old-MIT ISC ICU
>
>  What is Old-MIT?

It's been amazing to discover how many MIT license variants, all 
"functionally
identical",do exist (at least according to
https://fedoraproject.org/wiki/Licensing:MIT?rd=Licensing/MIT).

The one used in harfbuzz is not the one published on the OSI website, but it
identical to the "Modern variants" wording on the fedora link above.
So I guess it actually is an MITlicense...

> We still haven't had the final word on how the LICENSE string should 
> be formatted, but I think it is something like this:
>
>  MIT, ISC (ucdn library), ICU License (icu support library)
>
>  Luca, can you confirm?

It's never been madeofficial, but that's what we kind of agreed, and IMO the
best choice.
Alas, not all packaged are compliant in current BR, but that's another 
issue.

Luca
