From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 22 May 2018 23:22:43 +0200
Subject: [Buildroot] [RFC] [PATCH v2 2/2] support/kconfig: Bump to
 kconfig from Linux 4.17-rc2
In-Reply-To: <20180520165009.56b44d9b@windsurf>
References: <20180509164412.31596-1-petr.vorel@gmail.com>
 <20180509164412.31596-2-petr.vorel@gmail.com>
 <20180519230311.6a3652fd@windsurf> <20180520142311.GA3453@scaer>
 <20180520143139.GA14607@x230> <20180520144141.GB3453@scaer>
 <20180520165009.56b44d9b@windsurf>
Message-ID: <dcf8150e-1eb1-ba10-09e6-d3eb0bffaf2b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-05-18 16:50, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 20 May 2018 16:41:41 +0200, Yann E. MORIN wrote:
> 
>> I initially did not reply further to this part, becuase I seem to
>> remember that there was a change in behavious with certain versions of
>> flex/bison, that made the output change drastically, and I was afraid we
>> could be bitten by this...
>>
>> But in the end, this is not a problem, because we would not care to
>> mix-n-match files built with different versions of said tools, as they
>> would be those from the distro, always, and never those we ship, since
>> we would no longer ship them.
>>
>> And eventually, I now remember that the issue was with gperf changing
>> its API (a function prototype changed), and that was causing pain. But
>> now, kconfig no longer uses gperf to start with, so no incompatibility
>> anymore anyway.
>>
>> Which would allow us to drop the dependency of linux on host-{flex,bison}
>> that we had to add recently.
> 
> If we start relying on the system-installed flex and bison, then we
> should remove host-flex and host-bison entirely, not only for the linux
> package. The question is whether bison and flex both behave in a
> reasonably similar way regardless of which version is used.

 I briefly looked at this in Paris, and it became clear very quickly that even a
minor change in the bison version would give a completely different .c file. If
this is a source file that will be built for the target, it's going to be a
major reproducibility-killer. So I don't think we can remove host-bison and
host-flex.

 Regards,
 Arnout

> 
> When I see that even "tar" does not have a sufficiently stable
> behavior (which forces us to build host-tar), I'm a bit worried about
> more complex tools such as flex and bison.
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
