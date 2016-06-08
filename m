From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 8 Jun 2016 12:11:10 +0200
Subject: [Buildroot] [PATCH v2] kmsxx: new package
In-Reply-To: <20160602071719.GE4908@lukather>
References: <1462783135-16131-1-git-send-email-maxime.ripard@free-electrons.com>
 <20160602071719.GE4908@lukather>
Message-ID: <CAGm1_ktObtf0w4buOSYcfrYe4nmTzdcXSfTR2Q99KWvA=cV7Rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime ,

On Thu, Jun 2, 2016 at 9:17 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Mon, May 09, 2016 at 10:38:55AM +0200, Maxime Ripard wrote:
>> KMS++ is a suite of library and test tools to interact with KMS drivers in
>> the linux kernel.
>>
>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>
> Ping?

What about removing Python bindings config option and just check if
Python 3 is activated in *.mk file? See package/libcec/libcec.mk for
reference.

Though libdrm already requires host-pkgconf, should this dependency
appear in kms.mk?

I've looked at CMakeLIsts.txt in master branch of the project and I
cannot see swig invocation. They just seem to compile some cpp files
in py folder.

Could also ask project maintainers to add some cpack stuff?

Yegor
