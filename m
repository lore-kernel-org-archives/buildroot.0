From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 31 Mar 2018 10:48:33 +0200
Subject: [Buildroot] [PATCH 15/36] check-package: enable for toolchain/
In-Reply-To: <20180331083821.37eb87bd@windsurf>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
 <20180331022301.27501-16-ricardo.martincoski@gmail.com>
 <20180331083821.37eb87bd@windsurf>
Message-ID: <33c4f662-3550-4150-f7aa-58f1cbe38b49@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-03-18 08:38, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 30 Mar 2018 23:22:40 -0300, Ricardo Martincoski wrote:
[snip]
>> -CONFIG_IN_FILENAME = re.compile("/Config\.\S*$")
>> +CONFIG_IN_FILENAME = re.compile("/Config\.\S*$|/toolchain-common.in$")
> 
> Not directly related to your series, but I believe this
> toolchain-common.in file is silly. It is just included by
> toolchain/Config.in, and toolchain/Config.in is not that long. We
> should bring back the toolchain-common.in contents in
> toolchain/Config.in, and stop having this odd toolchain-common.in.

 +1 to that! And if you encounter other oddities like that, feel free to fix
them as well. package/Makefile.in is also one that is odd IMO.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
