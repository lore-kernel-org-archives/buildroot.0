From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Sep 2017 09:19:39 +0200
Subject: [Buildroot] [PATCH 2/2] testing: add python-cryptography tests
In-Reply-To: <59be07745ff02_17f3141de70515ce@ultri3.mail>
References: <5d8ea4ebb51023d3943fb4e5a1678f8cfba70527.1505594291.git.yann.morin.1998@free.fr>
 <59be07745ff02_17f3141de70515ce@ultri3.mail>
Message-ID: <20170917071939.GB2930@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-09-17 02:26 -0300, Ricardo Martincoski spake thusly:
> On Sat, Sep 16, 2017 at 05:38 PM, Yann E. MORIN wrote:
> 
> > testing: add python-cryptography tests
> 
> This patch could now be renamed to:
> python-cryptography: add runtime tests
> or something like this

Yep, good point.

> > From: Yegor Yefremov <yegorslists@googlemail.com>
> > 
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> > [yann.morin.1998 at free.fr:
> >   - move to package directory,
> 
>   - rename the test file to follow the package convention,
> 
> I am OK with this change, but I think it worth mentioning.

Ack.

Regards,
Yann E. MORIN.

> >   - indent the config fragment
> > ]
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > 
> > ---
> > Note:
> > This is exactly the same as https://patchwork.ozlabs.org/patch/811011/
> > but with the test moved to the python-cryptography package and the
> > config fragment indented.
> > ---
> >  .gitlab-ci.yml                                     |  2 ++
> >  package/python-cryptography/python-cryptography.py | 31 ++++++++++++++++++++++
> >  2 files changed, 33 insertions(+)
> >  create mode 100644 package/python-cryptography/python-cryptography.py
> 
> .gitlab-ci.yml needs to be generated again because of this rename (to use '-'
> in the name again).
> 
> > 
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index b44c935f2a..091b016191 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -250,6 +250,8 @@ tests.package.test_ipython.TestIPythonPy2: *runtime_test
> >  tests.package.test_ipython.TestIPythonPy3: *runtime_test
> >  tests.package.test_python.TestPython2: *runtime_test
> >  tests.package.test_python.TestPython3: *runtime_test
> > +tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
> > +tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
> >  tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
> >  tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: *runtime_test
> >  tests.toolchain.test_external.TestExternalToolchainCCache: *runtime_test
> [snip]
> 
> Regards,
> Ricardo


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
