From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Oct 2013 10:12:42 +0200
Subject: [Buildroot] [PATCH v8 RESEND 1/8] package: add base dependency
 to every package
In-Reply-To: <CAHkwnC9s0ZqVoE-5pZFwxb4adFw0hD3+SxrF4ri7jStbxypjTA@mail.gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-2-git-send-email-fabio.porcedda@gmail.com>
 <52683BBC.7070506@mind.be>
 <CAHkwnC_3oA+DKkUxVweB0Xt5wqWt11epFujXvmStEu25hGQNOA@mail.gmail.com>
 <5268F861.6050803@mind.be>
 <CAHkwnC9s0ZqVoE-5pZFwxb4adFw0hD3+SxrF4ri7jStbxypjTA@mail.gmail.com>
Message-ID: <526A27FA.10602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/10/13 10:07, Fabio Porcedda wrote:
> On Thu, Oct 24, 2013 at 12:37 PM, Arnout Vandecappelle<arnout@mind.be>  wrote:
>> >On 24/10/13 09:41, Fabio Porcedda wrote:
>>> >>
[snip]
>>> >>I've found a work around:
>>> >>
>>> >>$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
>>> >>
>>> >># to prevent circular dependency
>>> >>ifneq ($(1),$(DEPENDENCIES_HOST_PREREQ))
>>> >>$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
>>> >>endif
>>> >>
>>> >>What do you think about that?
>> >
>> >
>> >  Looks good except that it's incorrect:-)  If HOST_PREREQ contains both
>> >ccache and sstrip (not to mention tar or xz), the condition won't match. You
>> >can try something like:
>> >
>> >ifeq ($(filter $(1),$(DEPENDENCIES_HOST_PREREQ)),)
> Ok good, I've updated the patch according.
>

  Have you tested it with various combinations of dependencies?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
