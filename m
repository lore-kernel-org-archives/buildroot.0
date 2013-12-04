From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Dec 2013 23:52:27 +0100
Subject: [Buildroot] genmanual: generates kconfiglib.pyc in Buildroot source
	tree
Message-ID: <20131204225227.GH3332@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

When one runs 'make manual', python will create:
    support/scripts/kconfiglib.pyc
in the Buildroot source tree.

Python will happily run, even if it is not able to generate that file
(eg. because the source tree is read-only).

However, the file is not cleaned on 'make clean'. I'm a bit reluctant at
adding it since it would try to remove a file outside of $(O), which
could break parallel builds in multiple $(O) at the same time... Not
sure what to do here.

Since we do not really care about speed, would it be possible to tell
python not to generate it at all?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
