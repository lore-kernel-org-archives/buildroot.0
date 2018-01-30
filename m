From: Gani Suresh <sureshgani@gmail.com>
Date: Tue, 30 Jan 2018 22:17:50 +0530
Subject: [Buildroot] Disable e2fsprogfs utilities chattr and lsattr
Message-ID: <CAN+Pz6N=Artes_iA=aDj+Dd_yfLQw1QM8_iFKgEiLQVLfM+5jQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All

We have a requirement to avoid the vulnerability of our system. So, we are
planning to disable *chattr* and *lsattr* when *e2fsprogs* package is built.

Until, e2fsprogs version 1.43.1 these utilities were optional in building
i.e. there were separate build flags(*e.g BR2_PACKAGE_E2FSPROGS_CHATTR*) to
enable/disable the same. In below, commit these flags were removed to
enable these utilities by default. Then, we can remove the binaries in our
post installation processing. Please clarify our question below.



*Are these utilities used by the binaries built as part of e2fsprogs
package or some other programs ? If so, what is the impact of removing
these binaries from the target ?*



author

Carlos Santos <casantos@datacom.ind.br>

2017-04-22 22:49:13 (GMT)

committer

Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

2017-05-04 20:26:57 (GMT)

commit

742d6bf13e5bddc5e30edeb8b8c314f47cf97e4d
<https://git.busybox.net/buildroot/commit/package/e2fsprogs?id=742d6bf13e5bddc5e30edeb8b8c314f47cf97e4d>
(patch
<https://git.busybox.net/buildroot/patch/package/e2fsprogs?id=742d6bf13e5bddc5e30edeb8b8c314f47cf97e4d>
)

tree

81d4787890cbf7bd3b0fcb28e1da61a5199854c5
<https://git.busybox.net/buildroot/tree/?id=742d6bf13e5bddc5e30edeb8b8c314f47cf97e4d>
/package/e2fsprogs
<https://git.busybox.net/buildroot/tree/package/e2fsprogs?id=742d6bf13e5bddc5e30edeb8b8c314f47cf97e4d>

parent

e88995f065986dc56ce5a7c222f7a9f6cbff2b94
<https://git.busybox.net/buildroot/commit/package/e2fsprogs?id=e88995f065986dc56ce5a7c222f7a9f6cbff2b94>
(diff
<https://git.busybox.net/buildroot/diff/package/e2fsprogs?id=742d6bf13e5bddc5e30edeb8b8c314f47cf97e4d&id2=e88995f065986dc56ce5a7c222f7a9f6cbff2b94>
)

download

buildroot-742d6bf13e5bddc5e30edeb8b8c314f47cf97e4d.tar.gz
<https://git.busybox.net/buildroot/snapshot/buildroot-742d6bf13e5bddc5e30edeb8b8c314f47cf97e4d.tar.gz>
buildroot-742d6bf13e5bddc5e30edeb8b8c314f47cf97e4d.tar.bz2
<https://git.busybox.net/buildroot/snapshot/buildroot-742d6bf13e5bddc5e30edeb8b8c314f47cf97e4d.tar.bz2>


-- 

Thanks & Regards
   Suresh S. Gani

   NAGRA
   RMZ Centennial , # 8A,8B,8C &8D Tower D unit 402
   Opp Graphite India, Mahadevapura Post ITPL Road
   560048 Bangalore
   India
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180130/72e894d8/attachment.html>
