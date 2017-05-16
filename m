From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 21:29:41 +0200
Subject: [Buildroot] [PATCH] python-can: bump to 1.5.2
In-Reply-To: <20170516135627.2634-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Tue, 16 May 2017 15:56:27
 +0200")
References: <20170516135627.2634-1-yegorslists@googlemail.com>
Message-ID: <87o9us8usa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Also add Python SQLite3 dependency that first appeared in 1.5.2.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 >  package/python-can/Config.in       | 2 ++
 >  package/python-can/python-can.hash | 6 +++---
 >  package/python-can/python-can.mk   | 4 ++--
 >  3 files changed, 7 insertions(+), 5 deletions(-)

 > diff --git a/package/python-can/Config.in b/package/python-can/Config.in
 > index 6b4e0fa76..465d2ee58 100644
 > --- a/package/python-can/Config.in
 > +++ b/package/python-can/Config.in
 > @@ -1,5 +1,7 @@
 >  config BR2_PACKAGE_PYTHON_CAN
 >  	bool "python-can"
 > +	select BR2_PACKAGE_PYTHON_SQLITE if BR2_PACKAGE_PYTHON
 > +	select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3

We normally add # runtime to explain why this dependency isn't added to
_DEPENDENCIES.

Committed to next with that fixed, thanks.

-- 
Bye, Peter Korsgaard
