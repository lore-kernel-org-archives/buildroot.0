From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Jun 2016 00:54:05 +0200
Subject: [Buildroot] [PATCH 1/7] core/pkg-utils: add macro to
 escape-and-printf
In-Reply-To: <20160606212555.GB3706@free.fr>
References: <cover.1465245732.git.yann.morin.1998@free.fr>
 <11da03a97bde4e0332be6577a83e1476566d8e9f.1465245732.git.yann.morin.1998@free.fr>
 <20160606230723.7ba46894@free-electrons.com> <20160606212555.GB3706@free.fr>
Message-ID: <c08ceca8-cbbb-8103-442c-6ddf57a6d9cc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06-06-16 23:25, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2016-06-06 23:07 +0200, Thomas Petazzoni spake thusly:
>> On Mon,  6 Jun 2016 22:43:38 +0200, Yann E. MORIN wrote:
>>
>>> +define PRINTF
>>> +	printf '$(subst $(sep),\n,\
>>> +			$(subst $(PERCENT),$(PERCENT)$(PERCENT),\
>>> +				$(subst $(QUOTE),$(QUOTE)\$(QUOTE)$(QUOTE),\
>>> +					$(subst \,\\,$(1)))))\n'
>>> +endef
>>
>> Do we expect this to be used outside of fs/common.mk? Since it's not
>> the case today, I would suggest to move it there.
> 
> Indeed I don;t plan on using it outside of the fs infra for now (I have
> another series that will rely on it, but still in the fs infra).
> 
> However, this is generic enough that it is not specific to the fs infra.
> Thus I believe it belong to pkg-utils.
> 
> If you still prefer I move it to fs/common.mk, that's also OK for me.

 I think pkg-utils is the proper place. I imagine that there can be many other
places where this can be useful. And even if it is only used in the fs infra, I
would go and look for a function like that in pkg-utils.mk.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
