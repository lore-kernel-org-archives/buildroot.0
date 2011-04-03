From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 3 Apr 2011 20:22:56 +0200
Subject: [Buildroot] [PATCH 3/3] Allow several device tables and split
 in two parts our device table
In-Reply-To: <22eab5b5139c1666b306d0afdbea056a8af65075.1301763205.git.thomas.petazzoni@free-electrons.com>
References: <cover.1301763205.git.thomas.petazzoni@free-electrons.com>
	<22eab5b5139c1666b306d0afdbea056a8af65075.1301763205.git.thomas.petazzoni@free-electrons.com>
Message-ID: <AANLkTimoHTKq7pBCjbppCiUAvE1GfqJapnpJF6c4Y-t=@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 2, 2011 at 6:53 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This allows to have a device table for all directories/files and
> another device table for the device files themselves. Both are needed
> for static /dev, but only the first one is needed when
> devtmpfs/mdev/udev are used.
>
> We take this opportunity to move the documentation of the device table
> format in a common location, package/makedevs/README.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> ?fs/Config.in ? ? ? ? ? ? ? ? ? ? ? ?| ? 20 +++-
> ?fs/common.mk ? ? ? ? ? ? ? ? ? ? ? ?| ? 14 ++-
> ?package/makedevs/README ? ? ? ? ? ? | ? 35 +++++++

The source file makedevs.c also contains some documentation, with more
examples. I think it would be best to keep just one: either the README
file (expanded with the documentation in the sources), or the source
documentation.

Best regards,
Thomas

> ?target/generic/device_table.txt ? ? | ?186 ++--------------------------------
> ?target/generic/device_table_dev.txt | ?142 ++++++++++++++++++++++++++
> ?5 files changed, 211 insertions(+), 186 deletions(-)
> ?create mode 100644 package/makedevs/README
> ?create mode 100644 target/generic/device_table_dev.txt
>
