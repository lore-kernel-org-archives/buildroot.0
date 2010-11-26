From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 26 Nov 2010 13:16:45 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day,
	29th October 2010
In-Reply-To: <20101123221417.0d6867c6@surf>
References: <20101123221417.0d6867c6@surf>
Message-ID: <AANLkTi=A4sufp9mSKrBzHtPE87WsLPw4k6+jti6hM0He@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Nov 23, 2010 at 10:14 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[...]
>
> Board cleanup
> =============
>
[...]
>
> Nicolas and Patrice, who ship Buildroot as one of the development
> environment for the AT91 Atmel evaluation boards, were generally
> satisfied with those changes.
>
> They however, proposed some improvements:
>
> ?* Add the ability for some key components (kernel, u-boot, etc.) to
> ? specify a patch that is in fact a tarball containing multiple
> ? patches, stored on http/ftp. This is more practical than the
> ? current situation of a single file patch, since most of the time,
> ? series of patches needs to be applied.
>
> ?* Add the ability to specify a space-separated list of patches.
>
> Thomas has voluntered to implement those two changes for the 2011.02
> release.

What about allowing components to be located in a separate location,
outside of buildroot?

For example, I currently have a custom linux kernel, that I would like
to use in buildroot. I selected the 'custom' kernel options, and
placed the .tar.bz2 file containing the custom kernel in the 'dl'
directory of buildroot. This works.

Unfortunately, since the custom kernel is under development, I
regularly need to make changes to it. My current approach forces me to
create a new .tar.bz2 archive every time I want to create a build with
the changed kernel.

Another solution would be to create patches each time I create a
build, and specify the patches in buildroot (using one of the proposed
improvements above), but still it requires me to do manual work.

It would be interesting to have a feature that allows one to specify a
path to an (unpacked) kernel. Buildroot would then directly use this
path as the source base, but would place the output files elsewhere
(in the output directory of buildroot).
Each time I modify the sources, buildroot should automatically (and
this is the hard part) determine it should rebuild them, but I don't
need to manually create an archive or patches.

Thanks,
Thomas
