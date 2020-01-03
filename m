From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 17:39:09 +0100
Subject: [Buildroot] [PATCH 05/11] support/scripts/pkg-stats: parse and
 set developers info
In-Reply-To: <CAEyMn7aPCiLX-RB8vYm_-OnhrjXXrxJg+ufYgPUx5cRcjSW0tw@mail.gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-6-heiko.thiery@gmail.com>
 <20200103162625.093ff7b2@windsurf>
 <CAEyMn7aPCiLX-RB8vYm_-OnhrjXXrxJg+ufYgPUx5cRcjSW0tw@mail.gmail.com>
Message-ID: <20200103173909.70596709@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 3 Jan 2020 17:32:42 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> > You have duplicated this function from utils/getdeveloperlib.py, which
> > is intended to be used as a Python module. Why don't we try to use it,
> > instead ?  
> 
> I also thought about that ... should we then move the pkg-stats script
> to the utils folder?

Normally, utils/ is for tools that are directly useful to the Buildroot
user/developer, and pkg-stats is not really such a tool. It's kind of
an internal tool we use to generate this JSON/HTML stuff, but the
regular Buildroot developer does not need that.

One idea is to add ../../utils to the Python path used to search for
modules. I think it can be tweaked from inside a Python script. Not
sure if it's the nicest thing to do, though.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
