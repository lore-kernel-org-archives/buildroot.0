From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 May 2014 21:53:39 +0200
Subject: [Buildroot] [PATCH v3] toolchain-external: Fix EABIhf check
In-Reply-To: <CAAXf6LUActiMzXEXGqUJDkmrGhb_LXNaf1=Ca+A16PurGRBuBQ@mail.gmail.com>
References: <2531b66f78bfdb046ddb.1399375540@argentina>
 <536C06AF.2000107@mind.be>
 <CAAXf6LUActiMzXEXGqUJDkmrGhb_LXNaf1=Ca+A16PurGRBuBQ@mail.gmail.com>
Message-ID: <536D3243.9090704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/05/14 09:23, Thomas De Schampheleire wrote:
> Hi Arnout,
> 
> On Fri, May 9, 2014 at 12:35 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 06/05/14 13:25, Thomas De Schampheleire wrote:
[snip]
>>
>>> +             abistr_$(BR2_ARM_EABI)='EABI'; \
>>> +             abistr_$(BR2_ARM_EABIHF)='EABIhf'; \
>>> +             echo "Incorrect ABI setting: $${abistr_y} selected, but toolchain is incompatible"; \
>>
>>  Nice approach! But to keep the original output, you could use:
>>
>> $${abistr_y} selected, but toolchain uses $${abistr_}
>>
> 
> This did cross my mind, but it assumes that there are only two
> possibilities: EABI and EABIhf. Suppose that a new EABI pops up. Or
> suppose the compilation/link step fails for a completely different
> reason. Then we have told the user that their toolchain is EABI or
> EABIhf while it is not true.
> So here I choice correctness over completeness, but if you prefer I
> can change it. Do let me know if you still think we should add
> $${abistr_} to the message.

 Good point, let's say "incompatible" then.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
