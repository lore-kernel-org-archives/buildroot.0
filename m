From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 22 Apr 2017 23:57:14 +0200
Subject: [Buildroot] [PATCH v8 04/12] e2fsprogs: remove uuidgen support
In-Reply-To: <20170422142939.059c5ea6@free-electrons.com>
References: <20170422115955.22718-1-arnout@mind.be>
 <20170422115955.22718-5-arnout@mind.be>
 <20170422142939.059c5ea6@free-electrons.com>
Message-ID: <0c070703-ad51-3ce3-d799-5968e99ace3f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-04-17 14:29, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 22 Apr 2017 13:59:47 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> From: Carlos Santos <casantos@datacom.ind.br>
>>
>> In fact, uuidgen was never built because we pass --disable-libuuid. So
>> the option was a NOP.
>>
>> Remove the license info for libuuid.
>>
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> [Arnout:
>>  - do not remove --disable-uuidd - even though that is implied by
>>    --disable-libuuid, it's better to be explicit about it;
>>  - remove license info of libuuid]
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>  package/e2fsprogs/Config.in    | 7 +++----
>>  package/e2fsprogs/e2fsprogs.mk | 5 ++---
>>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> Applied to master, thanks. I suppose the logic for not having a
> Config.in.legacy entry is that the tool had never been installed
> anyway, so nobody could have been relying on this option to install
> uuidgen. Am I right?

 No, I just forgot :-) But indeed, the option was dysfunctional since commit
044edd063 back in 2011, so no need for legacy handling.


 Regards,
 Arnout

> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
