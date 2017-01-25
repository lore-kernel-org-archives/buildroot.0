From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 25 Jan 2017 15:19:25 +0100
Subject: [Buildroot] [PATCH 1/2] python-flask: bump to version 0.12
In-Reply-To: <20170125130241.5jwsxvs67a5qd2xc@ed>
References: <20170125090150.2548-1-lionel@svkt.org>
 <CAGm1_kuKj1_2rA6H6PfyxRXNSfY1ndNvGnS3VKeHTFfwb_VmGw@mail.gmail.com>
 <20170125091854.2kwm43d3ncxbfdhp@ed>
 <CAGm1_kv4xehMCtxw+VG2ccHS7F8WsOzwQYrxSq+CVPk02mXGRA@mail.gmail.com>
 <20170125095858.x6lh5xjwby5lav3m@ed>
 <CAGm1_ku-nNH0va1aACBvcea6ypYg6R_U7jjAzOktxav0cBvjjA@mail.gmail.com>
 <20170125102228.ykcq4xsa5xnp7yar@ed>
 <CAGm1_ksjuWGAFNX+HggMp1QaOoUAdBPkwV78+EPY1oq18qVEtQ@mail.gmail.com>
 <20170125121659.5eaex6iynmrbrxb4@ed>
 <CAGm1_kv15AZWDZC82Zup4JMd+RrMjxe4Qn=Hrhu27jM_RB5VHg@mail.gmail.com>
 <20170125130241.5jwsxvs67a5qd2xc@ed>
