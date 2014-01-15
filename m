From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Jan 2014 09:17:19 +0100
Subject: [Buildroot] [PATCH 3/6] pkg-infra: git helper creates an empty
 archive if PKG_VERSION is a missing hash
In-Reply-To: <20140114232126.GK3328@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <b528cb41d4ac90bbccf471a88485b249eabfdc82.1389569992.git.yann.morin.1998@free.fr>
 <52D5A17B.8010703@mind.be> <20140114232126.GK3328@free.fr>
Message-ID: <52D6440F.3020309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/01/14 00:21, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2014-01-14 21:43 +0100, Arnout Vandecappelle spake thusly:
>> On 13/01/14 00:44, Yann E. MORIN wrote:
>>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [--SNIP--]
>>> -${GIT} archive --prefix="${prefix}" --format=tar "${cset}"  \
>>> -|gzip -c >"${output}"
>>> +res=1
>>> +if ${GIT} rev-list -n 1 "${cset}" >/dev/null 2>&1; then
>>
>>   When we've done a shallow clone, this check is redundant because we have
>> cloned exactly this ref.
>>
>>   So instead, I'd do the check in the full clone condition, with an explicit
>> exit.
>
> I see. But it complexifies the script.
>
> And doing the check a second time ensures we did not download garbage
>
> Heck, there's even a race condition, since we check the remote, then
> clone it, and the ref may have vanished (granted, very unlikely, but
> yet...). :-p

  True. I yield to your wisdom.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
