From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 18:41:13 +0200
Subject: [Buildroot] [PATCH] php: bump 7.0.11
In-Reply-To: <CANqewP0UNjM_Ya=awwHEC+H3+h8UH=DLFv9YoTihOw_sK4Ld9g@mail.gmail.com>
References: <CANqewP0UNjM_Ya=awwHEC+H3+h8UH=DLFv9YoTihOw_sK4Ld9g@mail.gmail.com>
Message-ID: <20160916184113.6fd787c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Sep 2016 07:47:06 +0000, Tatsuyuki Ishi wrote:
> See the attached patch.

Thanks for this patch. However, we prefer to have patches "inline"
rather as attached files, as it makes the review easier. We recommend
to use "git send-email" to send patches.

In addition, your patches does not apply. Your change to php.hash is:

 # From http://php.net/downloads.php
-sha256 970c322ba3e472cb0264b8ba9d4d92e87918da5d0cca53c4aba2a70545b8626d  php-7.0.9.tar.xz
+sha256 d4cccea8da1d27c11b89386f8b8e95692ad3356610d571253d00ca67d524c735  php-7.0.11.tar.xz
 sha256 44cab15d57b2fb8fa916ff9291059a34b0c3fa99298c2b08a5082f334613753a  yaml-2.0.0RC8.tgz
 sha256 bb13da909a7a7ae1f9e499166103a2d24628993238ce03a8aae3eaa492c0b736  pthreads-3.1.6.tgz
 sha256 dc09445c0395bf21d06f21af64697d95244e1a06baade88afa7e07ef75d9b180  Weakref-0.3.2.tgz

But this does not match the php.hash in current Buildroot master, which
doesn't have any reference to the yaml, pthreads or Weakref tarballs.

Could you rework your patch and send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
