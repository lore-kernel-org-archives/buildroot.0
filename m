From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Aug 2019 22:44:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/giflib: security bump to
 version 5.2.1
In-Reply-To: <20190819214021.4a8138b2@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 19 Aug 2019 21:40:21 +0200")
References: <20190818120432.22829-1-fontaine.fabrice@gmail.com>
 <20190819154603.51a042a2@windsurf.home>
 <87ftlxgk37.fsf@dell.be.48ers.dk>
 <20190819214021.4a8138b2@windsurf.home>
Message-ID: <877e78hold.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon, 19 Aug 2019 19:07:24 +0200
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> > I must say this is quite big of a change for master at this point, and
 >> > for a security bump in general. I'm not sure between applying this, or
 >> > just cherry-picking the two commits that fix the CVEs.  
 >> 
 >> Yes, I believe that is also what we agreed when Bernd posted a similar
 >> patch last month:
 >> 
 >> https://patchwork.ozlabs.org/patch/1124785/

 > So in here you also say that the security issue is only in a tool we
 > don't install, so we're not affected. In this case, I could just apply
 > Fabrice's patch to next, and we do nothing for master ?

Sorry, looking back at the issue I think I mixed things up - It doesn't
help that the issues referenced in the commit messages have been deleted
(or hidden?) from their bugtracker. Bug #114 affected gifclrmp, bug #113
does indeed affect the library itself (CVE-2018-11490) and #119
(CVE-2019-15133) as well.

So a small patch adding the fixes to our current version would be the
nicest. Notice that the source files have been moved (and
deleted/restored) in upstream git, so the paths need a bit of tweaking.

-- 
Bye, Peter Korsgaard
