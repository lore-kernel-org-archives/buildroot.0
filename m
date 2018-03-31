From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 1 Apr 2018 00:31:40 +0200
Subject: [Buildroot] [PATCH] netcat: add forced dependence on BusyBox
In-Reply-To: <598357b1-0a95-a38d-9704-bfe7adae0f20@mind.be>
References: <20171012151418.3523-1-casantos@datacom.ind.br>
 <20171012151418.3523-2-casantos@datacom.ind.br>
 <00cfde34-7006-40de-ecb5-307418aa97b8@smile.fr>
 <598357b1-0a95-a38d-9704-bfe7adae0f20@mind.be>
Message-ID: <d55e57ca-b630-35c8-ff88-7d5d0b5408a3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-04-18 00:25, Arnout Vandecappelle wrote:
> 
> 
> On 31-03-18 12:34, Romain Naour wrote:
>> Hi Carlos,
>>
>> Le 12/10/2017 ? 17:14, Carlos Santos a ?crit?:
>>> It may be necessary if packages become built in parallel, leading to a
>>> race condition on the creation of the "nc" link. Moreover, netcat is as
>>> shy as BusyBox and would not override an existing file/link, so we must
>>> remove $(TARGET_DIR)/usr/bin/nc in advance.
>>>
>>> Of course this still leaves a race conditon if other netcat competitors
>>> but we must assume thet the user is a grown-up person who knows what is
>>> doing.
>>
>> It seems you are using a custom busybox config file because the netcat applet is
>> disabled by default.
>>
>> I'm agree, the dependency on busybox is missing but the TARGET_HOOKS doesn't
>> seems necessary. I removed it and netcat package is able to override the busybox
>> symlink.
>>
>>  /usr/bin/install -c netcat output/target/usr/bin/netcat
> 
>  I've applied, after removing the unneeded removal of nc.
> 
>  If it turns out to be needed after all, please submit a follow-up patch.

 OK, so it *was* needed, so I pushed a follow-up commit that does the removal.

 I've done that unconditionally, though, the 'nc' could come from somewhere else
as well.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
