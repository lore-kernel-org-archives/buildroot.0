From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 16:03:47 +0200
Subject: [Buildroot] [PATCH 21/50 v2] package/busybox: invert dependency
 with nmap
In-Reply-To: <20180708123811.GA7163@scaer>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
 <fba5b7de12815934cfa42099d998d5bbdd6ddb80.1531043163.git.yann.morin.1998@free.fr>
 <62372b6e-9150-55e0-18df-353e00731d75@mind.be> <20180708123811.GA7163@scaer>
Message-ID: <ad538a15-2817-22df-f153-2992490cfb37@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-07-18 14:38, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2018-07-08 13:12 +0200, Arnout Vandecappelle spake thusly:
>> On 08-07-18 11:45, Yann E. MORIN wrote:
>>> We only need that dependency whan nmap's ncat is enabled.
>>>
>>> For consistency, we add a dependency on nmap, not a suboption of it,
>>> to have a dependency list in busybox that is only about packages, and
>>> directly associates the upper-case package variable to the lower-case
>>> package name, e.g. NMAP <-> nmap.
>>
>>  I have extended this commit message a little bit to make it explicit that we
>> get a spurious dependency, but that that's a small price to pay.
> 
> You added:
> 
>     Thus, if BR2_PACKAGE_NMAP_NCAT is selected, we have a redundant
>     dependency. But that doesn't hurt and it really simplifies things.
> 
> But that's is the opposite: the dependency *is* usefull when nmap's ncat
> is enabled. So did you meant to write instead:
> 
>     Thus, if BR2_PACKAGE_NMAP_NCAT is disabled, we have a useless
>     dependency. [...]

 Argh, yes of course I meant NOT selected...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
