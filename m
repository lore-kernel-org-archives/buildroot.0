From: Ivan Wagner <ivan.wagner@gmail.com>
Date: Thu, 2 Jan 2014 12:35:00 +0100
Subject: [Buildroot] Wrong compiler path when compiling zlib
In-Reply-To: <20140102111744.GZ6589@tarshish>
References: <CA+hj=MoNYEZchBs1_34cS4eA=UYfU+2QNdbNBDOqt=u2YFsJPw@mail.gmail.com>
 <20140102044704.GF6589@tarshish>
 <CA+hj=Mqv-+aJiSYFDZUnh_3Est=aC26CfC6kr_FkqM58sjNj3Q@mail.gmail.com>
 <20140102091925.GO6589@tarshish>
 <CA+hj=MoPxwwNn76Sh3vgP5VpkFsUn6uMRKtYW76a-A4DpoMkxg@mail.gmail.com>
 <20140102103439.GW6589@tarshish>
 <CA+hj=MpO+iC+YwcHcBsSL7kNMfFAhaV8MZz-mai86tnOD6E3Qw@mail.gmail.com>
 <20140102110639.GY6589@tarshish>
 <CA+hj=MpY+U_9RNpcVzaSgq9Zmg2tqcxoh8nWWhRbo3O+3yFEgg@mail.gmail.com>
 <20140102111744.GZ6589@tarshish>
Message-ID: <CA+hj=MrgJn9phMDkgdZrCuT=BumpmmW2EH6VnWBqRzYSP-6Uig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Thu, Jan 2, 2014 at 12:17 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> See the TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER macro in
> toolchain/toolchain-external/toolchain-external.mk.

I think I found out something. At the moment I was only interested in
trying to cross-compile qt5 for the ARM arch. So what I've done is to
create a basic buildroot configuration where I selected the external
toolchain, basic packages and qt5. But then I directly execute "make
qt5base-build" and at this stage toolchain-external stuff doesn't get
executed. That's why I don't see any symlinks.
If I simply run "make" then the toolchain-external is executed.
