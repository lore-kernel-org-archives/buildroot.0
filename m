From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Wed, 06 Nov 2019 09:13:41 +0100
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH_v7_3/8=5D_core=3A_implement_?=
 =?iso-8859-1?q?per-package_SDK_and_target?=
In-Reply-To: <20191106085733.3b339da7@windsurf>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228104335.22379-4-thomas.petazzoni@bootlin.com>
 <b92540ca-37ad-42ad-9bf3-eee8f6f6ed26@cesnet.cz>
 <20191105173830.6c8fc5d1@windsurf>
 <CAJ4jsafpnaBRuxtd-6RFAGVcFgkEgmqNbjDLgPEYQV5DXGMxMw@mail.gmail.com>
 <20191106085733.3b339da7@windsurf>
Message-ID: <077a17f3-becf-4504-ad01-7e0a2014096c@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Then I guess the TARGET_FINALIZE_HOOKS is the only solution here.

Yes, this sounds reasonable.

> But thinking more about this issue, it really means that no package
> should overwrite any file installed by one of its dependencies:

Agreed. Of course there are still scenarios where packages have to 
overwrite stuff which belongs to something else (think of packages 
"registering themselves" within a file managed by a package they depend 
on). These can be solved by explicitly configuring these packages so that 
this conflicting resource exists in just one location, i.e., outside of the 
per-package namespace.

I've been doing this with (still out-of-tree) sysrepo etc like this:

https://gerrit.cesnet.cz/plugins/gitiles/github/buildroot/buildroot/+/refs/heads/cesnet/2019-06-10/package/sysrepo/sysrepo.mk#41

How does merging the ppsh work look?

With kind regards,
Jan
