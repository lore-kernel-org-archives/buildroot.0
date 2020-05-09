From: Andreas Ziegler <br015@umbiko.net>
Date: Sat, 09 May 2020 18:54:34 +0000
Subject: [Buildroot] Help: to understand build root
In-Reply-To: <CACEFAc1yzctCtQ5ErMS_NR1R3TAMDU+8JddbisTLKakTeLGURg@mail.gmail.com>
References: <mailman.3803.1589018066.59095.buildroot@busybox.net>
 <d1e5de0ccecc4ca2020f5efbe473cb2d@umbiko.net>
 <CACEFAc1yzctCtQ5ErMS_NR1R3TAMDU+8JddbisTLKakTeLGURg@mail.gmail.com>
Message-ID: <d55a9c8e17a3531c83d5644d27ce875d@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kunal,

I still have no clue what type of environment you are actually using, so 
part of this is just guessing.

On 2020-05-09 18:14, Kunal Chauhan wrote:
> Hi team,
> 
> Please need some clarity on some points
> 
> 1.  If as a developer can i compile a single binary and test it
> without running or compiling whole firware image.?

You can certainly modify and compile a single binary. If you have a 
running system, you can deploy it separately by copying it to it's 
proper location on the target system (e.g replace the last version with 
the new one). sftp is your friend.

> 2. How firmware image extracts all binaries to system or to target
> harware?

The internal structure of the firmware image depends on how it is built. 
A Buildroot image contains at least a Linux kernel and a root 
filesystem. Buildroot supports various formats, for example cpio, 
tarball or bootable disk image. A mechanism for auto-deployment is not 
included, normally you copy a file to a pre-determined location or use 
dd to flash a device.

Kind regards,
Andreas
