From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 10:17:14 +0200
Subject: [Buildroot] Clone source code recursively
In-Reply-To: <CAMkMO5mqkfSz8ky1Ry05m2Z3aT9PXsNiNSjFvNMpu87GCnx03Q@mail.gmail.com>
References: <CAMkMO5mqkfSz8ky1Ry05m2Z3aT9PXsNiNSjFvNMpu87GCnx03Q@mail.gmail.com>
Message-ID: <20160825101714.4cb710e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 01:31:41 +0200, Zygmunt Ptak wrote:

> I can't find how can I clone code recursively from git repository.
> Is it possible at all?

What do you call "recursively"? Are you talking about also fetching
submodules? If that's what you're talking about, we recently added
support for that:

  https://git.buildroot.org/buildroot/commit/package/pkg-generic.mk?id=ec3e057f79117d851c37f19316a3b9b5e2470550

You just need to add:

  FOO_GIT_SUBMODULES = YES

in your package .mk file.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
