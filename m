From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 23:34:58 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5webengine: don't link with
 libstdc++.a on the host
In-Reply-To: <20200524155818.126961-1-romain.naour@gmail.com>
References: <20200524155818.126961-1-romain.naour@gmail.com>
Message-ID: <20200529233458.2dbace04@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 May 2020 17:58:18 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> +             gn_gen_args = --no-last-commit-position --out-path $$out_path \
> +                           --cc \"$$which($$QMAKE_CC)\" --cxx \"$$which($$QMAKE_CXX)\" \
> +-                          --ld \"$$which($$QMAKE_LINK)\"
> ++                          --ld \"$$which($$QMAKE_LINK)\" \
> ++                          --no-static-libstdc++

If we have to pass this, doesn't it mean that the host tools are built
statically ? Why are they built statically ? They really shouldn't be
built statically at all. I believe this is what should be fixed, rather
than just avoiding specifically from linking statically with libstdc++.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
