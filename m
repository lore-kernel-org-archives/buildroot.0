From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Thu, 22 Nov 2018 20:02:33 +0100
Subject: [Buildroot] [PATCH] libtool: Make libltdl a separate package
In-Reply-To: <20181112080642.GB10271@scaer>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111221717.0855ea32@windsurf.home>
 <56b213a9-830f-e08f-faba-401d7296e32c@mind.be> <20181112080642.GB10271@scaer>
Message-ID: <b9799191-50f7-1fdf-90ab-c20822691b31@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, Arnout, Thomas,

On 12/11/2018 09:06, Yann E. MORIN wrote:
> On 2018-11-11 23:15 +0100, Arnout Vandecappelle spake thusly:
>> On 11/11/2018 22:17, Thomas Petazzoni wrote:
>>> On Sun, 11 Nov 2018 16:06:46 +0100, Alexander Sverdlin wrote:
>>>> This will save megabytes on the target filesystem if target packages only
>>>> require libltdl part of libtool.
>>> In fact, I don't think we need the full libtool on the target at all,
>>> so perhaps we should just change the existing libtool package in its
>>> target variant to only install libltdl ?
> [--SNIP--]
>>  I agree. If anybody needs the rest of libtool, then we can add an option like
>> BR2_PACKAGE_LIBTOOL_FULL or _TOOLS or something like that,
> Agreed.
> 
>> similar to e.g.
>> libcurl (where BTW curl was originally a separate package but we merged it).
> Exceot that, because of that legacy, curl is a bad example, as the
> option is badly named.
> 
> A better exaple would be libcap (_TOOLS) or gnutls (_UTILS).
> 
> I would favour the _TOOLS suffix, even though we have both in tree.

But it seems that HOST_LIBTOOL package is widely used and it would look awkward
for me if we would build completely different stuff for LIBTOOL and HOST_LIBTOOL
package variants.

I'd rather go with LIBTOOL_RUNTIME package (or indeed LIBLTDL?), I can merge it into
libtool.mk and make all 4 target packages depend on it instead of full libtool.

What are your thoughts?

--
Alexander.
