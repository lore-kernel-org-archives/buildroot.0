From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 May 2018 12:44:28 +0200
Subject: [Buildroot] [RFC] [PATCH v2 2/2] support/kconfig: Bump to
 kconfig from Linux 4.17-rc2
In-Reply-To: <20180528203743.GK2965@scaer>
References: <20180509164412.31596-1-petr.vorel@gmail.com>
 <20180509164412.31596-2-petr.vorel@gmail.com>
 <20180519230311.6a3652fd@windsurf> <20180520142311.GA3453@scaer>
 <20180520143139.GA14607@x230> <20180520144141.GB3453@scaer>
 <20180520165009.56b44d9b@windsurf>
 <dcf8150e-1eb1-ba10-09e6-d3eb0bffaf2b@mind.be> <20180528203743.GK2965@scaer>
Message-ID: <67a166b0-1466-8bd9-86be-3a8f3d7a4079@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-05-18 22:37, Yann E. MORIN wrote:
> Arnout, Thomas, All,
> 
> On 2018-05-22 23:22 +0200, Arnout Vandecappelle spake thusly:
>> On 20-05-18 16:50, Thomas Petazzoni wrote:
[snip]
>>> If we start relying on the system-installed flex and bison, then we
>>> should remove host-flex and host-bison entirely, not only for the linux
>>> package. The question is whether bison and flex both behave in a
>>> reasonably similar way regardless of which version is used.
>>
>>  I briefly looked at this in Paris, and it became clear very quickly that even a
>> minor change in the bison version would give a completely different .c file. If
>> this is a source file that will be built for the target, it's going to be a
>> major reproducibility-killer. So I don't think we can remove host-bison and
>> host-flex.
> 
> We're only talking about dropping the need for host-flex and host-bison
> for the kconfig stuff. In this case, we don;t care that the user
> generates C code one way or another: it's only a host tool...

 I was replying to Thomas's "we should remove host-flex and host-bison
entirely". Yes we can rely on system-installed flex and bison for kconfig, but
we can't rely on that for target packages, e.g. target dtc.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
