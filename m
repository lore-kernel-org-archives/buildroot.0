From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Feb 2014 13:52:55 +0100
Subject: [Buildroot] [PATCH v6 3/5] udev: convert to virtual package.
In-Reply-To: <CAAXf6LUbj5qTnNy7EHEsRhsNwaHk8yX8N=Ja9UFUM2EhOf=qNQ@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 5 Feb 2014 13:31:14
 +0100")
References: <1389627907-7821-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1389627907-7821-4-git-send-email-eric.le.bihan.dev@free.fr>
 <CAAXf6LXUD2hAt+_0JUyXHgwOGqHVwe4J7-AkekopnR-LixKOAg@mail.gmail.com>
 <20140204121030.GA8125@pc-eric>
 <CAAXf6LUbj5qTnNy7EHEsRhsNwaHk8yX8N=Ja9UFUM2EhOf=qNQ@mail.gmail.com>
Message-ID: <87d2j1202g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> I find it odd that some packages depend on
 >> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV whereas others depend on
 >> BR2_PACKAGE_UDEV. To me, both symbols are interpreted as "the package needs a
 >> udev daemon to talk to at runtime" (whether via D-Bus or libudev). So I
 >> replaced both with BR2_PACKAGE_HAS_UDEV to be homogeneous. It is true that if
 >> a package depends on BR2_PACKAGE_HAS_UDEV, it is not explicitly said if it is
 >> a runtime or a build dependency. But, AFAIK, programs that want to communicate
 >> with the udev daemon do it via libudev/libgudev, so we end up with a build
 >> dependency.
 >> 
 >> In system/Config.in, I removed BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV because
 >> I want the user to understand the change: he/she should not think of 'udev' as
 >> a package, but as a feature which, at this stage, is only available via eudev.
 >> I could have kept BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV and have it select
 >> BR2_PACKAGE_EUDEV, but I've found it confusing.
 >> 
 >> But I should have added BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV in
 >> Config.in.legacy to migrate to BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV.
 >> 
 >> In the end, the user selects BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV, which
 >> selects BR2_PACKAGE_EUDEV, which in turn selects BR2_PACKAGE_HAS_UDEV. All the
 >> packages depending on it are now available.

 > Based on your additional input, and rechecking the changes, I
 > understand your reasoning and accept it.
 > You still should add the legacy symbol, though.

 > Peter, what about you?

With the legacy handling added I'm fine with the rename.

-- 
Bye, Peter Korsgaard
