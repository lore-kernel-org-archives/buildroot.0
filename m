From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Apr 2015 22:13:57 +0200
Subject: [Buildroot] [PATCHv3 09/18] pkg-generic: remove the
 .stamp_rsync_sourced fake stamp file
In-Reply-To: <20150425194948.70ff9724@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>	<1429972982-25495-10-git-send-email-thomas.petazzoni@free-electrons.com>	<20150425173303.GJ4275@free.fr>
 <20150425194948.70ff9724@free-electrons.com>
Message-ID: <553FEA05.4040200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/25/15 19:49, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Sat, 25 Apr 2015 19:33:03 +0200, Yann E. MORIN wrote:
> 
>>> -$(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
>>> +$(1)-source:
>>
>> The reason that line existed was to be able to define a dependency on
>> the stamp file. There is now no reason to keep this line at all; all you
>> have above is declaring a make goal without dependency or rule, so it
>> is entirely useless.
> 
> I don't think a target with no dependencies or rules is useless. It can
> be useful to not have an error when this target is triggered.
> 
> When you are going to do a 'make source', it will do a 'make
> $(1)-source' on all packages, including the ones that have
> <pkg>_OVERRIDE_SRCDIR. So there must be a $(1)-source target, even if
> it doesn't do anything.
> 
> Am I missing something?

 Actually, adding it to .PHONY is sufficient, there's no need to declare it
explicitly. But of course it doesn't hurt either, and this patch was already
committed.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
