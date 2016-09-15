From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Sep 2016 23:17:51 +0200
Subject: [Buildroot] [1/1,RFC] mysql: replace mysql with mariadb 10.0
In-Reply-To: <afcad3cc-5a25-a410-ef18-b6a18ed45406@je-eigen-domein.nl>
References: <afcad3cc-5a25-a410-ef18-b6a18ed45406@je-eigen-domein.nl>
Message-ID: <0775fdeb-5056-73cd-4cf8-7d4edeb6d8a7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-09-16 23:09, Floris Bos wrote:
>> >/This patch represents my attempt to replace the aging mysql 5.1 that is />/currently shipped with Buildroot. I am replacing mysql altogether with mariadb />/version 10.0. I have been able to test this with both an arm and a x86_64 />/build. I have not tested it with systemd. This patch is based on the work done />/by Sylvain Raybaud. /
>> Would it be better to just add MariaDB rather than replace MySQL,
>> there's reasons to use one over the other.
> 
> 
> While a virtual package may be helpful if in the future someone would like to
> add another MySQL implementation.
> I do have concerns about the existing mysql package, given that:
> 
> - the MySQL branch used has been EOL since 2013
> - there has been an number of CVE issues since:
> https://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=oracle+mysql
> (and cve-2016-6662 not yet in the list)
> - it listens to all interfaces by default
> 
> How responsible is it to keep packages in such state around, when there do are
> alternatives?

 True. But it should be relatively easy to bump the existing mysql package. If
it is completely replaced by mariadb, it won't be so easy anymore.

 We could mark mysql as deprecated pending the bump. That could motivate people
to step up and fix it.

 Regards,
 Arnout


> Yours sincerely,
> 
> Floris Bos
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
