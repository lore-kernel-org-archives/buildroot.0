From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Dec 2015 08:50:48 +0100
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151207225408.GC24430@vapier.lan> (Mike Frysinger's message of
 "Mon, 7 Dec 2015 17:54:08 -0500")
References: <20151202073542.GY23754@vapier.lan>
 <20151206214229.GE4023@free.fr> <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan> <87bna2rckx.fsf@dell.be.48ers.dk>
 <20151207185106.GF11489@vapier.lan> <87r3iyngfx.fsf@dell.be.48ers.dk>
 <20151207215548.GB24430@vapier.lan> <87egexoqf4.fsf@dell.be.48ers.dk>
 <20151207225408.GC24430@vapier.lan>
Message-ID: <87a8plnztz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

>> So how about if we drop the global HSTS headers and http->https
 >> redirects for now and then move a bit more slowly forward sub domain by
 >> subdomain:
 >> 
 >> 1: Enable https next to http and verify that it works
 >> 2: Add http->https redirect and verify that it works
 >> 3: add HSTS header

 > we're already at (3).  even if we weren't, i don't see how transitioning
 > would affect the SNI issue.  the question is simple: how long do you want
 > to (try to) support old systems where people refuse to fix their setup ?

The new setup causes more problems than just SNI. The wget issues are
important for sources.buildroot.{net,org}, but not for E.G. bugzilla.

As I said, it is a question about tradeoffs, and the tradeoffs may be
different for each subdomain.


> we're talking about systems that are over three years old (wget-1.14 was
 > released in Aug 2012).  what is your cut off ?  3 years ?  4 years ?  i'd
 > also highlight <wget-1.16 versions have@least one security vuln that
 > can be remotely exploited (when you download via ftp -- CVE-2014-4877).

For sources.* (and preferably the buildroot tarballs themselves) I would
prefer it to work even with a wget without SNI support.

I haven't checked the autobuilders (I believe the build script uses
curl), but there we possibly have the same issue.

For bugzilla I don't have any issues requiring SNI and HTTPS.


 >> I agree, old systems are a pain - But we do try to keep buildroot
 >> working on various enterprise distributions when possible. So far we've
 >> worked around SNI issues by using http URLs from those locations instead
 >> (and verifying against our local hashes).

 > that doesn't help when sites transition to http->https redirects such as
 > uclibc.org now does.

Indeed, which is why I would prefer to disable that for
*.buildroot.{org,net}, with the possibly exception of
bugs.buildroot.{org,net}.

-- 
Venlig hilsen,
Peter Korsgaard 
