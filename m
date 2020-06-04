From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 11:21:44 +0200
Subject: [Buildroot] [PATCH] Revert "package/prosody: use correct bit32
 package"
In-Reply-To: <CAB0FRssoZHBnO329q0vvX-8Yr8MBPMzZrhs7UGLytVn1eo++Dg@mail.gmail.com>
References: <20200603215904.98199-1-romain.naour@gmail.com>
 <CADvTj4qMYKh1CCqjeZaXcGvguHZbDFao8AXinQtr8LyFjFKmOA@mail.gmail.com>
 <281890da-6c1a-fcb5-0436-7d8cb8c1affa@gmail.com>
 <CAB0FRssoZHBnO329q0vvX-8Yr8MBPMzZrhs7UGLytVn1eo++Dg@mail.gmail.com>
Message-ID: <20200604112144.61489c05@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 4 Jun 2020 07:00:47 +0200
Fran?ois Perrad <francois.perrad@gadz.org> wrote:

> 2) with BR, it's easy to run a test (even locally, before a commit), but it
> isn't easy to know that a test exists.
> In my point of view, the right place of test_prosody.py is in the directory
> package/prosody, not in support/testing/tests/package,
> support/testing is the right place only for testing infrastructure.

We indeed though about putting tests near packages. However, one issue
is that not all tests are related to packages: some are related to the
core infrastructure, and we wouldn't know where to put those tests. And
it would be even more confusing to have some tests in support/testing/
and some tests in package/. So for now, we have simply kept all tests
in support/testing/, until someone comes up with a better idea :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
