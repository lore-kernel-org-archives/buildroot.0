From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Jan 2018 22:48:08 +0100
Subject: [Buildroot] [PATCH 2/2 v2] package/matchbox-lib: correctly fix
 the .pc file
In-Reply-To: <92f0878e530274e8e883f96c4eee06f4dce7241e.1514045682.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 23 Dec 2017 17:15:40 +0100")
References: <cover.1514045682.git.yann.morin.1998@free.fr>
 <92f0878e530274e8e883f96c4eee06f4dce7241e.1514045682.git.yann.morin.1998@free.fr>
Message-ID: <87y3l8owdj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > First, the .pc file was so far fixed as a post-configure hook of the
 > matchbox-fakekey package, by directly tweaking the .pc file installed in
 > staging by matchbox-lib. That's uterly wrong and bad.

 > So, we move the fix to matchbox-lib.

 > Second, it was incorreclty tweaking the .pc file when xlib_libXft was
 > not enabled, because only then a path to staging was present.

 > Third, even when xlib_libXft was enabled, the tweaking was still wrong,
 > because unnecessary.

 > Fix all that.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > Changes v1 -> v2:
 >   - fix existing hook, rather than adding a new one

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
