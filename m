From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 May 2016 22:23:56 +0200
Subject: [Buildroot] [PATCH v4 0/4] Python: globalize pyc file
	compilation
In-Reply-To: <1463519956-5599-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463519956-5599-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <980554dc-c874-30f3-bb80-d0b433c4769a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/17/16 23:19, Thomas Petazzoni wrote:
> Hello,
>
> This patch series contains just the remaining patches of my "Python 3
> bump" patch series. Compared to the v3:
>
>  - Drop patches that have been merged.
>
>  - Add a patch suggested by Samuel Martin, that consists in adding the
>    --no-run-if-empty option to xargs to avoid issues.
>
>  - Instead of adding a patch to python-pyftpdlib to fix a Python 3
>    byte-compilation failure, bump from 1.5.0 to 1.5.1, since 1.5.1 was
>    released by upstream specifically to address the Python 3 issue
>    after we reported the problem.
>
>    Yegor: there is a question for you in this patch: I had to use a
>    different URL than the standard pypi download URL, because the
>    standard one returns a 404. If you could have a look, it would be
>    great.
>
> Review/comments welcome.
>
> Thanks!
>
> Thomas
>
> Thomas Petazzoni (3):
>   python/python3: use --no-run-if-empty xargs option
>   python-pyftpdlib: bump version to 1.5.1, fixing Python 3 issue
>   samba4: remove compilation of .pyc files

  Similar to samba4, python-pyqt also has a custom compileall.

  Regards,
  Arnout

>
> Yegor Yefremov (1):
>   python/python3: globalize *.pyc files compilation
>
>  package/pkg-python.mk                          |  2 +-
>  package/python-pyftpdlib/python-pyftpdlib.hash |  6 +++---
>  package/python-pyftpdlib/python-pyftpdlib.mk   |  4 ++--
>  package/python/python.mk                       | 25 ++++++++++++++++++----
>  package/python3/python3.mk                     | 29 +++++++++++++++++++-------
>  package/samba4/samba4.mk                       | 10 ---------
>  support/scripts/pycompile.py                   | 24 +++++++++++++++++++++
>  7 files changed, 72 insertions(+), 28 deletions(-)
>  create mode 100644 support/scripts/pycompile.py
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
