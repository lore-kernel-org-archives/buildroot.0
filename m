From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Jun 2015 01:17:36 +0200
Subject: [Buildroot] [PATCH v5 3/3] kyua: new package
In-Reply-To: <20150612220205.5d0aa08b@free-electrons.com>
References: <1434063093-14906-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>	<1434063093-14906-4-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <20150612220205.5d0aa08b@free-electrons.com>
Message-ID: <557B6890.30006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/12/15 22:02, Thomas Petazzoni wrote:
> Dear Sebastien Bourdelin,
> 
> On Thu, 11 Jun 2015 18:51:33 -0400, Sebastien Bourdelin wrote:
>> Kyua is a testing framework for infrastructure software, originally
>> designed to equip BSD-based operating systems with a test suite. This
>> means that Kyua is lightweight and simple, and that Kyua integrates
>> well with various build systems and continuous integration frameworks.
>>
>> https://github.com/jmmv/kyua
>>
>> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
>> ---
>> Changes v4 -> v5:
>>   suggested by Arnout Vandecapelle <arnout@mind.be>:
>>   - force the --without-atf option to not build the example tests.
>>   - puts the dependencies &&-ed in Config.in on 2 lines
>>   - change the comment for dependencies in Config.in
> 
> Applied, thanks. I fixed a minor typo in the hash file.
> 
> However, there are a few things that might be worth looking into for
> follow-up patches:
> 
> 1/ Some installed stuff is probably unneeded:
> 
> ./usr/share/kyua/store
> ./usr/share/kyua/store/schema_v3.sql
> ./usr/share/kyua/store/migrate_v2_v3.sql
> ./usr/share/kyua/store/migrate_v1_v2.sql

 I think these are needed to be able to create the report database. Ah, but the
migrate scripts may indeed be redundant.

> ./usr/share/kyua/misc
> ./usr/share/kyua/misc/report.css
> ./usr/share/kyua/misc/test_result.html
> ./usr/share/kyua/misc/index.html
> ./usr/share/kyua/misc/context.html

 I believe these are needed to be able to generate html reports.

> ./usr/share/kyua/examples
> ./usr/share/kyua/examples/kyua.conf
> ./usr/share/kyua/examples/Kyuafile.top

 These could indeed be removed.


> 
> 2/ The CFLAGS/LDFLAGS handling seems to go crazy with zillions of
> duplicates of the same flags. At build time, one can see:

 Yeah, but that's an upstream problem, no? They include LUTOK_CFLAGS several
times. Correcting that would be a feature patch.

 Regards,
 Arnout

[snip ridiculously long command line]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
