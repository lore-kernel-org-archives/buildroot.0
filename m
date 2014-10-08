From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 8 Oct 2014 12:25:54 +0100
Subject: [Buildroot] [PATCH] ser2net: Add a hash file
In-Reply-To: <5435155D.4020903@zacarias.com.ar>
References: <1412692250-13513-1-git-send-email-Vincent.Riera@imgtec.com>
 <1412692250-13513-2-git-send-email-Vincent.Riera@imgtec.com>
 <20141007192331.0908bbcd@free-electrons.com> <5434FC83.3070303@imgtec.com>
 <20141008112001.2e0b8b9b@free-electrons.com> <543505F5.4080805@imgtec.com>
 <54350DC0.3040802@zacarias.com.ar> <54350F8F.1020506@imgtec.com>
 <5435155D.4020903@zacarias.com.ar>
Message-ID: <54351F42.2090800@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/2014 11:43 AM, Gustavo Zacarias wrote:
> On 10/08/2014 07:18 AM, Markos Chandras wrote:
>> I understand that, but realistically speaking, supporting so many
>> different hashes is not very efficient. If an upstream uses weak hashes
>> for released tarballs, just verify the weak hash on your local pc and
>> then generate a strong hash yourself. Is there really a point having a
>> week md5 and a strong sha256 hash at the same time?
> 
> "strong" hashes are so for now, weak hashes were strong at the time too
> remember, they're, grossly said, glorified checksums/CRCs (which were
> also considered well enough until the data set and computation power grew).
> If you truly want to ensure a certain degree of tamper resistance you
> need to go to the 2-way collision.
> After all a single value of 256 or 512 bits representing a file of 1 MB
> of compressed data is bound to hit some issue eventually.
> With two different hashing methods it's statistically very complex to
> win the lottery.
> Regards.
> 
Sure. But this probably is not a strong argument because for all I know
they may find sha256 broken tomorrow morning and you have to update all
the buildroot packages using that hash to verify the tarball. If you
think something is "not strong enough" then don't use it :)
Perhaps it's best if buildroot supported the two strongest algorithms
and request that information for every package? I really see no point
supporting eg md5 since we know it's weak. Anyway, that's my personal
opinion, I just feel there is no clear "rule" here so developers are
free to use whatever they want which may not always be acceptable by the
maintainers :)

-- 
markos
