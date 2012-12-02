From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 02 Dec 2012 18:12:58 +0100
Subject: [Buildroot] Problems with name resolution
Message-ID: <50BB8C1A.3070107@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

today I faced a strange problem on my BeagleBone:
> # ping localhost
> ping: bad address 'localhost'
After some trying and googling I found that the missing nsswitch.conf
caused this problem.

I am using toolchain Linard 2012_09, which obviously needs this file and
does not provide a useful default.

I do not know if nsswitch.conf is used/needed by all c-libraries, but I
think adding it to the skeleton should not do any harm.

Patch follows.

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
