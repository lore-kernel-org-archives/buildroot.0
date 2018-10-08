From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 09:03:08 +0200
Subject: [Buildroot] Qt5 build issues with glibc arm64 buildroot compiler
In-Reply-To: <CAMty3ZCAaycY2gazxhYwi1DU_E9tyYP71_ewzstFoba02wTqcw@mail.gmail.com>
References: <CAMty3ZCAaycY2gazxhYwi1DU_E9tyYP71_ewzstFoba02wTqcw@mail.gmail.com>
Message-ID: <20181008090308.3c5daa83@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jagan,

On Mon, 8 Oct 2018 11:51:35 +0530, Jagan Teki wrote:
> Hello,
> 
> Any one tried of building Qt5 on arm64 with glibc buildroot native
> compiler. I'm observing build issues as below, let me know If I missed
> something?
> 
> BR2_TOOLCHAIN_BUILDROOT_GLIBC
> BR2_TOOLCHAIN_BUILDROOT_CXX
> BR2_PACKAGE_QT5
> BR2_PACKAGE_QT5BASE_EXAMPLES
> BR2_PACKAGE_QT5BASE_GUI
> BR2_PACKAGE_QT5BASE_EGLFS

Could you provide an actual Buildroot .config file ? Indeed the above
config snippet is impossible: BR2_PACKAGE_QT5BASE_EGLFS requires an
OpenGL implementation, and your list of config options has none
selected.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
