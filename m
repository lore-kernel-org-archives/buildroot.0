From: David J. Fogle <Dave@exitstrategytech.com>
Date: Thu, 6 Dec 2018 00:38:22 +0000
Subject: [Buildroot] Docker client does not function correctly in 2018.11
In-Reply-To: <CA+h8R2orLF5mjc6g8qDwG5Sh0WMXicnLb9DTB_qQiTBoJd45yA@mail.gmail.com>
References: <ac041379a2d04fbeb3900fae7bab51be@exitstrategytech.com>
 <8dcf0b32c7fe49e8b30b10a482f3f23a@exitstrategytech.com>
 <CA+h8R2pH=BTTh+farCMfJOW8dzYsUhN_ompMtc=Aaz4tQVbVXg@mail.gmail.com>
 <5db9d4aa533e4e8590b5c33d2bb47665@exitstrategytech.com>
 <p05ed2odjpa9vgdmd5cx9cew.1544054248971@email.android.com>,
 <CA+h8R2orLF5mjc6g8qDwG5Sh0WMXicnLb9DTB_qQiTBoJd45yA@mail.gmail.com>
Message-ID: <4c6a6d62303a4f6aabb5b0d7bbd8494c@exitstrategytech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I didn't have it enabled on the kernel config, I had assumed it was more or less a default, but it isn't. I am downloading my new build now, then picking up my other half, and I can report back after that. ETA 1 hr.



David Fogle

CTO - Exit Strategy


-------- Original message --------
From: Christian Stewart <christian@paral.in>
Date: 12/5/18 6:36 PM (GMT-06:00)
To: "David J. Fogle" <Dave@exitstrategytech.com>
Cc: Christian Stewart <christian@paral.in>, Matthew Weber <matthew.weber@rockwellcollins.com>, Hamilton Southworth <hamilton@aperturerobotics.com>, buildroot at busybox.net
Subject: Re: Re: Docker client does not function correctly in 2018.11

Hi David,

Please provide your defconfig, the commit hash you built from (of
Buildroot), and any relevant log files.

On Wed, Dec 5, 2018 at 3:57 PM David J. Fogle <Dave@exitstrategytech.com> wrote:
> This also may be due to a lack of any functional docker filesystem drivers, as aufs patches break when applied, and overlay apparently is not usable either.

We have witnessed this issue already, and in fact, it occurs on my
laptop (Gentoo, latest) during the boot-up phase.

Docker will hang for about a minute or two. If I press keys on my
keyboard sometimes it will start up, but it seems to hang with no log
output for a while.

We looked at an strace before (Matthew and I both) and found the issue
to be related to reading random data from the system at startup. Since
Docker starts at the end of the boot-up phase, it seems that something
in this process is causing Docker to either not have enough random
data available from the system, or encounter some other hang.

Overlay works fine, why is it "apparently not usable?" I have multiple
machines running overlay based filesystems with this version of
Docker, including Raspberry Pis and Odroids (ARM machines). They all
suffer from the sporadic Docker hang on start, however.

Best,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181206/b67c451b/attachment.html>
