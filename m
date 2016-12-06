From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Dec 2016 21:06:26 +0100
Subject: [Buildroot] [RFC v2 4/4] support/download/git: shallow fetch of
 all branches
In-Reply-To: <1029334462.1039759.1481052606310.JavaMail.zimbra@datacom.ind.br>
References: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
 <20161202152123.20399-5-ricardo.martincoski@datacom.ind.br>
 <CA+fik51+qcpnLCT9RuEvyGKf5Yf5-XNz5KLv3G-vfnE485unEg@mail.gmail.com>
 <1029334462.1039759.1481052606310.JavaMail.zimbra@datacom.ind.br>
Message-ID: <c0839dc0-aa61-6ddb-dfaa-fdc6cc169f7c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-12-16 20:30, Ricardo Martincoski wrote:
> Brandon,
> 
> Thank you for your tests.
> 
> On December 6, 2016 3:13:08 PM, Brandon Maier wrote:
>>> As a middle ground between a --depth 1 fetch and a full clone, fetch all 
>>> branches with depth of 100. We have a good change to catch the desired 
>>
>> Should this be "good chance"? 
> 
> Yes.
> 
> 
>> Also, is there any particular reason for depth 100? 
> 
> No particular reason. It was only a guess.

 The reasoning is mainly that the difference between depth 1 and depth 100 is
usually negligible. This may however not be true, particularly for repos with
large binaries.

 Even better would be to do an incremental search, start at 1, multiply by 10
every iteration until you find the wanted commit. But I'm not sure that the
savings warrant the additional complexity, and also the additional overhead of
reconnecting a few times.


 Regards,
 Arnout


>>> ... 
>>> + # As a middle ground between a --depth 1 fetch and a full fetch, fetch all 
>>> + # branches with depth of 100. We have a good change to catch the desired 
>>
>> Again, "good chance"? 
> 
> Yes.
> 
> 
>> Altogether good idea Ricardio, I like the "--depth 100" feature. This will be helpful for our team as well.
> 
> Actually it was not my idea, Arnout suggested the feature at
> http://patchwork.ozlabs.org/patch/690098/
> 
> 
> Regards,
> Ricardo Martincoski
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
