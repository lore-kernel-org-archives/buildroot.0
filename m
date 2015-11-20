From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Nov 2015 23:26:31 +0100
Subject: [Buildroot] Analysis of build results for 2015-11-18
In-Reply-To: <20151120001552.51c1b21b@free-electrons.com>
References: <20151119073014.0017E101A9A@stock.ovh.net>
 <20151120001552.51c1b21b@free-electrons.com>
Message-ID: <564F9E17.2090501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-11-15 00:15, Thomas Petazzoni wrote:
> Hello,
> 
> J?r?me, Johan, Bernd, Yann, Martin, Gustavo, R?mi, Samuel, Alexey,
> Waldemar, Clayton, please read below, there are some interesting issues
> for you :-) Thanks !
> 
> On Thu, 19 Nov 2015 08:30:13 +0100 (CET), Thomas Petazzoni wrote:
[snip]
> > microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/6e4a9ede477b031f47f7e271c38f67f432a3573c/

 This is in fact also a real build failure, not just a webkit-related timeout.
The bullet package seems to have a problem on microblaze. This was with gcc 4.9,
but I just tried with gcc 5 and that has the same problem.

 First there is a run of:

fde encoding in CMakeFiles/BulletXmlWorldImporter.dir/tinyxmlparser.o(.eh_frame)
prevents .eh_frame_hdr table being created

but then the build hangs in cc1plus of btSoftBody.cpp


 Just disable the package on microblaze?


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
