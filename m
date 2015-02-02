From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Feb 2015 22:49:49 +0100
Subject: [Buildroot] [RFC 2/4] legal-info: allow to declare the actual
 sources for binary packages
In-Reply-To: <54CFF057.2060000@mind.be>
References: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
 <1420199015-16907-3-git-send-email-luca@lucaceresoli.net>
 <54CFF057.2060000@mind.be>
Message-ID: <54CFF0FD.7090700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/02/15 22:47, Arnout Vandecappelle wrote:
> On 02/01/15 12:43, Luca Ceresoli wrote:
>> The FOO_SITE/FOO_SOURCE variables usually point to a tarball containing
>> source code.
>>
>> For the downloaded external toolchains this is not true, the "source"
>> tarball actually contains binaries. This is fine for making Buildroot
>> work, but for legal-info we really want to ship real source code, not
>> binaries.
>>
>> Luckily, some (hopefully all) toolchain vendors publish a downloadable
>> tarball containing the source code counterpart for their binary
>> packages.
>>
>> Here we allow the user to declare the URL of this other tarball in the
>> pair of variables FOO_ACTUAL_SOURCE_TARBALL (by default equal to
>> FOO_SOURCE) and FOO_ACTUAL_SOURCE_SITE (by default equal to FOO_SITE).
>> If the "actual source" package can be downloaded from the same
>> directory as the binary package, then only FOO_ACTUAL_SOURCE_TARBALL
>> needs to be set.
>>
>> Note this change is not strictly toolchain-specific: it might be useful
>> for other packages that happen to ship binaries in the same way.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  It is adding even more complexity to the already too complex legal-info target,
> but it doesn't look too bad. Although I would indeed prefer a pre-legal-info
> hook. But even that wouldn't be enough, because the source reference in the
> manifest would still be wrong...

 Since my comments aren't serious and the pre-legal-info-hook is probably not
feasible after all, you can just repost (with my Reviewed-by tag) if you don't
feel like changing anything.


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
