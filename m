From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 28 Jan 2019 20:36:27 +0100
Subject: [Buildroot] [PATCH 0/2] OpenJDK: new package.
In-Reply-To: <20190128163126.106059-1-aduskett@gmail.com>
References: <20190128163126.106059-1-aduskett@gmail.com>
Message-ID: <CAAXf6LX_oUqyC3HbkLFhUPR0GfpoOWgmwVHu09eP0FcBtPNGEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
El lun., 28 ene. 2019 a las 17:31, <aduskett@gmail.com> escribi?:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> This patch series introduces BuildRoot to OpenJDK.
>
> A previous patch series for OpenJDK8 used the JDK Muricle page to download a
> tarball. Instead, what I have chosen to do is use the AdoptOpenJDK GitHub
> repository. This repository allows us to use the GitHub macro instead of trying
> to provide a nasty workaround when grabbing the source code.
>
> With this patch series, there are some quirks that I would like to detail:
>
> - The openjdk-bin package:
> From http://hg.openjdk.java.net/jdk10/jdk10/raw-file/tip/common/doc/building.html#boot-jdk-requirements
> "Paradoxically, building OpenJDK requires a pre-existing JDK. This is called
> the "boot JDK." The boot JDK does not have to be OpenJDK, though. If you are
> porting OpenJDK to a new platform, the chances are that there already exists
> another JDK for that platform that is usable as boot JDK.
>
> The rule of thumb is that the boot JDK for building JDK major version N should
> be a JDK of major version N-1, so for building JDK 9, a JDK 8 would be suitable
> as boot JDK."
>
> This paradox causes an issue because every distribution I have used comes with
> JDK8 by default. So there are two solutions that I could come up with:
> 1) Require the host-system to have JDK N-1
> 2) Grab the convenient and easy to install binaries from the AdoptOpenJDK
>    repository, and use those binaries as the boot-jdk.
>
> - JDK >= 10 requires X11, even if building a headless version.
>   It's unfortunate, but there isn't anything I cared to do about it.

It should be possible to build without X11, with some changes.
See also the openjdk package I sent last year as reference:
http://lists.busybox.net/pipermail/buildroot/2018-February/213282.html

Best regards,
Thomas
