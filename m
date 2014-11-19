From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Nov 2014 08:22:42 +0100
Subject: [Buildroot] [PATCH next] python-certifi: add new package
In-Reply-To: <20141119000429.65c6a8c3@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 19 Nov 2014 00:04:29 +0100")
References: <1416255614-4876-1-git-send-email-yegorslists@googlemail.com>
 <20141118230733.3bc8209f@free-electrons.com>
 <546BC6D7.5060909@mind.be>
 <20141119000429.65c6a8c3@free-electrons.com>
Message-ID: <87ioibodrx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > We need a depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3 here. I
 >> > know it's not very useful since Python packages can anyway only be
 >> > selected when either Python or Python 3 are enabled, but we have this
 >> > conditional for all Python packages, so we should remain consistent and
 >> > have it there as well.
 >> 
 >> Well, a quick grep in next shows that we have 8 packages without this depends,
 >> and 14 packages with the depends.
 >> 
 >> However, since the python packages that have recently been added by Peter do
 >> not have the depends, and since he told Yegor to remove the depends in
 >> python-webpy, I think the rule now is _not_ to have the depends.

 > Damn, so the guy doing most of the Python maintenance, and who did
 > introduce the possibility of building modules with both Python 2 and
 > Python 3, doesn't have a word into such decisions? Where are we
 > going? :-)

Everything is open for discussion, but why would you want to add it?
Consistency?

To me it makes pretty good sense that the modules are only visible if
python || python3, and the individual modules can add further
restrictions if needed (only for python2 or python3, needing some other
package or toolchain options).

-- 
Bye, Peter Korsgaard
