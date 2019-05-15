From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 15 May 2019 22:17:03 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-14
In-Reply-To: <20190515060039.F045C22920@silver.osuosl.org>
References: <20190515060039.F045C22920@silver.osuosl.org>
Message-ID: <20190515221703.GC32757@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 May 2019 06:00:34 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

>      aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/39ccf985b3121342589167fe8bc0f88735318c28 |     
>      aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/fa8341c0b11c5ef30a4692927e90f64de5bf4e11 |     
>      aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/790c239fee8a59682927cb87ea9c1908a83d3c84 |     

The wpebackend-fdo build failure would go away by applying Giulio's patch:

  https://patchwork.ozlabs.org/patch/1085508/

>          arm |               wpewebkit-2.22.5 | NOK | http://autobuild.buildroot.net/results/645be27edc31037a9b1bb7ce0dc85440949b0846 |     


This build failure of of the wpewebkit package is kind of odd: it looks like
with assertions enabled (as in: doing a debug build) uses some variables which
do not exist, and I wonder why we haven't seen this before?when working on
WebKit we routinely do debug builds ?\_(?)_/? 

I think it is more worth it to push the update to WPE WebKit 2.24.x forward,
and this build failure would just go away.

Regards,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190515/22d82b26/attachment.asc>
