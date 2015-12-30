From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Dec 2015 23:10:49 +0100
Subject: [Buildroot] [PATCH 3/3] vboot-utils: remove hash file
In-Reply-To: <20151230225333.171a6c4c@free-electrons.com>
References: <cover.1451483256.git.alex.suykov@gmail.com>
 <05e1570e0377fc9e913819765ecb8e488b6b6c1a.1451483256.git.alex.suykov@gmail.com>
 <20151230160016.14524b1f@free-electrons.com> <56844F79.3080903@mind.be>
 <20151230225333.171a6c4c@free-electrons.com>
Message-ID: <56845669.3050005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-12-15 22:53, Thomas Petazzoni wrote:
> Arnout,
> 
> On Wed, 30 Dec 2015 22:41:13 +0100, Arnout Vandecappelle wrote:
> 
>>> I *think* this was part of the conclusion we had at the latest
>>> Buildroot Developers Meeting, even if the write up at
>>> http://elinux.org/Buildroot:DeveloperDaysELCE2015 doesn't make this
>>> completely clear.
>>
>>  I think we didn't get to a clear conclusion, except about the github hashes.
> 
> OK, so what do we do ?

 IIRC the main reason why we didn't fully go for the "add hash files for all
packages" approach was that we would need to add an empty hash file for about
300 packages. But then we discovered that github could have hash files, but we
weren't entirely sure yet if that was really true.

 So I think now we can safely conclude that a hash file should be added for all
packages, even if it just contains 'none' hashes. It is definitely an advantage
to be able to distinguish packages that should still get a hash from packages of
which we already decided that the hash should be 'none'.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
