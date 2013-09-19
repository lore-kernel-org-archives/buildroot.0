From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Sep 2013 18:27:34 +0200
Subject: [Buildroot] [PATCH 3 of 4] manual generation: check
	dependencies first
In-Reply-To: <20130919173926.0bf04d9a@skate>
References: <patchbomb.1379587632@argentina>
 <246bed054da59d6508dc.1379587635@argentina>
 <CAHXCMMJ2oSqF_MoyDJYjxCKKZukwg6vr2ewP+TUFy9kaDrwcoA@mail.gmail.com>
 <CAAXf6LW=7dUUEjGHp6xVFy9-SEXVuUyiK8Lvom2imyCX=s+3oQ@mail.gmail.com>
 <20130919173926.0bf04d9a@skate>
Message-ID: <CAAXf6LWpjXetyUo4QHbc3FFi4qP2qmeSsJbuwwP9+3_vnuabyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 19, 2013 at 5:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 19 Sep 2013 15:30:25 +0200, Thomas De Schampheleire wrote:
>
>> For python, should we check and bail out, or rather skip the package
>> list generation? In fact, why is the package list generation coupled
>> to the manual?
>
> Because the package list is used in the manual only, and the best
> moment to generate is when building the manual?
>
> When would you want to generate it?

I was thinking it could become a separate build target. But at that
time I didn't fully realize (and didn't check) that these lists are
actually included in the manual. So, that question is void now.

Remains: how should we check for python argparse? Module argparse is
included from python-2.7 and python-3.2 onwards. It seems that Ubuntu
has been providing python-argparse for older python versions as well,
but IMO it is not needed to check for this explicitly. If you ask me,
I would simply check for python 2.7+ and 3.2+, but I'm open for
discussion.

Thanks,
Thomas
