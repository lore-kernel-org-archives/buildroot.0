From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 19:58:46 +0200
Subject: [Buildroot] [PATCH 2/2] package/nodejs: security bump to
 version v10.16.3
In-Reply-To: <20190912194354.27963-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 12 Sep 2019 21:43:54 +0200")
References: <20190912194354.27963-1-peter@korsgaard.com>
 <20190912194354.27963-2-peter@korsgaard.com>
Message-ID: <87sgokl0kp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - CVE-2019-9511 "Data Dribble": The attacker requests a large amount of data
 >   from a specified resource over multiple streams.  They manipulate window
 >   size and stream priority to force the server to queue the data in 1-byte
 >   chunks.  Depending on how efficiently this data is queued, this can
 >   consume excess CPU, memory, or both, potentially leading to a denial of
 >   service.

 > - CVE-2019-9512 "Ping Flood": The attacker sends continual pings to an
 >   HTTP/2 peer, causing the peer to build an internal queue of responses.
 >   Depending on how efficiently this data is queued, this can consume excess
 >   CPU, memory, or both, potentially leading to a denial of service.

 > - CVE-2019-9513 "Resource Loop": The attacker creates multiple request
 >   streams and continually shuffles the priority of the streams in a way that
 >   causes substantial churn to the priority tree.  This can consume excess
 >   CPU, potentially leading to a denial of service.

 > - CVE-2019-9514 "Reset Flood": The attacker opens a number of streams and
 >   sends an invalid request over each stream that should solicit a stream of
 >   RST_STREAM frames from the peer.  Depending on how the peer queues the
 >   RST_STREAM frames, this can consume excess memory, CPU, or both,
 >   potentially leading to a denial of service.

 > - CVE-2019-9515 "Settings Flood": The attacker sends a stream of SETTINGS
 >   frames to the peer.  Since the RFC requires that the peer reply with one
 >   acknowledgement per SETTINGS frame, an empty SETTINGS frame is almost
 >   equivalent in behavior to a ping.  Depending on how efficiently this data
 >   is queued, this can consume excess CPU, memory, or both, potentially
 >   leading to a denial of service.

 > - CVE-2019-9516 "0-Length Headers Leak": The attacker sends a stream of
 >   headers with a 0-length header name and 0-length header value, optionally
 >   Huffman encoded into 1-byte or greater headers.  Some implementations
 >   allocate memory for these headers and keep the allocation alive until the
 >   session dies.  This can consume excess memory, potentially leading to a
 >   denial of service.

 > - CVE-2019-9517 "Internal Data Buffering": The attacker opens the HTTP/2
 >   window so the peer can send without constraint; however, they leave the
 >   TCP window closed so the peer cannot actually write (many of) the bytes on
 >   the wire.  The attacker then sends a stream of requests for a large
 >   response object.  Depending on how the servers queue the responses, this
 >   can consume excess memory, CPU, or both, potentially leading to a denial
 >   of service.

 > - CVE-2019-9518 "Empty Frames Flood": The attacker sends a stream of frames
 >   with an empty payload and without the end-of-stream flag.  These frames
 >   can be DATA, HEADERS, CONTINUATION and/or PUSH_PROMISE.  The peer spends
 >   time processing each frame disproportionate to attack bandwidth.  This can
 >   consume excess CPU, potentially leading to a denial of service.
 >   (Discovered by Piotr Sikora of Google)

 > Notice that this version bump requires nghttp2 1.39.2.  It also includes an
 > (unconditional) embedded copy of brotli.

 > Update the license hash because of copyright year changes and the addition
 > of the MIT-style license text for large_pages and brotli.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.05.x and 2019.08.x, thanks.

For 2019.08.x I have instead bumped to v8.16.1, which fixes the same
list of issues.

-- 
Bye, Peter Korsgaard
