From: Jaap Crezee <jaap@jcz.nl>
Date: Sat, 6 Jun 2020 13:26:29 +0200
Subject: [Buildroot] make sdk - relocate - ccache not working as expected
In-Reply-To: <CANQCQpYLf0veHYzjNeYcq3_FdTF+4ig85YbNq5RVJvyaqKL0pA@mail.gmail.com>
References: <2b30abbf-41ab-253e-0c91-6bb6cf5e36a5@jcz.nl>
 <CANQCQpYLf0veHYzjNeYcq3_FdTF+4ig85YbNq5RVJvyaqKL0pA@mail.gmail.com>
Message-ID: <d0c7e492-7055-1829-4fdb-15a298680407@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt, all,

On 2020-06-01 13:32, Matthew Weber wrote:
> The ccache callback's path is compiled into the toolchain-wrapper, so
> you'd have to disable ccache and do a clean build before doing the
> make sdk.  Or set the BR_NO_CCACHE=1 environment variable when using
> your sdk.  Something I've done in my sdk exports is adjust the
> toolchain wrapper before running make sdk. Here's an untested example
> of something you could add to your post build script or adjust the
> tarball to have this change after make sdk runs.

This made me thinking; after doing a search I figured out the following workaround works for me:

CCACHE_DIR=<somewhere-the-user-running-under-can-write-to>

I consider this a bug in the toolchainwrapper (I guess). What do fellow buildroot users think?

regards,

Jaap
