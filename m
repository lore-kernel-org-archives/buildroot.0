From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Apr 2018 13:46:40 -0300
Subject: [Buildroot] [PATCH 3/7 v4] download/git: quickly exit when the
 cset does not exist
References: <a1eab4b59a5b91b953f2a26bc55b201a4b45dbe9.1524944063.git.yann.morin.1998@free.fr>
Message-ID: <5ae5f6f02c86f_10372b0665ba4244363@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Apr 28, 2018 at 04:34 PM, Yann E. MORIN wrote:

> Check that the given cset is indeed something we can checkout. If not,
> then exit early.
> 
> This will be usefull when a later commit will trap any failing git
> command to try to recover the repository by doing a clone from scratch:
> when the cset is not a commit, it does not mean the repository is broken
> or what, and recloning from scratch would not help, so no need to trash
> a good cache.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[with patches until this one applied: the script bails out when a wrong sha1 or
 wrong tag is used as version for a package, using git versions 1.7.1, 1.8.3,
 2.11.0, 2.14.1]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


Regards,
Ricardo
