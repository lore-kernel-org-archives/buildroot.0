From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Fri, 26 Nov 2010 20:37:32 +0200
Subject: [Buildroot] handling package souce in .zip file
Message-ID: <AANLkTinM+8TXLvddMZopiOOV_i-GR2+-z-k8s_6WY_UJ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I want to add package, but its source is available only in zip format :(

I was thinking how to handle zip, but I don't have preference:
1. Not generic methods, since this may be the only package with zip:
a) add possibility to override the whole extraction procedure.
b) add post download hook, and repackage this zip as tar.
2. Generic method:
a) add very hacky INFLATE.zip which will repackage zip as tar.
b) add special handling for INFLATE.zip without involving tar.

Repackaging zip as tar is a headache, since it is not possible to
pipe unzip output to tar. So one has to extract zip to some dir and
then tar this dir and delete dir after taring.
Extracting zip without tar is also a little bit problematic since unzip
has no equivalent option for --strip-path/--strip-components
So maybe it is not possible to make generic support...

What do you guys think?
