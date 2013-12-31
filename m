From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Dec 2013 21:22:48 +0200
Subject: [Buildroot] Unable to compile qt5base
In-Reply-To: <CA+hj=Mp9Y0ROZDd-zC0tKHa--vGYx_VmO9LAUuuj8xYD1N9OpA@mail.gmail.com>
References: <CA+hj=Mp9Y0ROZDd-zC0tKHa--vGYx_VmO9LAUuuj8xYD1N9OpA@mail.gmail.com>
Message-ID: <20131231192248.GD4263@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ivan,

On Tue, Dec 31, 2013 at 04:23:08PM +0100, Ivan Wagner wrote:
> I'm trying to compile qt5base by issuing the following command after
> buildroot has been configured: make qt5base-config
> 
> I'm using Mentor Graphics' v. arm-2013.11.0.33 as an external toolchain.
> 
> For some reason I need to compile pkgconf and somehow I'm unable to
> compile...

[...]

> checking whether the C compiler works... no
> configure: error: in
> `/home/ivan/projects/buildroot/output/build/host-pkgconf-0.8.9':
> configure: error: C compiler cannot create executables

Something is wrong with your host toolchain (not the Codesourcery one).

Your error message says:

> See `config.log' for more details
> make: ***
> [/home/ivan/projects/buildroot/output/build/host-pkgconf-0.8.9/.stamp_configured]
> Error 77

Check the file at output/build/host-pkgconf-0.8.9/config.log, and see what is 
the exact error message of this test.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
