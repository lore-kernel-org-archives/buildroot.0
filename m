From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Nov 2015 22:14:05 +0100
Subject: [Buildroot] Analysis of build results for 2015-11-18
In-Reply-To: <20151121092308.51921dcc@free-electrons.com>
References: <20151119073014.0017E101A9A@stock.ovh.net>
 <20151120001552.51c1b21b@free-electrons.com> <564F9E17.2090501@mind.be>
 <20151121092308.51921dcc@free-electrons.com>
Message-ID: <5650DE9D.90803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-11-15 09:23, Thomas Petazzoni wrote:
> Arnout,
> 
> On Fri, 20 Nov 2015 23:26:31 +0100, Arnout Vandecappelle wrote:
> 
>>  This is in fact also a real build failure, not just a webkit-related timeout.
>> The bullet package seems to have a problem on microblaze. This was with gcc 4.9,
>> but I just tried with gcc 5 and that has the same problem.
>>
>>  First there is a run of:
>>
>> fde encoding in CMakeFiles/BulletXmlWorldImporter.dir/tinyxmlparser.o(.eh_frame)
>> prevents .eh_frame_hdr table being created
>>
>> but then the build hangs in cc1plus of btSoftBody.cpp
>>
>>
>>  Just disable the package on microblaze?
> 
> OK, but it would be good to report the appropriate bugs to
> gcc/binutils, especially if it's still reproducible with a recent gcc
> 5.x/binutils 2.25 toolchain.

 binutils doesn't matter, since it's cc1plus that hangs.

 Bug reported at https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68476

 Patch sent.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
