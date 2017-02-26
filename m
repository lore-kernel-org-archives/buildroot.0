From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 17:42:49 +0100
Subject: [Buildroot] [PATCH] synergy: Fix build with gcc 6
In-Reply-To: <20170226141620.3449f4c9@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 26 Feb 2017 14:16:20 +0100")
References: <20170225211701.6357-1-peter@korsgaard.com>
 <20170226141620.3449f4c9@free-electrons.com>
Message-ID: <8737f0nbsm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Applied to master, thanks. However, did you notice that the hash we
 > have in Buildroot for synergy-1.3.1.tar.gz does not patch the tarball
 > available from Sourceforge, and therefore we always fallback to
 > downloading from sources.b.n ?

Hmm, no - I didn't. I must have had the tarball locally from earlier.

 > See:

 > Location: https://sourceforge.net/publish/ [following]
 > --2017-02-26 14:15:18--  https://sourceforge.net/publish/

That /publish thing is afaik a new change on sourceforge.


> Connecting to sourceforge.net (sourceforge.net)|216.34.181.60|:443... connected.
 > HTTP request sent, awaiting response... 200 OK
 > Length: 43482 (42K) [text/html]
 > Saving to: ?/home/thomas/projets/buildroot/output/build/.synergy-1.3.1.tar.gz.LebFB4/output?

 > /home/thomas/projets/buildroot/output/build/.synergy
 > 100%[===================================================================================================================>]
 > 42,46K 172KB/s in 0,2s

 > 2017-02-26 14:15:19 (172 KB/s) -
 > ?/home/thomas/projets/buildroot/output/build/.synergy-1.3.1.tar.gz.LebFB4/output?
 > saved [43482/43482]

 > ERROR: synergy-1.3.1.tar.gz has wrong sha256 hash:
 > ERROR: expected: 4a15e26456498dda5f3aa7d688a4892e0c50394a2f01685136fbc954bacc9691
 > ERROR: got     : 062a0b0841486719a474df96c42381910dbc75447ce41e4a2059bef36829b259

It isn't just upstream who have uploaded a new tarball. Apparently there
are some recent changes to sourceforge that causes it to return a HTML
page instead:

file synergy-1.3.1.tar.gz
synergy-1.3.1.tar.gz: HTML document, UTF-8 Unicode text, with very long lines

I checked with another package from sourceforge (c-icap), and that one
is OK.

It seems like synergy is no longer hosted on sourceforge. Accessing the
project page just redirects to symless.com.

It looks like the tarball on github has identical content (but the
tarball doesn't have the same sha256sum), so perhaps we should move to
that:

https://github.com/symless/synergy/releases/tag/1.3.1

-- 
Bye, Peter Korsgaard
