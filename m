From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jun 2018 15:05:54 +0200
Subject: [Buildroot] [PATCH] scanpypi: rework download_package error
 handling
In-Reply-To: <CAGm1_ks11dzrm7_zwYwaJYTEgLqyZ48y6rtuZ1gNGzAjohdayw@mail.gmail.com>
 (Yegor Yefremov's message of "Fri, 15 Jun 2018 14:30:27 +0200")
References: <20180613073710.5715-1-yegorslists@googlemail.com>
 <87muvw2qoo.fsf@dell.be.48ers.dk>
 <CAGm1_ks11dzrm7_zwYwaJYTEgLqyZ48y6rtuZ1gNGzAjohdayw@mail.gmail.com>
Message-ID: <87in6k2o99.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

Hi,

 >> Printing out 'lines', it seems to be a mix of normal strings and unicode:
 >> 
 >> lines: ['config BR2_PACKAGE_PYTHON_VALIDATORS\n', '\tbool "python-validators"\n', '\tselect BR2_PACKAGE_PYTHON_SIX # runtime\n', '\tselect BR2_PACKAGE_PYTHON_DECORATOR # runtime\n', '\thelp\n', u'\t  Python Data Validation for Humans\u2122.\n', '\n', u'\t  https://github.com/kvesteri/validators\n']

 > I'm still using Python 2 by default. In this case I think trademark
 > symbol is the problem.

Yes. Perhaps we should filter out these unicode characters? We probably
don't really want a TM character in the help text anyway.

-- 
Bye, Peter Korsgaard
