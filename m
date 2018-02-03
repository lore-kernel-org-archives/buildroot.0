From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Feb 2018 21:19:05 +0100
Subject: [Buildroot] [PATCH] gcc: Update or1k GCC tarball hash
In-Reply-To: <20180118162526.20572-1-joel@jms.id.au> (Joel Stanley's message
 of "Thu, 18 Jan 2018 10:25:26 -0600")
References: <20180118162526.20572-1-joel@jms.id.au>
Message-ID: <87wozt25dy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:

 > When doing a build today I noticed the GCC tarball from Github has
 > changed hash.

 >>>> host-gcc-initial musl-5.4.0 Downloading
 >   --2018-01-17 10:27:28--  https://github.com/openrisc/or1k-gcc/archive/musl-5.4.0/gcc-musl-5.4.0.tar.gz
 >   Resolving github.com (github.com)... 192.30.253.112, 192.30.253.113
 >   Connecting to github.com (github.com)|192.30.253.112|:443... connected.
 >   HTTP request sent, awaiting response... 302 Found
 >   Location: https://codeload.github.com/openrisc/or1k-gcc/tar.gz/musl-5.4.0 [following]
 >   --2018-01-17 10:27:29--  https://codeload.github.com/openrisc/or1k-gcc/tar.gz/musl-5.4.0
 >   Resolving codeload.github.com (codeload.github.com)... 192.30.253.121, 192.30.253.120
 >   Connecting to codeload.github.com (codeload.github.com)|192.30.253.121|:443... connected.
 >   HTTP request sent, awaiting response... 200 OK
 >   Length: unspecified [application/x-gzip]
 >   Saving to: 'output/build/.gcc-musl-5.4.0.tar.gz.1hqnIC/output?

 >   [        <=>                            ] 107.35M   822KB/s    in 2m 27s

 >   2018-01-17 10:29:58 (748 KB/s) - 'output/build/.gcc-musl-5.4.0.tar.gz.1hqnIC/output? saved [112562068]

 >   ERROR: gcc-musl-5.4.0.tar.gz has wrong sha512 hash:
 >   ERROR: expected: 841101f7de45f327bf2e92f3efc73ca88a021e4b9b541458ce80a16e55882bd8606a8492d75c57c589ee2c10d42ae2865b67690155d7289a541df1d68096402f
 >   ERROR: got     : 1ffbf4ec610b39107e4bb6224682aa6f49513f3fc96c137278b5d56db22db458f08b8b6e78c3940c00116b6e8e158410c1d337f666ec10cfdc4f0b6540b4b428
 >   ERROR: Incomplete download, or man-in-the-middle (MITM) attack

 > Signed-off-by: Joel Stanley <joel@jms.id.au>
 > ---
 > The tarball mirrored on buildroot.net needs to be updated

We cannot really do that as that would break all releases since
2017.02.

Looking around on the github repo I see that musl-5.4.0 is a BRANCH and
not a tag, so that is not really good. There is a
or1k-musl-5.4.0-20170218 tag pointing to the same revision, so I've
instead sent a patch to change to that tag (with a valid hash) and
marked this patch as superseeded:

https://patchwork.ozlabs.org/patch/868941/

-- 
Bye, Peter Korsgaard
