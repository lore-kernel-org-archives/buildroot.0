From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 14:27:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to
 version 2.1.2
In-Reply-To: <20200713131125.895748-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 13 Jul 2020 15:11:25 +0200")
References: <20200713131125.895748-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1t3g2fi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-4030: In FreeRDP before version 2.1.2, there is an out of
 >   bounds read in TrioParse. Logging might bypass string length checks
 >   due to an integer overflow.
 > - Fix CVE-2020-4031: In FreeRDP before version 2.1.2, there is a
 >   use-after-free in gdi_SelectObject. All FreeRDP clients using
 >   compatibility mode with /relax-order-checks are affected.
 > - Fix CVE-2020-4032: In FreeRDP before version 2.1.2, there is an
 >   integer casting vulnerability in update_recv_secondary_order. All
 >   clients with +glyph-cache /relax-order-checks are affected.
 > - Fix CVE-2020-4033: In FreeRDP before version 2.1.2, there is an out of
 >   bounds read in RLEDECOMPRESS. All FreeRDP based clients with sessions
 >   with color depth < 32 are affected.
 > - Fix CVE-2020-11095: In FreeRDP before version 2.1.2, an out of bound
 >   reads occurs resulting in accessing a memory location that is outside
 >   of the boundaries of the static array
 >   PRIMARY_DRAWING_ORDER_FIELD_BYTES.
 > - Fix CVE-2020-11096: In FreeRDP before version 2.1.2, there is a global
 >   OOB read in update_read_cache_bitmap_v3_order. As a workaround, one
 >   can disable bitmap cache with -bitmap-cache (default).
 > - Fix CVE-2020-11097: In FreeRDP before version 2.1.2, an out of bounds
 >   read occurs resulting in accessing a memory location that is outside
 >   of the boundaries of the static array
 >   PRIMARY_DRAWING_ORDER_FIELD_BYTES.
 > - Fix CVE-2020-11098: In FreeRDP before version 2.1.2, there is an
 >   out-of-bound read in glyph_cache_put. This affects all FreeRDP clients
 >   with `+glyph-cache` option enabled.
 > - Fix CVE-2020-11099: In FreeRDP before version 2.1.2, there is an out
 >   of bounds read in license_read_new_or_upgrade_license_packet. A
 >   manipulated license packet can lead to out of bound reads to an
 >   internal buffer.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
