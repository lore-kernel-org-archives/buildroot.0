From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Apr 2017 12:35:52 +0200
Subject: [Buildroot] [PATCH v5 03/13] support/test-pkg: calculate
 toolchain name only once
In-Reply-To: <20170406205116.GD3538@scaer>
References: <cover.1491502445.git.arnout@mind.be>
 <20170406181854.5242-3-arnout@mind.be> <20170406205116.GD3538@scaer>
Message-ID: <e1296005-3c0a-b12e-8032-6f7549e12609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-04-17 22:51, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2017-04-06 20:18 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>
>> The toolchain name was calculated in main() for reporting to the user,
>> and again in build_one() for creating the build directory. Calculate
>> it only once, in main(), and pass the build directory as an argument
>> to build_one().
>>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> I'm not sure why the mkdir is also moved up to main() - IMO, it fits
>> better in build_one(). Yann, the original commit message was just
>> "create build dir from caller", any reason _why_ you did that?
> 
> Because when I initially did the legal-info step, it was in a spearate
> function, not in build_one, so it looked more logicial to create the
> directory in main().
> 
> But now it is not really meaningful anymore, indeed...

 OK, in v6 it will move back down into build_one.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
