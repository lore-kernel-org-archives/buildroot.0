From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 13:21:21 +0100
Subject: [Buildroot] Wrong compiler path when compiling zlib
In-Reply-To: <CA+hj=MrgJn9phMDkgdZrCuT=BumpmmW2EH6VnWBqRzYSP-6Uig@mail.gmail.com>
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
 <CA+hj=MrgJn9phMDkgdZrCuT=BumpmmW2EH6VnWBqRzYSP-6Uig@mail.gmail.com>
Message-ID: <20140102132121.02090747@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ivan Wagner,

On Thu, 2 Jan 2014 12:35:00 +0100, Ivan Wagner wrote:

> I think I found out something. At the moment I was only interested in
> trying to cross-compile qt5 for the ARM arch. So what I've done is to
> create a basic buildroot configuration where I selected the external
> toolchain, basic packages and qt5. But then I directly execute "make
> qt5base-build" and at this stage toolchain-external stuff doesn't get
> executed. That's why I don't see any symlinks.
> If I simply run "make" then the toolchain-external is executed.

Correct. We currently don't have a dependency on all packages to the
toolchain. There are pending patches to fix this.

In the mean time, unless you know in details the Buildroot internals,
you should only do simple "make" commands.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
