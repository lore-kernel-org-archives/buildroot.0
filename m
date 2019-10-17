From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Oct 2019 08:08:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.52.0
References: <20191014090536.43971-1-james.hilliard1@gmail.com>
 <20191016220724.1c155cfb@windsurf.home>
Message-ID: <14dl7gx0v9.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 16 Oct 2019 22:07:24 +0200 schrieb Thomas Petazzoni:

> On Mon, 14 Oct 2019 03:05:36 -0600 James Hilliard
> <james.hilliard1@gmail.com> wrote:
> 
>> Signed-off-by: James Hilliard
>> <james.hilliard1@gmail.com>
>> ---
>>  package/meson/meson.hash | 4 ++-- package/meson/meson.mk   | 2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> Applied to master, thanks.
> 
> Thomas

Hi,

meson added an dependency to lzma:
https://github.com/mesonbuild/meson/issues/6012

To fix the various build errors resulting from this bump I added host-xz 
to HOST_PYTHON3_DEPENDENCIES to make sure that xz was built before host-
python3.

Are there better solutions to ensure that host-xz was built before host-
python3 during the build of host-meson?

Regards, Bernd
