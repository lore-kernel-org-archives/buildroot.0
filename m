From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Sep 2016 08:18:50 +0200
Subject: [Buildroot] [PATCH 0/1] [RFC] replace mysql with mariadb 10.0
In-Reply-To: <87lgyuw1d3.fsf@linux.vnet.ibm.com>
References: <20160912220551.17934-1-bluemrp9@gmail.com>
 <87lgyuw1d3.fsf@linux.vnet.ibm.com>
Message-ID: <09336ae3-751d-3a72-dfca-da6b84f51b64@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-09-16 00:41, Stewart Smith wrote:
> Ryan Coe <bluemrp9@gmail.com> writes:
>> This patch represents my attempt to replace the aging mysql 5.1 that is
>> currently shipped with Buildroot. I am replacing mysql altogether with mariadb
>> version 10.0. I have been able to test this with both an arm and a x86_64
>> build. I have not tested it with systemd. This patch is based on the work done
>> by Sylvain Raybaud.
> 
> Would it be better to just add MariaDB rather than replace MySQL,
> there's reasons to use one over the other.

 I completely agree.

 However, that's a bit more complicated, because we want mysql to become a
virtual package then, so any package that currently uses mysql can also use
mariadb. And, since there are quite a few packages out there that select mysql,
it would have to use an approach like libjpeg/jpeg-turbo to handle it.

 The good news is: in a first step, you can add mariadb as a new package without
bothering with the virtual package.

 Note that Sylvain Raybaud did that already, I'm not sure why his patches are no
longer on patchwork.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
