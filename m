From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Mar 2017 18:11:18 +0100
Subject: [Buildroot] [PATCH v3 1/1] python-pylibftdi: new package
In-Reply-To: <20170306092035.4486af38@free-electrons.com>
References: <20170301153428.00513b95@free-electrons.com>
 <1488385119-14452-1-git-send-email-christian.kellermann@solectrix.de>
 <20170306092035.4486af38@free-electrons.com>
Message-ID: <20170306171118.GB3976@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Christian, All,

On 2017-03-06 09:20 +0100, Thomas Petazzoni spake thusly:
> On Wed,  1 Mar 2017 17:18:39 +0100, Christian Kellermann wrote:
> > Adds the python binding for libftdi to buildroot.
> > 
> > Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
> > ---
> > Changes:
> 
> This package causes a build issue:
> 
> Traceback (most recent call last):
>   File "/home/test/autobuild/run/instance-0/output/host/usr/lib/python3.5/py_compile.py", line 125, in compile
>     _optimize=optimize)
>   File "<frozen importlib._bootstrap_external>", line 700, in source_to_code
>   File "<frozen importlib._bootstrap>", line 222, in _call_with_frames_removed
>   File "/home/test/autobuild/run/instance-0/output/target/usr/lib/python3.5/site-packages/pylibftdi/driver.py", line 124
>     return cdll.LoadLibrary(name + '.so')
>                                         ^
> TabError: inconsistent use of tabs and spaces in indentation

That is because of our patch 0001-do-not-use-find-library.patch which
introduces leading tabs instead of spaces.

Patch incoming...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
