From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 7 Aug 2012 17:28:32 +0200
Subject: [Buildroot] Prebuilt concept
In-Reply-To: <CAFt09wNhCtxZcG63uJ8iCuaLeSWEMZrFRd-VuoNw3cTPkFXGAg@mail.gmail.com>
References: <CAFt09wNhCtxZcG63uJ8iCuaLeSWEMZrFRd-VuoNw3cTPkFXGAg@mail.gmail.com>
Message-ID: <CAHXCMMKfgsM8JAdN=vbtmt2JPv1OSccq7SCYQRVpisqAg8HLyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

2012/8/7 Matthew Weber <matt@thewebers.ws>:
> My problem is overall build time for recreating the large # of packages I'm
> building.  When I perform a verification of the target rootfs for a release,
> I really just need it to recreate the output/target folder and don't need to
> do a complete rebuild.  Has anyone tried to trick buildroot into just
> re-installing the target folder using all the existing (built) packages?

A solution could be (not tested):
rm -rf output/target && find output/build -name
.stamp_target_installed -delete && make

Cheers,

-- 
Sam
