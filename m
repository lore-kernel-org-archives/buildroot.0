From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Apr 2015 09:45:38 +0200
Subject: [Buildroot] [PATCH v6 5/8] support/download: add possibility to
 not fail on missing hash
In-Reply-To: <20150419183851.GM4313@free.fr>
References: <cover.1429447148.git.yann.morin.1998@free.fr>
 <1429466158-28878-1-git-send-email-arnout@mind.be>
 <1429466158-28878-5-git-send-email-arnout@mind.be>
 <20150419183851.GM4313@free.fr>
Message-ID: <5534AEA2.9010401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/04/15 20:38, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-04-19 19:55 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>
>> In very constrained cases, it might be needed to not fail if a hash is
>> missing. This is notably the case for custom external toolchains to be
>> downloaded, because we do have a .hash file for external toolchains,
>> but we obviously can not have hashes for all existing custom toolchains
>> (he, "custom"!).
>>
>> So, add a way to avoid failing in that case.
>>
>> >From the Makefile, we export the list of files for which not to check
> 
> Stray leading '>' probably for a copy-paste from your mailer.

 pwclient git-am actually... I would have expected patchwork (or actually, the
python mail handling infra) to handle >From correctly...

> 
>> the hash. Then, from the check-hash script, if no check was done, and
>> the file we were trying to match in in this exclusion list, we just exit
>> without error.
>>
[snip]
>> diff --git a/support/download/check-hash b/support/download/check-hash
>> index 678a7ef..d378701 100755
>> --- a/support/download/check-hash
>> +++ b/support/download/check-hash
>> @@ -99,6 +99,12 @@ while read t h f; do
>>  done <"${h_file}"
>>  
>>  if [ ${nb_checks} -eq 0 ]; then
>> +    case " ${BR_NO_CHECK_HASH_FOR} " in
>> +    *\ ${base}\ *)
> 
> I don't like much the escaping when it can be avoided. We can still use
> quotes (even if not very much better), like so:
> 
>     *" ${base} "*

 It's your patch, modify as you like :-)

 I just reposted it since I anyway had it locally modified.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
