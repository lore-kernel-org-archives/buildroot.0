From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 25 Jan 2017 10:46:03 +0100
Subject: [Buildroot] [PATCH 1/2] python-flask: bump to version 0.12
In-Reply-To: <20170125091854.2kwm43d3ncxbfdhp@ed>
References: <20170125090150.2548-1-lionel@svkt.org>
 <CAGm1_kuKj1_2rA6H6PfyxRXNSfY1ndNvGnS3VKeHTFfwb_VmGw@mail.gmail.com>
 <20170125091854.2kwm43d3ncxbfdhp@ed>
Message-ID: <CAGm1_kv4xehMCtxw+VG2ccHS7F8WsOzwQYrxSq+CVPk02mXGRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 25, 2017 at 10:18 AM, Lionel Flandrin <lionel@svkt.org> wrote:
> On Wed, Jan 25, 2017 at 10:09:42AM +0100, Yegor Yefremov wrote:
>> On Wed, Jan 25, 2017 at 10:01 AM, Lionel Flandrin <lionel@svkt.org> wrote:
>> > Signed-off-by: Lionel Flandrin <lionel@svkt.org>
>>
>> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Care to update jinja as well https://github.com/pallets/jinja/releases
>>
>> Yegor
>
> I tried to do so but I got a nasty error:
>
>   Traceback (most recent call last):
>     File "/home/lionel/src/ambix/buildroot/output/host/usr/lib/python3.5/py_compile.py", line 125, in compile
>       _optimize=optimize)
>     File "<frozen importlib._bootstrap_external>", line 700, in source_to_code
>     File "<frozen importlib._bootstrap>", line 222, in _call_with_frames_removed
>     File "/home/lionel/src/ambix/buildroot/output/target/usr/lib/python3.5/site-packages/jinja2/asyncfilters.py", line 24
>   SyntaxError: 'yield' inside async function
>
> I asked on IRC and I've been told that:
>
> < mitsuhiko> simias: this is not a problem with jinja
> < mitsuhiko> it's a limitation in whatever build tool you use
> < mitsuhiko> pip deals with that
> < mitsuhiko> you can ignore it. it's a warning basically
>
> So I'll have to dig a bit deeper to understand what's going wrong here.

It seems like this will be working for Python 3.6 only [1]. And I
doubt it will be working in Python 2 at all.

So let's wait for an official release and take a look at this then.

[1] http://stackoverflow.com/questions/37549846/how-to-use-yield-inside-async-function

Yegor
