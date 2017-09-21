From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Sep 2017 22:35:28 +0200
Subject: [Buildroot] [PATCH 1/1] Update github hashes
In-Reply-To: <87fubhxnnx.fsf@dell.be.48ers.dk>
References: <20170920112825.3971-1-bernd.kuhls@t-online.de>
 <87fubhxnnx.fsf@dell.be.48ers.dk>
Message-ID: <08b34ae7-9f32-5850-50de-8b6dba321a49@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-09-17 19:52, Peter Korsgaard wrote:
> I'm not sure updating the hashes is the correct thing to do. Sources.b.o
> runs 'make source' from the 2017.02.x and master branches to keep it
> uptodate, and E.G. freerdp hasn't been updated since 2017.02, so it will
> break hard for 2017.02.x users if we change it.

 So perhaps a workaround would be to change the hashes to none instead? That way
sources.b.o will retain the original tarballs (since they still have the
"correct" hash).

 Not changing the hash gives the problem that the packages are downloaded twice:
once from github, failing hash, and then again from sources.b.o. For 2017.02.x
users that's unavoidable, but for master users we can fix it by changing the
hash to none.

 Of course, the hash file should then have a comment explaining that the hash
should be updated again when the package is bumped.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
