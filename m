From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 11:45:05 +0100
Subject: [Buildroot] [PATCH v2/next 1/4] brotli: new package
In-Reply-To: <20180323185942.60252-2-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Fri, 23 Mar 2018 20:59:39 +0200")
References: <20180323185942.60252-1-aperez@igalia.com>
 <20180323185942.60252-2-aperez@igalia.com>
Message-ID: <87y3ih21n2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Add the brotli package to Buildroot. This is needed by woff2, which in
 > turn is needed by webkitgtk from version 2.20.0 onwards. WebKitGTK+ used
 > to bundle a copy of the library, but it stopped doing so now that the
 > upstream has started making releases.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 > +++ b/package/brotli/brotli.hash
 > @@ -0,0 +1,5 @@

 > +# Locally generated:
 > +sha512  93adcf437d730ac403e444285ac8aefbb2c8a6b5e1b064e8ee33684c067287a8159e0ee73d2217c167881e87da73fa494792d963a15508fd42b2ac4a5b52823c  v1.0.3.tar.gz
 > +
 > +# Hash for license files:
 > +sha512  16d7a62757f9854cd0ff9750eb0b374a1360deded0ba1646fde430f79a8f7c36a85f4884faaf1ea90db02537cd8d8c314cfcbcf492be25af24e1e77aa5919ebb  LICENSE

Odd, your license hash didn't match here:

ERROR: LICENSE has wrong sha512 hash:
ERROR: expected: 16d7a62757f9854cd0ff9750eb0b374a1360deded0ba1646fde430f79a8f7c36a85f4884faaf1ea90db02537cd8d8c314cfcbcf492be25af24e1e77aa5919ebb
ERROR: got     : bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
package/brotli/brotli.mk:17: recipe for target 'brotli-legal-info' failed

I've fixed that and committed, thanks.

-- 
Bye, Peter Korsgaard
