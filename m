From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2019 09:49:03 +0100
Subject: [Buildroot] [PATCH 2/4] toolchain: check the SSP option is known
In-Reply-To: <29010_1552372901_5C8754A5_29010_303_1_20190312064139.GD4924@r-lnx-nyma7486-2>
References: <cover.1552286891.git.yann.morin@orange.com>
 <8928_1552286905_5C8604B9_8928_93_1_836f3203-3172-44de-a772-1825aafd915d@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <f8725159-1dae-da34-de01-dbf681de2169@mind.be>
 <20190312061810.GB4924@r-lnx-nyma7486-2>
 <29010_1552372901_5C8754A5_29010_303_1_20190312064139.GD4924@r-lnx-nyma7486-2>
Message-ID: <7df764e1-1b90-2026-238f-d493c027c389@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/03/2019 07:41, yann.morin at orange.com wrote:
> Arnout, All,
> 
> On 2019-03-12 07:18 +0100, MORIN Yann TGI/OLS spake thusly:
>> On 2019-03-12 01:25 +0100, Arnout Vandecappelle spake thusly:
> [--SNIP--]
>>>  I notice that in vlc.mk, we have
>>> ax_cv_check_cflags___fstack_protector_strong=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
>> I'll check what vlc really wants it for (e.g. strong, all, regular?),
>> fix and send a patch.
> 
> So, vlc already depends on gcc >= 4.9 anyway, so there will always have
> support for fstack-protctor-strong, and this legacy wart can be removed
> now, I guess.

 Not at all! gcc >= 4.9 doesn't guarantee SSP availability, only that if SSP is
available, then -fstack-protector=strong will work. So the check is correct
because vlc depends on gcc >= 4.9.

 Regards,
 Arnout
