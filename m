From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 12:20:42 +0200
Subject: [Buildroot] ci20_defconfig fails because of missing TLS support
In-Reply-To: <20170811052707.GK28021@waldemar-brodkorb.de>
References: <d32e5a1d-aa99-f189-bdfc-5d10b10c1eda@mind.be>
 <20170811052707.GK28021@waldemar-brodkorb.de>
Message-ID: <8aea1d2b-c470-b1d4-aad9-0fe8c30e55af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-08-17 07:27, Waldemar Brodkorb wrote:
> Hi Arnout,
> Arnout Vandecappelle wrote,
> 
>>  Vicente, Waldemar,
>>
>>  Since some time (probably since some uClibc bump), the ci20_defconfig has been
>> failing with an error I don't really understand [1]:
[snip]
>>  Could you guys have a look, so we can hopefully get a fix in 2017.08?
> 
> It has nothing to do with uClibc-ng updates, it has something to do
> with gcc updates and the toolchain-wrapper. I propose a patch, which
> allows to build the toolchain, 

 Great, that looks good.

> but later u-boot fails to compile
> with gcc-6, so I can't do runtime check on my ci20 device.

 That's like the ci40 failure and can be fixed by bumping the kernel and U-Boot
to latest git.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
