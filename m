From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 05 Feb 2015 14:25:18 +0100
Subject: [Buildroot] [RFC 0/4] legal-info: save the external-toolchain
 source archive
In-Reply-To: <54CFEB27.7060404@mind.be>
References: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
 <54CFEB27.7060404@mind.be>
Message-ID: <54D36F3E.2060706@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

thanks for the review.
I guess it means there is some interest in having this feature.

Arnout Vandecappelle wrote:
> On 02/01/15 12:43, Luca Ceresoli wrote:
> [snip]
>> The current solution works, but it shows some drawbacks.
>>
>> First, the "actual source" is downloaded by 'make legal-info', not 'make
>> source'. This might be good for most users: after all, you don't need the
>> toolchain source code for daily development, only when releasing. These files
>> are large, hundreds of MBs, so saving time and bandwidth seems nice. however,
>> this diverges from the well-defined feature of 'make source', which is
>> supposed to download everything needed to later work offline.
>
>   I think that 'make legal-info' is indeed sufficiently different from the
> 'normal build' that it is OK for it to not be covered by 'make source'. So I
> wouldn't worry about this drawback.

Good to see we are on the same page. Mentioning this behaviour in the
docs should be enough.

>> Additionally, there's no "actual" version of FOO_EXTRA_DOWNLOADS. Thus
>> Blackfin toolchains, which use that feature, cannot habdled in a complete way.
>> Of course adding TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_EXTRA_DOWNLOADS is possible,
>> but I wonder if we want to add so any variables to the package infra.
>
>   I think it would be pretty easy for FOO_ACTUAL_SOURCE to be a list of files
> rather than a single file, and that would nicely work around this issue.

Good idea. It would work well provided that all files are hosted on the
same directory. This seems to be the case for the Blackfin toolchains.

After all, it is the same limitation we have for FOO_EXTRA_DOWNLOADS.

Regards,
-- 
Luca
