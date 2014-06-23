From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Jun 2014 11:20:13 +0200
Subject: [Buildroot] [PATCH v2 1/3] Makefile: target-finalize: add
	TARGET_FINALIZE_HOOKS
In-Reply-To: <CAHkwnC85aJyCdojijcmak=A+Z_TH9Vj_xdqsrXNmkiRj=HRD2Q@mail.gmail.com>
References: <1403252778-19761-1-git-send-email-fabio.porcedda@gmail.com>
 <1403252778-19761-2-git-send-email-fabio.porcedda@gmail.com>
 <53A4C196.3060800@mind.be>
 <CAHkwnC85aJyCdojijcmak=A+Z_TH9Vj_xdqsrXNmkiRj=HRD2Q@mail.gmail.com>
Message-ID: <53A7F14D.1070607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/06/14 11:14, Fabio Porcedda wrote:
> On Sat, Jun 21, 2014 at 1:19 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 20/06/14 10:26, Fabio Porcedda wrote:
>>> Add TARGET_FINALIZE_HOOKS to the "target-finalize" rule to be able to
>>> add to it commands as needed.
>>> This is useful for having a nicer output because commands are executed
>>> after the "target-finalize" initial message, also it is useful to ensure
>>> an executing order even when top-level parallel makefile is being used.
>>
>>  This commit message suggests that the patch would just add the call to the
>> hooks, not actually changing the purge-locales implementation (which would be a
>> separate patch).
>>
>>  For me, it doesn't have to a be a separate patch, but at least that additional
>> change should be mentioned in the commit message.
> 
> Ok, i will add at the end:
> 
> Also convert "TARGET_PURGE_LOCALES" to a hook that use

 uses


 You can also add my

    Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

in that case.

 Regards,
 Arnout

> "TARGET_FINALIZE_HOOKS".
> 
> Thanks && BR
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
