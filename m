From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 21:17:58 +0200
Subject: [Buildroot] [PATCHv5] system: allow/disallow root login,
 accept encoded passwords
In-Reply-To: <20150414175443.GA4053@free.fr>
References: <1428702127-17152-1-git-send-email-yann.morin.1998@free.fr>
 <552C484F.1070105@mind.be> <20150414175443.GA4053@free.fr>
Message-ID: <552D67E6.5050300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/04/15 19:54, Yann E. MORIN wrote:
[snip]
>>  However, since the default is y while it is normally n, and since we have to do
>> something special for the n case, wouldn't it make more sense to call it
>> BR2_TARGET_DISABLE_ROOT_LOGIN?
> 
> Well, I do really prefer positive naming; and we tend to use such
> positive logic about everywhere...
> 
> That the internals are "more complex" (and that still has to be proven)
> is irrelevant to what we present to the user. At the extreme, we could
> always have a hidden variable that just negates the visible one.

 OK for me. A hidden variable would be overkill.

[snip]
>>> +SYSTEM_ROOT_PASSWORD = $(TARGET_GENERIC_ROOT_PASSWD)
>>> +else
>>> +SYSTEM_ROOT_PASSWORD = $(shell $(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")
>>> +endif
>>> +else # !BR2_TARGET_ENABLE_ROOT_LOGIN
>>> +SYSTEM_ROOT_PASSWORD = *
>>
>>  Even though Peter prefers positive logic, I think in this case it is more
>> important to keep the logic close to the condition, i.e.:
>>
>> ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),)
>> SYSTEM_ROOT_PASSWORD = *
>> else ifeq ($(TARGET_GENERIC_ROOT_PASSWD),)
>> ...
> 
> Well, that was what Thomas initially suggested. But like Peter, I do
> really prefer positive logic, so I'm heavily tempted to keep what I
> wrote, unless others speak up and shout (sooned rather than later!). ;-)

 That's two against two then :-)

 But since you're the patch owner and Peter is the BDFL, I guess it will be
positive logic.

 Regards,
 Arnout

> 
> Thanks for the review! :-)
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
