From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 23 Sep 2011 08:18:19 +0200
Subject: [Buildroot] [PATCH 5 of 5] toolchain-external: use host-tar
 instead of tar to unpack toolchains
In-Reply-To: <201109222202.37083.arnout@mind.be>
References: <patchbomb.1316588130@localhost6.localdomain6>
 <CAAXf6LWQj65KCeCEzb-ETyFpUPqgjtxK0MZnbAfHayBx6GXE_Q@mail.gmail.com>
 <201109210554.57701.minimod@morethan.org>
 <201109222202.37083.arnout@mind.be>
Message-ID: <CAAXf6LXMasRpJxQQ3e=mTOaK0edu5rEp2E2guV3bEnFoA70C0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 22, 2011 at 10:02 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> On Wednesday 21 September 2011 12:54:55, Michael S. Zick wrote:
>> That should help keep the build environment sane, with a message
>> to the user if something is too old;
>> And should relieve the maintainers of the task of remembering to
>> "re-correct" the build system someday in the future.
>
> ?How does that help the users who are stuck on RH5? ?Buildroot would still not
> work for them (although with a clearer explanation why not), so they'd have to
> implement Thomas's patches after all.

The way I interpreted this was to add a check to dependencies.sh on
the system tar version. If it's too old, we go ahead and build our own
host-tar and use it as $(TAR). If it is recent enough, we don't change
anything.
I still need to try that out though.

Best regards,
Thomas
