From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 16 Feb 2016 12:55:30 +0100
Subject: [Buildroot] [v3,
	0/4] Supporting building a second Barebox config
In-Reply-To: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
Message-ID: <CAGm1_kuA6pdj4KJ_TT26f4kfgSYaFMjKiV4T4gLTn-2HsQspeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pieter,

On Wed, Jan 20, 2016 at 11:43 PM, Pieter Smith <pieter@boesman.nl> wrote:
> This patch-set in 4 parts adds support for building barebox with up to 2
> configurations. It can be used to build the barebox x-loader or MLO (also
> called Secondary Program Loader) in addition to the standard barebox build
> (Tertiary Program Loader). This implements the design proposed in
> http://elinux.org/Buildroot#Todo_list:
> 1. Have boot/barebox/ containing the common stuff.
> 2. Add two separate packages boot/barebox-1/ and boot/barebox-2/.
> 3. There is only one version selection, but each package allows to
>    define the configuration to be used.
> 4. Design is a little bit like package/gcc, where we have multiple gcc builds,
>    but share a lot of common definitions between the packages.
>
> To demonstrate that it works as advertized, the last patch adds a defconfig for
> the beaglebone black that makes use of the added functionality.

I've applied the patches and built both MLO and barebox.bin binaries.
The patches are working as expected.

I have following use case: I have one board, but want provide
different environment scripts per project. These scripts should be
stored in BR2_EXTERNAL folder. I'd like to also embed them into
barebox.bin. How can I do it in BR?

Yegor
