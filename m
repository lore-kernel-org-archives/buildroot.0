From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 11:30:40 +0200
Subject: [Buildroot] [PATCH 00/20] Some new Perl modules
In-Reply-To: <XnsA4816FEFF3E58berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
 <20150419105007.411d3dd3@free-electrons.com>
 <XnsA4816FEFF3E58berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150419113040.1c46a6cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Apr 2015 11:00:14 +0200, Bernd Kuhls wrote:

> perl-mail-spamassassin checks for the presence of some dependency modules 
> during its configuration phase and stops if they can not be found, like:
> 
> dependency check complete...
> 
> REQUIRED module missing: HTML::Parser
> REQUIRED module missing: Net::DNS
> REQUIRED module missing: NetAddr::IP
> 
> After
> 
> $ make host-perl-html-parser
> 
> this list will be shorter:
> 
> dependency check complete...
> 
> REQUIRED module missing: Net::DNS
> REQUIRED module missing: NetAddr::IP
> 
> This serves just as an example, having these host modules installed makes 
> SpamAssassin_s configure happy ;)

Right, but isn't this an ugly workaround? They are not really needed on
the host, only to make spamassassin believe they will be on the target.
Isn't there a better solution?

Fran?ois, maybe you have an idea?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
