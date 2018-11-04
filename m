From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Nov 2018 11:40:44 +0100
Subject: [Buildroot] [PATCH v2 00/12] default runtime test case for
 python packages v2
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
 <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181104114044.3a01aa11@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

On Fri,  2 Nov 2018 01:12:29 -0300, Ricardo Martincoski wrote:

> Ricardo Martincoski (11):
>   support/testing: use helper class in IPython test
>   support/testing: use helper class in Python test
>   support/testing: create intermediate class per Python version
>   support/testing: create default test case for python packages
>   support/testing: use TestPythonPackageBase for python-autobahn
>   support/testing: use TestPythonPackageBase for python-cryptography
>   support/testing: use TestPythonPackageBase for python-incremental
>   support/testing: use TestPythonPackageBase for python-twisted
>   support/testing: use TestPythonPackageBase for python-txaio
>   support/testing: use TestPythonPackageBase for python-txtorcon
>   support/testing: rename python* test cases

I was about to apply this patch series, but the logic in PATCH 04/12 to
call the TestPythonBase constructor from a class that isn't a child
class of TestPythonBase really looked awkward.

So I google a bit for people having the same issue, i.e defining a base
class for unit tests, but wanting this base class to be ignored.

This answer looks particular useful:

  https://stackoverflow.com/a/25695512/643208

Alternatively this one, which looks less nice to me:

  https://stackoverflow.com/a/22836015/643208

Also, the first answer points to an article that describe potential
issues when using multiple inheritance like we're doing:
https://nedbatchelder.com/blog/201210/multiple_inheritance_is_hard.html.

What do you think about this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
