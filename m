From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 17:36:55 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] package/giflib: add two upstream security fixes
In-Reply-To: <20190819212121.30089-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 19 Aug 2019 23:21:20 +0200")
References: <20190819212121.30089-1-fontaine.fabrice@gmail.com>
Message-ID: <87tv9u1zhk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2018-11490: The DGifDecompressLine function in dgif_lib.c in
 >   GIFLIB (possibly version 3.0.x), as later shipped in cgif.c in sam2p
 >   0.49.4, has a heap-based buffer overflow because a certain
 >   "Private->RunningCode - 2" array index is not checked. This will lead
 >   to a denial of service or possibly unspecified other impact.

 > - Fix CVE-2019-15133: In GIFLIB before 2019-02-16, a malformed GIF file
 >   triggers a divide-by-zero exception in the decoder function DGifSlurp
 >   in dgif_lib.c if the height field of the ImageSize data structure is
 >   equal to zero.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
