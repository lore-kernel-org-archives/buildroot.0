From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 11:00:14 +0200
Subject: [Buildroot] [PATCH 00/20] Some new Perl modules
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
 <20150419105007.411d3dd3@free-electrons.com>
Message-ID: <XnsA4816FEFF3E58berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150419105007.411d3dd3 at free-electrons.com:

> Thanks. Could you explain why some of them have a host variant, and why
> the host variant is useful?

Hi,

perl-mail-spamassassin checks for the presence of some dependency modules 
during its configuration phase and stops if they can not be found, like:

dependency check complete...

REQUIRED module missing: HTML::Parser
REQUIRED module missing: Net::DNS
REQUIRED module missing: NetAddr::IP

After

$ make host-perl-html-parser

this list will be shorter:

dependency check complete...

REQUIRED module missing: Net::DNS
REQUIRED module missing: NetAddr::IP

This serves just as an example, having these host modules installed makes 
SpamAssassin?s configure happy ;)

Makefile written by ExtUtils::MakeMaker 6.98
>>> perl-mail-spamassassin 3.4.0 Building
[...]

Regards, Bernd
