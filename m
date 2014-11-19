From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Nov 2014 08:20:43 +0100
Subject: [Buildroot] [PATCH next] python-certifi: add new package
In-Reply-To: <546BC6D7.5060909@mind.be> (Arnout Vandecappelle's message of
 "Tue, 18 Nov 2014 23:23:19 +0100")
References: <1416255614-4876-1-git-send-email-yegorslists@googlemail.com>
 <20141118230733.3bc8209f@free-electrons.com>
 <546BC6D7.5060909@mind.be>
Message-ID: <87mw7nodv8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> > +config BR2_PACKAGE_PYTHON_CERTIFI
 >> > +    bool "python-certifi"
 >> 
 >> We need a depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3 here. I
 >> know it's not very useful since Python packages can anyway only be
 >> selected when either Python or Python 3 are enabled, but we have this
 >> conditional for all Python packages, so we should remain consistent and
 >> have it there as well.

 >  Well, a quick grep in next shows that we have 8 packages without this depends,
 > and 14 packages with the depends.

 >  However, since the python packages that have recently been added by Peter do
 > not have the depends, and since he told Yegor to remove the depends in
 > python-webpy, I think the rule now is _not_ to have the depends.

Everything is open for discussion, but it's completely redundant because
of the conditional in package/Config.in. Why would we want to add it?

I didn't add it to the packages I recently added because I knew about
the toplevel conditional. I hadn't noticed that (some of) the existing
modules had it in their Config.in as well.

-- 
Bye, Peter Korsgaard
