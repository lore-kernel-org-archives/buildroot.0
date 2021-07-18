From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 21:14:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/usbguard: disable on musl
In-Reply-To: <20210704154848.3401838-1-fontaine.fabrice@gmail.com>
References: <20210704154848.3401838-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718211447.1c57ac78@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun,  4 Jul 2021 17:48:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> usbguard doesn't build on musl because it uses GNU version of strerror_r
> as well as basename resulting in the following build failure:
> 
> In file included from ./src/Library/public/usbguard/Rule.hpp:24,
>                  from src/CLI/usbguard-rule-parser.cpp:23:
> ./src/Library/public/usbguard/Exception.hpp: In static member function 'static std::string usbguard::ErrnoException::reasonFromErrno(int)':
> ./src/Library/public/usbguard/Exception.hpp:129:72: error: no matching function for call to 'std::__cxx11::basic_string<char>::basic_string(int)'
>   129 |       return std::string(strerror_r(errno_value, buffer, sizeof buffer));
>       |
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ac1fd7b8c7bd65c73a9213a40c5ed1c39204dab0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/usbguard/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
