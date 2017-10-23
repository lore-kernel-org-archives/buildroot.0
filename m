From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 23 Oct 2017 00:30:01 -0200
Subject: [Buildroot] [PATCH v2 6/6] support/testing: fix remaining code
	style
References: <84479e08-ca74-2ebe-4d14-13758b227689@mind.be>
Message-ID: <59ed54297386a_5e461a34548181f6@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Oct 06, 2017 at 02:16 PM, Arnout Vandecappelle wrote:

> On 05-10-17 23:42, Ricardo Martincoski wrote:
[snip]
>> Number of warnings reported by flake8 for the test infra:
>> before:   2
>> after:    0
> 
>  I still have a warning:
> 
> $ python -m flake8 support/testing/
> support/testing/tests/init/base.py:45:9: N803 argument name should be lowercase
> 
>  Any idea why you didn't catch this?

That's because you have flake8 plugin pep8-naming installed, which default to
on.
To always disable it (to ignore such warnings and get the same result with or
without it) this line could be added to .flake8:
ignore=N
I don't know a way to enforce it is always installed (to always generate such
warnings and get the same result).

To also ignore warnings generated when the plugin flake8-docstrings is
installed, this line could be used instead:
ignore=N,D

>  Also, there are still warnings in support/scripts and utils, care to take a
> look at those?

I will.

>  Also, you used to have a patch that ran flake8 from .gitlab-ci.yml, but it
> seems to be gone from patchwork.

Yes, that was
http://patchwork.ozlabs.org/patch/820324/

The main purpose (to check the test infra even if/when the tests become placed
in each package directory) was replaced by the .flake8 file in the main
directory. 
http://patchwork.ozlabs.org/patch/822105/

I should have replied to the first one explaining I marked it as Superseded by
the second one.

If you think the first patch is useful feel free to review it so I can respin,
or even take over if you wish.

>  And finally, if you have nothing else to do :-), maybe you could make the tests
> python3 compatible. For me, it'd be fine to even require python3 to be able to
> run the tests, if that simplifies things.

I will do later (I guess in next December/January).

Regards,
Ricardo
