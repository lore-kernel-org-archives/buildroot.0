From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Oct 2019 21:44:04 +0200
Subject: [Buildroot] [PATCH v2] package/python-tornado: only available
 for Python 3
In-Reply-To: <CAJJ6jxvwAF3ZaV15-8KWH8fZdoR3Z+DiQpErsR0aOJMKRrPTcQ@mail.gmail.com>
 (Steve Calfee's message of "Tue, 8 Oct 2019 08:13:27 -0700")
References: <20191007203731.29166-1-arnout@mind.be>
 <CAJJ6jxvwAF3ZaV15-8KWH8fZdoR3Z+DiQpErsR0aOJMKRrPTcQ@mail.gmail.com>
Message-ID: <871rvl1z7f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve Calfee <stevecalfee@gmail.com> writes:

 > Hi Arnout,
 > So if there are other python programs in my build that require Python
 > 2.7, I must stay with an earlier version of python-tornado.

 > What is the recommended way to have this customization using
 > br2_external for future builds? I can do it manually with git, but
 > that is not a very future-proof way to downgrade a package.

You can basically copy the old package to your br2-external tree and
rename to python2-tornado or similar, and change the references in your
custom packages to it, but keep in mind that python 2.x is scheduled to
become EOL by January:

https://pythonclock.org/

So there is a real chance that python 2.x will be dropped by the time we
do the next LTS release (2020.02) - So a better long term solution is to
(help) port those python 2.x only python programs to python 3.x.

-- 
Bye, Peter Korsgaard
