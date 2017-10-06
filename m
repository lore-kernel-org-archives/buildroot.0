From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 19:16:35 +0200
Subject: [Buildroot] [PATCH v2 6/6] support/testing: fix remaining code
	style
In-Reply-To: <20171005214212.27613-6-ricardo.martincoski@gmail.com>
References: <20170929022713.2967-1-ricardo.martincoski@gmail.com>
 <20171005214212.27613-6-ricardo.martincoski@gmail.com>
Message-ID: <84479e08-ca74-2ebe-4d14-13758b227689@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-10-17 23:42, Ricardo Martincoski wrote:
> Fix the remaining code style warnings from flake8:
>  - properly indent continuation lines;
>  - use proper code to test a parameter is not None.
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>    - renumbered 4 -> 6;
>    - keep only a small part of the old patch;
>    - use 'if x is not None' instead of 'if x:' (Yann E. MORIN);
>    - update commit log.
> 
> Number of warnings reported by flake8 for the test infra:
> before:   2
> after:    0

 I still have a warning:

$ python -m flake8 support/testing/
support/testing/tests/init/base.py:45:9: N803 argument name should be lowercase

 Any idea why you didn't catch this?


 Also, there are still warnings in support/scripts and utils, care to take a
look at those?


 Also, you used to have a patch that ran flake8 from .gitlab-ci.yml, but it
seems to be gone from patchwork.


 And finally, if you have nothing else to do :-), maybe you could make the tests
python3 compatible. For me, it'd be fine to even require python3 to be able to
run the tests, if that simplifies things.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
