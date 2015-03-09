From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 22:44:49 +0100
Subject: [Buildroot] [PATCH 1/2] target-finalize: generate all *.pyc
In-Reply-To: <CAHXCMMLDX9MXeR19NDkkDwenvJVH3pguVSxaRt6sROGQ+kNb_A@mail.gmail.com>
References: <1425918264-1912-1-git-send-email-s.martin49@gmail.com>
 <20150309185405.5f312f1b@free-electrons.com>
 <CAHXCMMLDX9MXeR19NDkkDwenvJVH3pguVSxaRt6sROGQ+kNb_A@mail.gmail.com>
Message-ID: <20150309224449.730a5c99@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 9 Mar 2015 22:30:02 +0100, Samuel Martin wrote:

> Indeed, it'd be better to avoid  wasting time building *.pyc during
> per-package build, though it does not seem really easy to do at first
> glance.
> Well, after hacking around, it is not that hard to do it! :-)
> I cleanup my hacks and will submit them.

Ok, cool.

> The hook is simple enough to be moved in pkg-python.mk as a helper,
> then just being added to the PYTHON{,3}_TARGET_FINALIZE_HOOKS.

Indeed.

> However, if we decide to not go using a global TARGET_FINALIZE_HOOKS,
> but per-package target-install hook, the helper can be easily added to
> the packages that need it; the biggest remaining task being
> identifying and updating all packages not using the pkg-python infra
> but providing a python module.

Well, as it is currently implemented, the hook byte-compiles *all* .py
files. So if you call this hook multiple times, you're going to
byte-compile all .py files multiple times. Doesn't seem like the most
efficient thing to do.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
