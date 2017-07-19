From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 19 Jul 2017 15:06:21 -0300 (BRT)
Subject: [Buildroot] Build failure with 2017.05.1
Message-ID: <1662234505.617742.1500487581506.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I got this error while building protobuf with Buildroot 2017.05.1:

>>> host-protobuf 3.2.0 Downloading
[...]
--2017-07-18 17:30:20--  https://github.com/google/protobuf/commit/416f90939d4de58fe1a4e2489120010313183291.patch
[...]
ERROR: 416f90939d4de58fe1a4e2489120010313183291.patch has wrong sha256 hash:
ERROR: expected: da80c39838515913633f4cbd875fdd4ad711be95c83a50ff5096b9f1254033b3
ERROR: got     : 61e5b65b65e10f3ae7549b3a38eb30162ef298e387b1779d997ddf3633d63700
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Looks like the "patches downloaded from Github are not stable"
issue already fixed by Thomas Petazzoni in several recipes.

I solved the problem by means of a local change that brings
the patch in the tree.

Should I submit a patch specific for the 2017.05.x branch or it
would be preferable to cherry-pick the commits that bump protobuf
to v3.3.0 from master to 2017.05.x?

-- 
Carlos Santos (Casantos) - DATACOM, P&D
Rua Am?rica, 1000 - Eldorado do Sul, RS, Brasil - 92990-000
casantos at datacom.ind.br          +55 51 3933.3000 ext. 3627
http://www.datacom.ind.br
