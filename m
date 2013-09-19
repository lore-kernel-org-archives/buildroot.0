From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 20:57:18 +0200
Subject: [Buildroot] [PATCH 3 of 4] manual generation: check
 dependencies first
In-Reply-To: <CAAXf6LWpjXetyUo4QHbc3FFi4qP2qmeSsJbuwwP9+3_vnuabyQ@mail.gmail.com>
References: <patchbomb.1379587632@argentina>
 <246bed054da59d6508dc.1379587635@argentina>
 <CAHXCMMJ2oSqF_MoyDJYjxCKKZukwg6vr2ewP+TUFy9kaDrwcoA@mail.gmail.com>
 <CAAXf6LW=7dUUEjGHp6xVFy9-SEXVuUyiK8Lvom2imyCX=s+3oQ@mail.gmail.com>
 <20130919173926.0bf04d9a@skate>
 <CAAXf6LWpjXetyUo4QHbc3FFi4qP2qmeSsJbuwwP9+3_vnuabyQ@mail.gmail.com>
Message-ID: <20130919205718.45d3c7cc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 19 Sep 2013 18:27:34 +0200, Thomas De Schampheleire wrote:

> I was thinking it could become a separate build target. But at that
> time I didn't fully realize (and didn't check) that these lists are
> actually included in the manual. So, that question is void now.

No problem :)

> Remains: how should we check for python argparse? Module argparse is
> included from python-2.7 and python-3.2 onwards. It seems that Ubuntu
> has been providing python-argparse for older python versions as well,
> but IMO it is not needed to check for this explicitly. If you ask me,
> I would simply check for python 2.7+ and 3.2+, but I'm open for
> discussion.

if ! python -c "import argparse" >/dev/null 2>&1 ; then
	echo "No Python, or argparse not available"
	exit 1
fi

something like that, no? It would cover both cases were argparse is
part of the default Python installation and the cases were argparse was
installed separately.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
