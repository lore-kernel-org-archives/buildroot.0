From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 3 Oct 2018 21:11:35 +0200
Subject: [Buildroot] [PATCH 1/1] linux-firmware: bump version and fix
 hash
In-Reply-To: <87mus2vkos.fsf@dell.be.48ers.dk>
References: <20180926223806.12704-1-nunes.erico@gmail.com>
 <87mus2vkos.fsf@dell.be.48ers.dk>
Message-ID: <CAK4VdL0mu+5Od73gU4T7dRLVRHior7gYg6NQ3+bNKms9P5R=EQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 27, 2018 at 8:50 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>  > ERROR: linux-firmware-8d69bab7a3da1913113ea98cefb73d5fa6988286.tar.gz has wrong sha256 hash:
>  > ERROR: expected: 905be20e4e2d7628dea4e2e99195520fc0cce8b247faabdc52fc44a3ff2ceb04
>  > ERROR: got     : b9fce72a7b0b55eb311701dfd47914bc9e037134fa401d33e6e73ab9ebc9d116
>  > ERROR: Incomplete download, or man-in-the-middle (MITM) attack
>
> Hmm, odd?
>
>  > -LINUX_FIRMWARE_VERSION = 8d69bab7a3da1913113ea98cefb73d5fa6988286
>  > +LINUX_FIRMWARE_VERSION = 44d4fca9922a252a0bd81f6307bcc072a78da54a
>
> Did you verify if we need to adjust any of sub options logic? There are
> quite some changes, but from a quick look I didn't see any new files
> that need to be explicitly handled.

I see that the hash got updated again after this commit, and now it's
broken again for me.
I re-tested on more machines running Fedora 28 or Centos 7, including
one where I had never used Buildroot before, and apparently I even get
different hashes on each for linux-firmware:

ERROR: linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz
has wrong sha256 hash:
ERROR: expected:
b279ca4d086887c2efab13e28a7ca36e409410d3df38a62d7c7b5799ee3de916
ERROR: got     :
12d025328deab2bd2bec489c5f51181db6530cc9eb91d10ef66a55c18c2da8bf

ERROR: linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz
has wrong sha256 hash:
ERROR: expected:
b279ca4d086887c2efab13e28a7ca36e409410d3df38a62d7c7b5799ee3de916
ERROR: got     :
a20e4d92274bceb400f85cae873f05fa24575f69bcee5741c56affdb426b017a

ERROR: linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz
has wrong sha256 hash:
ERROR: expected:
b279ca4d086887c2efab13e28a7ca36e409410d3df38a62d7c7b5799ee3de916
ERROR: got     :
f8047ad77dd71fe05569bdaf29cb9ea7b23ce216f0d8df21b364ba68398de29e


Is there some known cause for this?

Erico