Message-ID: <CAGm1_ksOzrvqpvf6=-A5tiezcKhZuo5-PK+UpzmhNLKNp-_Rvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 25, 2017 at 2:02 PM, Lionel Flandrin <lionel@svkt.org> wrote:
> On Wed, Jan 25, 2017 at 01:52:38PM +0100, Yegor Yefremov wrote:
>> On Wed, Jan 25, 2017 at 1:16 PM, Lionel Flandrin <lionel@svkt.org> wrote:
>> > On Wed, Jan 25, 2017 at 11:24:44AM +0100, Yegor Yefremov wrote:
>> >> On Wed, Jan 25, 2017 at 11:22 AM, Lionel Flandrin <lionel@svkt.org> wrote:
>> >> > On Wed, Jan 25, 2017 at 11:11:43AM +0100, Yegor Yefremov wrote:
>> >> >> On Wed, Jan 25, 2017 at 10:58 AM, Lionel Flandrin <lflandrin@ereca.fr> wrote:
>> >> >> > On Wed, Jan 25, 2017 at 10:46:03AM +0100, Yegor Yefremov wrote:
>> >> >> >> On Wed, Jan 25, 2017 at 10:18 AM, Lionel Flandrin <lionel@svkt.org> wrote:
>> >> >> >> > On Wed, Jan 25, 2017 at 10:09:42AM +0100, Yegor Yefremov wrote:
>> >> >> >> >> On Wed, Jan 25, 2017 at 10:01 AM, Lionel Flandrin <lionel@svkt.org> wrote:
>> >> >> >> >> > Signed-off-by: Lionel Flandrin <lionel@svkt.org>
>> >> >> >> >>
>> >> >> >> >> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
>> >> >> >> >>
>> >> >> >> >> Care to update jinja as well https://github.com/pallets/jinja/releases
>> >> >> >> >>
>> >> >> >> >> Yegor
>> >> >> >> >
>> >> >> >> > I tried to do so but I got a nasty error:
>> >> >> >> >
>> >> >> >> >   Traceback (most recent call last):
>> >> >> >> >     File "/home/lionel/src/ambix/buildroot/output/host/usr/lib/python3.5/py_compile.py", line 125, in compile
>> >> >> >> >       _optimize=optimize)
>> >> >> >> >     File "<frozen importlib._bootstrap_external>", line 700, in source_to_code
>> >> >> >> >     File "<frozen importlib._bootstrap>", line 222, in _call_with_frames_removed
>> >> >> >> >     File "/home/lionel/src/ambix/buildroot/output/target/usr/lib/python3.5/site-packages/jinja2/asyncfilters.py", line 24
>> >> >> >> >   SyntaxError: 'yield' inside async function
>> >> >> >> >
>> >> >> >> > I asked on IRC and I've been told that:
>> >> >> >> >
>> >> >> >> > < mitsuhiko> simias: this is not a problem with jinja
>> >> >> >> > < mitsuhiko> it's a limitation in whatever build tool you use
>> >> >> >> > < mitsuhiko> pip deals with that
>> >> >> >> > < mitsuhiko> you can ignore it. it's a warning basically
>> >> >> >> >
>> >> >> >> > So I'll have to dig a bit deeper to understand what's going wrong here.
>> >> >> >>
>> >> >> >> It seems like this will be working for Python 3.6 only [1]. And I
>> >> >> >> doubt it will be working in Python 2 at all.
>> >> >> >>
>> >> >> >> So let's wait for an official release and take a look at this then.
>> >> >> >>
>> >> >> >> [1] http://stackoverflow.com/questions/37549846/how-to-use-yield-inside-async-function
>> >> >> >
>> >> >> > It's my understanding that jinja2 should work with Python 2 and 3
>> >> >> > though. I just did a quick test with pip in a python 2 environment:
>> >> >> >
>> >> >> > (test-venv) $ pip --version
>> >> >> >   pip 9.0.1 from /tmp/test-venv/local/lib/python2.7/site-packages (python 2.7)
>> >> >> >
>> >> >> > (test-venv) {lionel at ed}% pip install jinja2
>> >> >> >   Collecting jinja2
>> >> >> >     Using cached Jinja2-2.9.4-py2.py3-none-any.whl
>> >> >> >   Collecting MarkupSafe>=0.23 (from jinja2)
>> >> >> >     Using cached MarkupSafe-0.23.tar.gz
>> >> >> >   Building wheels for collected packages: MarkupSafe
>> >> >> >     Running setup.py bdist_wheel for MarkupSafe ... done
>> >> >> >     Stored in directory: /home/lionel/.cache/pip/wheels/a3/fa/dc/0198eed9ad95489b8a4f45d14dd5d2aee3f8984e46862c5748
>> >> >> >   Successfully built MarkupSafe
>> >> >> >   Installing collected packages: MarkupSafe, jinja2
>> >> >> >   Successfully installed MarkupSafe-0.23 jinja2-2.9.4
>> >> >> >
>> >> >> > (test-venv) $ python
>> >> >> >   Python 2.7.13 (default, Dec 18 2016, 20:19:42)
>> >> >> >   [GCC 6.2.1 20161215] on linux2
>> >> >> >   Type "help", "copyright", "credits" or "license" for more information.
>> >> >> >   >>> import pkg_resources
>> >> >> >   >>> pkg_resources.get_distribution("jinja2")
>> >> >> >   Jinja2 2.9.4 (/tmp/test-venv/lib/python2.7/site-packages)
>> >> >> >   >>> import jinja2
>> >> >> >   >>> jinja2.Environment()
>> >> >> >   <jinja2.environment.Environment object@0x7f2ba06d3590>
>> >> >> >
>> >> >> > I'm a newbie in python though, sorry if I'm missing something obvious.
>> >> >>
>> >> >> Python in BR is "very" different from your pip environment . In BR, if
>> >> >> you tell BR to compile *.py files, it will compile them all and also
>> >> >> break, if an error occurs. During this compilation all syntax error
>> >> >> will trigger compilation abort. But in normal case, where you make
>> >> >> this manually such errors will be just warnings.
>> >> >>
>> >> >> So as long as you don't invoke these async filters, you most likely
>> >> >> won't trigger this syntax error.
>> >> >
>> >> > I see. Do you think it would be worth adding a BR patch to disable
>> >> > this portion of the code? When python 3.6 is integrated we could make
>> >> > it optional. We'll need something like that if we want to keep python2
>> >> > compat anyway.
>> >>
>> >> This is something, we must talk about with jinja devs first. As I said
>> >> it is more broken for Python 2, i.e. first occurrence of async leads
>> >> to syntax error:
>> >>
>> >> PYTHONPATH="/home/user/Documents/versioned/buildroot/bsp/target/usr/lib/python2.7/sysconfigdata/:/home/user/Documents/versioned/buildroot/bsp/target/usr/lib/python2.7/site-packages/"
>> >> /home/user/Documents/versioned/buildroot/bsp/host/usr/bin/python2.7
>> >> support/scripts/pycompile.py
>> >> /home/user/Documents/versioned/buildroot/bsp/target/usr/lib/python2.7
>> >> Cannot compile /home/user/Documents/versioned/buildroot/bsp/target/usr/lib/python2.7/site-packages/jinja2/asyncfilters.py
>> >> Traceback (most recent call last):
>> >>   File "support/scripts/pycompile.py", line 24, in <module>
>> >>     compileall.compile_dir(sys.argv[1], quiet=report_problem)
>> >>   File "/home/user/Documents/versioned/buildroot/bsp/host/usr/lib/python2.7/compileall.py",
>> >> line 57, in compile_dir
>> >>     quiet):
>> >>   File "/home/user/Documents/versioned/buildroot/bsp/host/usr/lib/python2.7/compileall.py",
>> >> line 57, in compile_dir
>> >>     quiet):
>> >>   File "/home/user/Documents/versioned/buildroot/bsp/host/usr/lib/python2.7/compileall.py",
>> >> line 50, in compile_dir
>> >>     if not compile_file(fullname, ddir, force, rx, quiet):
>> >>   File "/home/user/Documents/versioned/buildroot/bsp/host/usr/lib/python2.7/compileall.py",
>> >> line 101, in compile_file
>> >>     if quiet:
>> >>   File "support/scripts/pycompile.py", line 19, in __nonzero__
>> >>     raise value
>> >> py_compile.PyCompileError:   File
>> >> "/home/user/Documents/versioned/buildroot/bsp/target/usr/lib/python2.7/site-packages/jinja2/asyncfilters.py",
>> >> line 7
>> >>     async def auto_to_seq(value):
>> >>             ^
>> >> SyntaxError: invalid syntax
>> >>
>> >> Makefile:651: recipe for target 'target-finalize' failed
>> >> make[1]: *** [target-finalize] Error 1
>> >> Makefile:79: recipe for target '_all' failed
>> >> make: *** [_all] Error 2
>> >
>> > Understood. Thank you for your explanations (and your work on BR in
>> > general).
>> >
>> > What do you think I should do with that then? In your previous email
>> > you mention "let's wait for an official release and take a look at
>> > this then". Which release are you talking about exactly since the
>> > currently released jinja version (2.9.4) already exhibits the issue?
>> >
>> > They have a mailing list but I'm not sure I understand the root of the
>> > issue and how to fix it well enough to make a good case for it there,
>> > especially since the answer I got on IRC was basically "not a problem
>> > on our side".
>>
>> I'll open an issue on their github and post the link here. Then we
>> will see what happens and make brainstorming.
>
> Great! Thank you for taking the lead on that.

I don't think this will be fixed upstream [1]. So I just made the same
fix we've made for python-serial. Please test my patch.

[1] https://github.com/pallets/jinja/issues/662

Yegor
