From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Dec 2017 09:10:53 +0100
Subject: [Buildroot] [PATCH] utils/checkpackagelib: exclude two files
 from Config.in indentation check
In-Reply-To: <5a39a17460729_111111ac5882144b@ultri3.mail>
References: <20171219093614.24bdc185@windsurf>
 <5a39a17460729_111111ac5882144b@ultri3.mail>
Message-ID: <20171220091053.6a760beb@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Dec 2017 21:32:04 -0200, Ricardo Martincoski wrote:

> Thank you for explaining (in the other e-mail) the reasoning of the special
> indentation.
> 
> 
> One last thought about the code...
> 
> Until now the script can be called passing relative or absolute filenames to
> check. These 3 commands have the same result:
> $ ./utils/check-package $(find $(readlink -f package) -type f) >/dev/null
> $ ./utils/check-package $(find package -type f) >/dev/null
> $ ./utils/check-package $(find ./package -type f) >/dev/null
> 
> To keep this behavior we could use instead:
>                 if self.filename.endswith("package/x11r7/Config.in") or \
>                    self.filename.endswith("package/kodi/Config.in"):
> or its equivalent in one line (it fits in 132).

Sure, makes sense.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
