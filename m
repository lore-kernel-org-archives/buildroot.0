From: Erico Nunes <nunes.erico@gmail.com>
Date: Sat, 9 Jan 2016 12:35:31 -0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-12-07
In-Reply-To: <20151208073019.9BDA510542E@stock.ovh.net>
References: <20151208073019.9BDA510542E@stock.ovh.net>
Message-ID: <CAK4VdL3=WLdqGPrKbmZbrw7Lq4=1cJq1pXLmhLh2QPzdDXH51g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Dec 8, 2015 at 5:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>          arm | spi-tools-cc6a41fdcec606107... | NOK | http://autobuild.buildroot.net/results/ed89fae4a722b5d2adff9826bb88e55e58af77f6/

This failure is due to the use of a musl toolchain with spi-tools. It
is actually exactly the same issue which happens to the lua-periphery
package and can be fixed by a patch very similar to
package/lua-periphery/0001-Add-missing-header-for-musl-compatibility.patch
.
I have sent the patch to the spi-tools maintainer so that we can
hopefully fix the issue by bumping the package without adding a custom
patch.

Erico
