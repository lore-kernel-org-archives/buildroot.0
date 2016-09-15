From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 15 Sep 2016 23:09:32 +0200
Subject: [Buildroot] [1/1,RFC] mysql: replace mysql with mariadb 10.0
Message-ID: <afcad3cc-5a25-a410-ef18-b6a18ed45406@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >/This patch represents my attempt to replace the aging mysql 5.1 that is />/currently shipped with Buildroot. I am replacing mysql altogether with 
> mariadb />/version 10.0. I have been able to test this with both an arm and a 
> x86_64 />/build. I have not tested it with systemd. This patch is based on the 
> work done />/by Sylvain Raybaud. /
> Would it be better to just add MariaDB rather than replace MySQL,
> there's reasons to use one over the other.


While a virtual package may be helpful if in the future someone would 
like to add another MySQL implementation.
I do have concerns about the existing mysql package, given that:

- the MySQL branch used has been EOL since 2013
- there has been an number of CVE issues since: 
https://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=oracle+mysql
(and cve-2016-6662 not yet in the list)
- it listens to all interfaces by default

How responsible is it to keep packages in such state around, when there 
do are alternatives?


Yours sincerely,

Floris Bos

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160915/5ca5ee8f/attachment.html>
