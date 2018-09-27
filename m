From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 20:50:43 +0200
Subject: [Buildroot] [PATCH 1/1] linux-firmware: bump version and fix
 hash
In-Reply-To: <20180926223806.12704-1-nunes.erico@gmail.com> (Erico Nunes's
 message of "Thu, 27 Sep 2018 00:38:06 +0200")
References: <20180926223806.12704-1-nunes.erico@gmail.com>
Message-ID: <87mus2vkos.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Erico" == Erico Nunes <nunes.erico@gmail.com> writes:

 > Bump the package to the most up to date version and fix the sha256 hash.
 > linux-firmware was failing due to an incorrect sha256 hash, as follows:

 > Fetching all references
 > warning: redirecting to https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/
 > remote: Counting objects: 6972, done.
 > remote: Total 6972 (delta 0), reused 0 (delta 0)
 > Receiving objects: 100% (6972/6972), 196.63 MiB | 4.22 MiB/s, done.
 > Resolving deltas: 100% (4516/4516), done.
 > From http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware
 >  * [new branch]      master     -> origin/master
 > warning: redirecting to https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/
 > warning: refname '8d69bab7a3da1913113ea98cefb73d5fa6988286' is ambiguous.
 > Git normally never creates a ref that ends with 40 hex characters
 > because it will be ignored when you just specify 40-hex. These refs
 > may be created by mistake. For example,

 >   git checkout -b $br $(git rev-parse ...)

 > where "$br" is somehow empty and a 40-hex ref is created. Please
 > examine these refs and maybe delete them. Turn this message off by
 > running "git config advice.objectNameWarning false"
 > ERROR: linux-firmware-8d69bab7a3da1913113ea98cefb73d5fa6988286.tar.gz has wrong sha256 hash:
 > ERROR: expected: 905be20e4e2d7628dea4e2e99195520fc0cce8b247faabdc52fc44a3ff2ceb04
 > ERROR: got     : b9fce72a7b0b55eb311701dfd47914bc9e037134fa401d33e6e73ab9ebc9d116
 > ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Hmm, odd?
 
 > -LINUX_FIRMWARE_VERSION = 8d69bab7a3da1913113ea98cefb73d5fa6988286
 > +LINUX_FIRMWARE_VERSION = 44d4fca9922a252a0bd81f6307bcc072a78da54a

Did you verify if we need to adjust any of sub options logic? There are
quite some changes, but from a quick look I didn't see any new files
that need to be explicitly handled.

Committed, thanks.

-- 
Bye, Peter Korsgaard
